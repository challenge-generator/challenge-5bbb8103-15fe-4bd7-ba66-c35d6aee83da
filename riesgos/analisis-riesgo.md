# Análisis de Riesgo para Integración SOA - API de Solicitudes de Crédito

## 1. Introducción
Este documento identifica los riesgos asociados a la integración entre el sistema de origen y la API de solicitudes de crédito, evaluando su probabilidad, severidad e impacto en el negocio. Se proponen estrategias de mitigación para cada riesgo identificado.

## 2. Metodología de Evaluación
- **Probabilidad**: Alta (81-100%), Media (31-80%), Baja (0-30%)
- **Severidad**: Alta (Impacto significativo en negocio), Media (Impacto moderado), Baja (Impacto menor)
- **Impacto**: Evaluado en términos de disponibilidad, integridad y confidencialidad

## 3. Riesgos Identificados

### 3.1. Timeout en Servicio de Buró de Crédito
- **Descripción**: El servicio externo de buró de crédito puede no responder dentro del tiempo esperado (SLA: 2 segundos), causando retrasos en la evaluación de solicitudes.
- **Probabilidad**: Media (50%)
- **Severidad**: Alta
- **Impacto**:
  - **Disponibilidad**: Las solicitudes quedan en estado "EN_PROCESO" sin poder avanzar.
  - **Integridad**: Datos incompletos en la evaluación de riesgo crediticio.
  - **Negocio**: Retraso en la aprobación/rechazo de solicitudes, insatisfacción del cliente.
- **Mitigación**:
  - Implementar patrón de retry con backoff exponencial (máximo 3 intentos).
  - Establecer un timeout de 3 segundos y usar circuito breaker (ej. patrón Resilience4j).
  - Cachear respuestas del buró por 24 horas para solicitudes repetidas del mismo cliente.
  - Notificar al equipo de monitoreo cuando el 10% de las llamadas fallen por timeout.

### 3.2. Inconsistencia en Mapeo de Datos
- **Descripción**: Diferencias en el formato de datos entre el sistema origen y la API destino (ej. fechas en formato DD/MM/YYYY vs ISO 8601).
- **Probabilidad**: Alta (70%)
- **Severidad**: Media
- **Impacto**:
  - **Integridad**: Datos corruptos o incompletos en la base de datos destino.
  - **Negocio**: Errores en la evaluación de solicitudes, posibles rechazos incorrectos.
- **Mitigación**:
  - Implementar validación estricta de schemas en la capa de transformación.
  - Usar librerías de parsing robustas (ej. `date-fns` para fechas).
  - Incluir ejemplos concretos en el `mapeo-datos.csv` para cada campo.
  - Realizar pruebas de integración con datos reales antes del despliegue.

### 3.3. Sobrecarga del Endpoint de Consulta de Historial
- **Descripción**: Alta demanda en el endpoint `/api/clientes/{id}/historial` durante horas pico, causando degradación del servicio.
- **Probabilidad**: Media (40%)
- **Severidad**: Alta
- **Impacto**:
  - **Disponibilidad**: Lentitud o caída del servicio.
  - **Negocio**: Pérdida de confianza en la plataforma, clientes abandonan el proceso.
- **Mitigación**:
  - Implementar rate limiting (ej. 100 peticiones/minuto por IP).
  - Cachear respuestas por 5 minutos con clave `{customer_id}`.
  - Escalar horizontalmente el servicio durante horas pico.
  - Usar paginación para consultas masivas.

### 3.4. Fallo en la Generación de UUID
- **Descripción**: El servicio de generación de UUIDs (para `id`) falla, causando duplicados o IDs inválidos.
- **Probabilidad**: Baja (10%)
- **Severidad**: Alta
- **Impacto**:
  - **Integridad**: Duplicidad de solicitudes en la base de datos.
  - **Negocio**: Imposibilidad de rastrear solicitudes, problemas legales.
- **Mitigación**:
  - Usar librerías estándar para generación de UUIDs (ej. `uuid` en Node.js).
  - Validar unicidad del UUID antes de persistir.
  - Implementar idempotencia en el endpoint de creación de solicitudes.

### 3.5. Errores en la Transformación de Tasa de Interés
- **Descripción**: La conversión de tasa de interés de porcentaje a decimal (ej. 12.50% → 0.1250) falla por errores de formato.
- **Probabilidad**: Media (30%)
- **Severidad**: Media
- **Impacto**:
  - **Integridad**: Tasas incorrectas en la base de datos, afectando cálculos financieros.
  - **Negocio**: Cobros incorrectos a clientes, posibles pérdidas financieras.
