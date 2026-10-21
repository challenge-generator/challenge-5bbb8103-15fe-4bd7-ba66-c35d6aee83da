# language: es
Característica: Gestión de Solicitudes de Crédito
  Como analista de integración
  Quiero gestionar solicitudes de crédito a través de una API SOA
  Para asegurar la interoperabilidad entre sistemas financieros

  Antecedentes:
    Dado que el sistema de origen envía solicitudes con los siguientes datos:
      | campo_origen          | valor_origen               |
      | id_solicitud          | SOL-2023-0001              |
      | tipo_solicitud        | PERSONAL                   |
      | monto_solicitado      | 15000000.50                |
      | plazo_meses           | 36                         |
      | tasa_interes          | 12.50                      |
      | fecha_solicitud       | 2023-10-15                 |
      | identificacion_cliente| 1020304050                 |
      | tipo_identificacion   | CC                         |
      | nombre_cliente        | Juan Pérez                 |
      | email_cliente         | juan.perez@example.com     |
      | telefono_cliente      | 3101234567                 |
      | estado_solicitud      | EN_PROCESO                 |

  Escenario: Crear una solicitud de crédito con datos válidos
    Dado que el cliente "Juan Pérez" con identificación "1020304050" existe en el sistema
    Y el sistema de origen envía una solicitud con los datos mencionados
    Cuando se envía una petición POST a "/api/solicitudes" con los datos transformados
    Entonces el sistema debe responder con código 201 (Created)
    Y la respuesta debe contener:
      | campo                | valor_esperado                          |
      | id                   | UUID válido                             |
      | loan_type            | "PERSONAL"                            |
      | amount               | 15000000.50                             |
      | term_months          | 36                                      |
      | interest_rate        | 0.1250                                  |
      | request_date         | Fecha actual en formato ISO 8601 UTC   |
      | customer_id          | "1020304050"                           |
      | id_type              | "CC"                                  |
      | customer_name        | "Juan Pérez"                           |
      | email                | "juan.perez@example.com"              |
      | phone                | "+573101234567"                        |
      | status               | "PENDING"                             |

  Escenario: Validar campos obligatorios faltantes
    Dado que el sistema de origen envía una solicitud sin el campo "tipo_solicitud"
    Cuando se envía una petición POST a "/api/solicitudes"
    Entonces el sistema debe responder con código 400 (Bad Request)
    Y la respuesta debe contener un mensaje de error: "El campo 'tipo_solicitud' es obligatorio"

  Escenario: Validar formato de email inválido
    Dado que el sistema de origen envía una solicitud con email "juan.perez@example"
    Cuando se envía una petición POST a "/api/solicitudes"
    Entonces el sistema debe responder con código 400 (Bad Request)
    Y la respuesta debe contener un mensaje de error: "El campo 'email_cliente' debe ser una dirección de email válida"

  Escenario: Validar formato de teléfono internacional
    Dado que el sistema de origen envía una solicitud con teléfono "3101234567"
    Cuando el sistema transforma el campo a formato internacional
    Entonces el campo "phone" debe ser "+573101234567"

  Escenario: Conversión de tasa de interés
    Dado que el sistema de origen envía una tasa de interés de 12.50%
    Cuando el sistema transforma el campo
    Entonces el campo "interest_rate" debe ser 0.1250

  Escenario: Solicitud con estado aprobado
    Dado que el sistema de origen envía una solicitud con estado "APROBADO" y fecha de aprobación
    Cuando se envía una petición POST a "/api/solicitudes"
    Entonces el sistema debe responder con código 201 (Created)
    Y la respuesta debe contener:
      | campo            | valor_esperado                          |
      | status           | "APPROVED"                            |
      | approval_date    | Fecha de aprobación en formato ISO 8601 UTC |

  Escenario: Solicitud con estado rechazado
    Dado que el sistema de origen envía una solicitud con estado "RECHAZADO" y motivo de rechazo
    Cuando se envía una petición POST a "/api/solicitudes"
    Entonces el sistema debe responder con código 201 (Created)
    Y la respuesta debe contener:
      | campo             | valor_esperado                          |
      | status            | "REJECTED"                            |
      | rejection_reason  | "INFORMATION_INCOMPLETE"              |

  Escenario: Consulta de historial crediticio exitoso
    Dado que el cliente "Juan Pérez" tiene un historial crediticio registrado
    Cuando se envía una petición GET a "/api/clientes/1020304050/historial"
    Entonces el sistema debe responder con código 200 (OK)
    Y la respuesta debe contener:
      | campo                | valor_esperado                          |
      | customer_id          | "1020304050"                           |
      | credit_score         | 750                                     |
      | payment_capacity     | "HIGH"                                |
      | last_request_date    | Fecha de la última solicitud en formato ISO 8601 UTC |

  Escenario: Consulta de historial crediticio no encontrado
    Dado que el cliente "Pedro Gómez" no tiene historial crediticio registrado
    Cuando se envía una petición GET a "/api/clientes/9876543210/historial"
    Entonces el sistema debe responder con código 404 (Not Found)
    Y la respuesta debe contener un mensaje de error: "Historial crediticio no encontrado para el cliente"

  Escenario: Validar idempotencia en creación de solicitudes
    Dado que ya existe una solicitud con id_solicitud "SOL-2023-0001"
    Cuando se envía una petición POST duplicada a "/api/solicitudes" con el mismo id_solicitud
    Entonces el sistema debe responder con código 409 (Conflict)
    Y la respuesta debe contener un mensaje de error: "Ya existe una solicitud con este identificador"