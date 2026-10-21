# Flujo de Negocio: Solicitud de Crédito

## Descripción General
Este flujo describe el proceso de negocio para el registro, validación y aprobación/rechazo de solicitudes de crédito en una fintech.
Incluye la interacción con actores externos como el motor antifraude y el buró de riesgos.

## Actores
- **Originador de Créditos**: Encargado de registrar la solicitud.
- **Motor Antifraude**: Servicio externo que valida posibles fraudes.
- **Buró de Riesgos**: Servicio externo que evalúa el perfil crediticio del solicitante.
- **Motor de Decisión**: Componente interno que determina si la solicitud es aprobada o rechazada.

## Diagrama BPMN
```
[BPMN]
startEvent(id="inicio", name="Inicio") -->
userTask(id="registrarSolicitud", name="Registrar solicitud", actor="Originador de Créditos") -->
serviceTask(id="validarIdempotencia", name="Validar idempotencia", implementation="Servicio de Idempotencia") -->
gateway(id="gatewayIdempotencia", name="¿Solicitud duplicada?")

gatewayIdempotencia --> |Sí| endEvent(id="finSolicitudDuplicada", name="Fin (Solicitud duplicada)")
gatewayIdempotencia --> |No| serviceTask(id="validarAntifraude", name="Validar antifraude", implementation="Motor Antifraude")

validarAntifraude --> gateway(id="gatewayAntifraude", name="¿Aprobado antifraude?")
gatewayAntifraude --> |No| endEvent(id="finRechazadoAntifraude", name="Fin (Rechazado por antifraude)")
gatewayAntifraude --> |Sí| serviceTask(id="validarBureauRiesgo", name="Validar buró de riesgos", implementation="Buró de Riesgos")

validarBureauRiesgo --> gateway(id="gatewayBureau", name="¿Aprobado buró?")
gatewayBureau --> |No| endEvent(id="finRechazadoBureau", name="Fin (Rechazado por buró)")
gatewayBureau --> |Sí| serviceTask(id="evaluarSolicitud", name="Evaluar solicitud", implementation="Motor de Decisión")

evaluarSolicitud --> gateway(id="gatewayDecision", name="¿Aprobada?")
gatewayDecision --> |No| endEvent(id="finRechazado", name="Fin (Rechazado)")
gatewayDecision --> |Sí| serviceTask(id="notificarCliente", name="Notificar cliente", implementation="Servicio de Notificaciones") -->
endEvent(id="finAprobado", name="Fin (Aprobado)")
```

## Reglas de Negocio

### Idempotencia
- **Regla**: Una solicitud con el mismo `idSolicitud` no puede registrarse más de una vez.
- **Implementación**: El servicio de idempotencia verifica si ya existe una solicitud con el mismo ID.
- **Código de error**: `409 Conflict` con código `SOLICITUD_DUPLICADA`.

### Validación de Datos
- **Regla**: Todos los campos obligatorios deben estar presentes y cumplir con las validaciones.
  - `montoSolicitado`: Mayor a 1,000,000 COP y menor a 50,000,000 COP.
  - `plazoMeses`: Entre 6 y 72 meses.
  - `ingresosMensuales`: Mayor o igual a 1,000,000 COP.
- **Código de error**: `400 Bad Request` con código `VALIDACION_ERROR`.

### Validación Antifraude
- **Regla**: El motor antifraude evalúa patrones sospechosos (ej. solicitudes desde IPs de alto riesgo, datos inconsistentes).
- **Código de error**: `403 Forbidden` con código `ANTIFRAUDE_RECHAZADO`.

### Validación de Buró de Riesgos
- **Regla**: El buró de riesgos evalúa el perfil crediticio del solicitante.
  - **Score de riesgo**: Entre 0 y 1000. Se rechaza si el score es menor a 500.
  - **Deudas activas**: Se rechaza si tiene más de 3 deudas activas.
  - **Monto deudas**: Se rechaza si el monto total de deudas supera el 50% de los ingresos mensuales.
- **Código de error**: `403 Forbidden` con código `BUREAU_RECHAZADO`.

### Evaluación de Solicitud
- **Regla**: El motor de decisión aprueba la solicitud si:
  - El score de riesgo es mayor o igual a 650.
  - Los ingresos mensuales son al menos el 30% del monto solicitado.
  - El plazo no supera los 36 meses para montos mayores a 20,000,000 COP.
- **Código de éxito**: `201 Created` con estado `APROBADA`.

## Puntos de Decisión
| Punto de Decisión          | Condición                                  | Resultado                                                                 |
|----------------------------|-------------------------------------------|---------------------------------------------------------------------------|
| ¿Solicitud duplicada?      | Existe solicitud con mismo `idSolicitud`  | Rechazar con `409 Conflict` y código `SOLICITUD_DUPLICADA`               |
| ¿Aprobado antifraude?      | Motor antifraude retorna `APROBADO`       | Continuar a validación de buró de riesgos                                |
|                            | Motor antifraude retorna `RECHAZADO`      | Rechazar con `403 Forbidden` y código `ANTIFRAUDE_RECHAZADO`             |
| ¿Aprobado buró?           | Score >= 500 y deudas <= 3                | Continuar a evaluación de solicitud                                       |
|                            | Score < 500 o deudas > 3                  | Rechazar con `403 Forbidden` y código `BUREAU_RECHAZADO`                 |
| ¿Aprobada?                | Cumple reglas del motor de decisión       | Aprobar con `201 Created` y estado `APROBADA`                            |
|                            | No cumple reglas                          | Rechazar con `201 Created` y estado `RECHAZADA`                          |

## Manejo de Fallos
- **Timeout en buró de riesgos**: Si el servicio externo no responde en 5 segundos, se reintenta 2 veces. Si falla, se marca la validación como `PENDIENTE` y se notifica al equipo de soporte.
- **Error interno**: Cualquier error no manejado retorna `500 Internal Server Error` con código `ERROR_INTERNO`.

## Ejemplo de Flujo
1. El **Originador de Créditos** registra una solicitud con:
   - `idSolicitud`: `a1b2c3d4-5678-90ef-ghij-klmnopqrstuv`
   - `montoSolicitado`: 5,000,000 COP
   - `ingresosMensuales`: 3,000,000 COP
2. El servicio de **idempotencia** verifica que no existe otra solicitud con el mismo ID.
3. El **motor antifraude** valida la solicitud y retorna `APROBADO`.
4. El **buró de riesgos** consulta el perfil del solicitante y retorna:
   - `scoreRiesgo`: 750
   - `deudasActivas`: 1
   - `recomendacion`: `APROBAR_CON_CONDICIONES`
5. El **motor de decisión** evalúa la solicitud y aprueba con:
   - `montoAprobado`: 4,500,000 COP
6. El **servicio de notificaciones** envía un correo al cliente con la decisión.