- **Mitigación**:
  - Validar que el campo `tasa_interes` sea un número con exactamente 2 decimales.
  - Usar redondeo para evitar errores de precisión.
  - Incluir pruebas automatizadas para la transformación.

### 3.6. Fallo en la Validación de Email
- **Descripción**: El sistema acepta emails inválidos (ej. sin dominio) por validación insuficiente.
- **Probabilidad**: Media (25%)
- **Severidad**: Baja
- **Impacto**:
  - **Integridad**: Datos de contacto inválidos.
  - **Negocio**: Imposibilidad de contactar al cliente para notificaciones.
- **Mitigación**:
  - Usar expresiones regulares robustas para validar formato de email.
  - Implementar validación en dos capas: frontend y backend.
  - Enviar correo de verificación al cliente antes de aprobar la solicitud.

### 3.7. Problemas de Idempotencia
- **Descripción**: El mismo `id_solicitud` es procesado múltiples veces, creando duplicados en la base de datos.
- **Probabilidad**: Alta (60%)
- **Severidad**: Alta
- **Impacto**:
  - **Integridad**: Solicitudes duplicadas.
  - **Negocio**: Evaluaciones repetidas, posible fraude.
- **Mitigación**:
  - Implementar clave de idempotencia usando `id_solicitud`.
  - Usar código HTTP 409 (Conflict) para solicitudes duplicadas.
  - Registrar IDs procesados en una tabla temporal con TTL de 24 horas.

### 3.8. Fallo en la Comunicación con el Sistema de Origen
- **Descripción**: El sistema de origen no envía los datos requeridos o falla durante el envío.
- **Probabilidad**: Media (40%)
- **Severidad**: Alta
- **Impacto**:
  - **Disponibilidad**: Solicitudes no procesadas.
  - **Negocio**: Pérdida de oportunidades de negocio.
- **Mitigación**:
  - Implementar colas de mensajería (ej. RabbitMQ) para desacoplar sistemas.
  - Usar patrón Outbox para garantizar entrega.
  - Notificar al equipo de soporte cuando fallen más del 5% de las solicitudes.

## 4. Matriz de Riesgos
| Riesgo                                     | Probabilidad | Severidad | Impacto           | Estrategia de Mitigación                          |
|--------------------------------------------|--------------|-----------|-------------------|--------------------------------------------------|
| Timeout en Buró de Crédito                 | Media        | Alta      | Disponibilidad    | Retry + Circuit Breaker + Caching                |
| Inconsistencia en Mapeo de Datos           | Alta         | Media     | Integridad        | Validación de schemas + Pruebas con datos reales |
| Sobrecarga en Consulta de Historial        | Media        | Alta      | Disponibilidad    | Rate Limiting + Caching + Escalado horizontal    |
| Fallo en Generación de UUID                | Baja         | Alta      | Integridad        | Librerías estándar + Validación de unicidad      |
| Errores en Transformación de Tasa de Interés| Media        | Media     | Integridad        | Validación + Redondeo + Pruebas automatizadas    |
| Fallo en Validación de Email               | Media        | Baja      | Integridad        | Regex robusta + Validación en dos capas          |
| Problemas de Idempotencia                  | Alta         | Alta      | Integridad        | Clave de idempotencia + HTTP 409                 |
| Fallo en Comunicación con Sistema de Origen| Media        | Alta      | Disponibilidad    | Colas de mensajería + Patrón Outbox              |

## 5. Recomendaciones Adicionales
1. **Monitoreo Continuo**: Implementar dashboards para rastrear métricas clave:
   - Tiempo de respuesta de endpoints.
   - Tasa de error en llamadas al buró de crédito.
   - Número de solicitudes duplicadas.

2. **Pruebas de Resiliencia**: Realizar pruebas de caos para validar:
   - Comportamiento ante fallos en dependencias.
   - Recuperación después de caídas.

3. **Documentación de Operaciones**: Mantener actualizados:
   - Runbooks para manejo de incidentes.
   - Scripts de recuperación de datos.

4. **Capacitación**: Entrenar al equipo en:
   - Patrones de resiliencia (Circuit Breaker, Retry, Bulkhead).
   - Herramientas de monitoreo (Prometheus, Grafana).

## 6. Conclusión
La implementación de las estrategias de mitigación propuestas reducirá significativamente el riesgo de fallos en la integración SOA. Se recomienda priorizar los riesgos con severidad "Alta" y probabilidad "Media/Alta" para garantizar la estabilidad del sistema y la satisfacción del cliente.