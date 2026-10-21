# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener un ZIP con el proyecto completo y arrancable.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `api/openapi.yaml` — El topic pide el contrato de API: openapi.yaml es el ejercicio.

## Como saber que terminaste

```bash
npx --yes @redocly/cli lint api/openapi.yaml
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Integración, Especialidad Analista SOA, Tecnología SOA, Junior

### Brecha de conocimiento
Creacion y mantenimientos de API, Servicios o microservicios. ¿Qué es la documentación de una API y por qué es crucial? Explica cómo se implementa patron de bajo acoplamiento. Cual es el ciclo de vida de las API

### Misión / candidato
Candidato en etapa Junior, desarrollando skills en análisis SOA e integración

### Reto
- Tema: Implementación SOA - API - MicroServicios
- Seniority: junior-l1
- Tipo: practical
- Título: Desarrollo de Habilidades en Análisis SOA e Integración
- Tiempo estimado: 15 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Diseño de API — objetivo: Crear un diseño conceptual de una API que cumpla con los requisitos del dominio de fintech. — entregable (NO resolver): Documento de diseño de la API que incluya los actores, operaciones, reglas de negocio y validaciones.
- Fase 2: Implementación de API — objetivo: Implementar la API diseñada en la fase anterior, asegurando un bajo acoplamiento entre los componentes. — entregable (NO resolver): API implementada con endpoints, validaciones y reglas de negocio, asegurando un bajo acoplamiento.
- Fase 3: Documentación y Ciclo de Vida de la API — objetivo: Documentar la API implementada y entender el ciclo de vida de las APIs en el contexto de SOA. — entregable (NO resolver): Documentación técnica de la API y descripción del ciclo de vida de las APIs en el contexto de SOA.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (ZIP).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Exportación en ZIP
Empaqueta todos los archivos en un único archivo ZIP descargable respetando exactamente
la estructura de rutas indicada por los marcadores.
El ZIP debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: El ZIP debe estar listo para descargar al finalizar. No preguntes si el usuario
quiere generarlo. Simplemente genera el archivo y proporciona el enlace de descarga; No debes desplegar en el chat el resumen de lo que arreglaste al Zip, solo entregalo.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del enlace de descarga del ZIP
No preguntes si el usuario quiere el ZIP: simplemente generalo siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: api/openapi.yaml ===
openapi: 3.1.0
info:
  title: Fintech Loan Services API
  description: |
    API para la gestión de solicitudes de préstamos en una fintech.
    Permite la creación, consulta y actualización de solicitudes de préstamo,
    así como la integración con sistemas externos para validación de crédito.
  version: 1.0.0
  contact:
    name: Equipo de Integración Fintech
    email: integracion@fintech.com
  license:
    name: Propietario
servers:
  - url: https://api.fintech.com/v1
    description: Servidor de producción
  - url: https://sandbox.api.fintech.com/v1
    description: Servidor de pruebas
paths:
  /loans:
    post:
      tags:
        - Préstamos
      summary: Crear una nueva solicitud de préstamo
      description: |
        Crea una nueva solicitud de préstamo con los datos proporcionados.
        Se validan los datos del solicitante y se integra con un servicio externo
        para evaluar el riesgo crediticio.
      operationId: createLoanRequest
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/LoanRequest'
            examples:
              solicitud_valida:
                value:
                  customerId: "cust-123e4567-e89b-12d3-a456-426614174000"
                  amount: 5000000
                  termMonths: 24
                  purpose: "CONSOLIDACION_DE_DEUDAS"
                  income: 3000000
                  employmentStatus: "EMPLEADO"
                  creditScore: 720
      responses:
        "201":
          description: Solicitud de préstamo creada exitosamente
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/LoanResponse'
              examples:
                exito:
                  value:
                    loanId: "loan-123e4567-e89b-12d3-a456-426614174000"
                    status: "EN_PROCESO"
                    approvalPercentage: 75
        "400":
          description: Datos inválidos en la solicitud
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                datos_invalidos:
                  value:
                    errorCode: "VALIDATION_ERROR"
                    message: "El monto solicitado excede el límite permitido"
                    details:
                      - field: "amount"
                        message: "Debe ser menor o igual a 20000000"
        "401":
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                no_autorizado:
                  value:
                    errorCode: "UNAUTHORIZED"
                    message: "Token de autenticación no proporcionado o inválido"
        "409":
          description: Conflicto por solicitud duplicada
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                duplicado:
                  value:
                    errorCode: "DUPLICATE_REQUEST"
                    message: "Ya existe una solicitud activa para este cliente"
        "500":
          description: Error interno del servidor
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                error_interno:
                  value:
                    errorCode: "INTERNAL_ERROR"
                    message: "Error inesperado al procesar la solicitud"
    get:
      tags:
        - Préstamos
      summary: Consultar solicitudes de préstamo
      description: |
        Obtiene la lista de solicitudes de préstamo filtradas por parámetros.
        Permite filtrar por estado, cliente, rango de fechas y otros criterios.
      operationId: getLoanRequests
      parameters:
        - name: customerId
          in: query
          description: ID del cliente para filtrar solicitudes
          required: false
          schema:
            type: string
            format: uuid
            example: "cust-123e4567-e89b-12d3-a456-426614174000"
        - name: status
          in: query
          description: Estado de la solicitud para filtrar
          required: false
          schema:
            type: string
            enum: ["EN_PROCESO", "APROBADO", "RECHAZADO", "DESEMBOLSADO"]
        - name: startDate
          in: query
          description: Fecha de inicio para filtrar solicitudes (YYYY-MM-DD)
          required: false
          schema:
            type: string
            format: date
        - name: endDate
          in: query
          description: Fecha de fin para filtrar solicitudes (YYYY-MM-DD)
          required: false
          schema:
            type: string
            format: date
      responses:
        "200":
          description: Lista de solicitudes de préstamo
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/LoanResponse'
              examples:
                lista_solicitudes:
                  value:
                    - loanId: "loan-123e4567-e89b-12d3-a456-426614174000"
                      status: "EN_PROCESO"
                      customerId: "cust-123e4567-e89b-12d3-a456-426614174000"
                      amount: 5000000
                      termMonths: 24
                      createdAt: "2023-10-15T10:00:00Z"
                      updatedAt: "2023-10-15T10:05:00Z"
                    - loanId: "loan-456e7890-e89b-12d3-a456-426614174001"
                      status: "APROBADO"
                      customerId: "cust-456e7890-e89b-12d3-a456-426614174001"
                      amount: 8000000
                      termMonths: 36
                      createdAt: "2023-10-14T09:30:00Z"
                      updatedAt: "2023-10-14T09:45:00Z"
        "400":
          description: Parámetros de consulta inválidos
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                parametros_invalidos:
                  value:
                    errorCode: "VALIDATION_ERROR"
                    message: "El formato de fecha es inválido"
                    details:
                      - field: "startDate"
                        message: "Debe estar en formato YYYY-MM-DD"
        "401":
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
        "500":
          description: Error interno del servidor
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'

  /loans/{loanId}:
    get:
      tags:
        - Préstamos
      summary: Consultar una solicitud de préstamo específica
      description: Obtiene los detalles de una solicitud de préstamo por su ID.
      operationId: getLoanRequestById
      parameters:
        - name: loanId
          in: path
          description: ID de la solicitud de préstamo
          required: true
          schema:
            type: string
            format: uuid
            example: "loan-123e4567-e89b-12d3-a456-426614174000"
      responses:
        "200":
          description: Detalles de la solicitud de préstamo
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/LoanResponse'
              examples:
                solicitud_detalle:
                  value:
                    loanId: "loan-123e4567-e89b-12d3-a456-426614174000"
                    status: "EN_PROCESO"
                    customerId: "cust-123e4567-e89b-12d3-a456-426614174000"
                    amount: 5000000
                    termMonths: 24
                    purpose: "CONSOLIDACION_DE_DEUDAS"
                    income: 3000000
                    employmentStatus: "EMPLEADO"
                    creditScore: 720
                    approvalPercentage: 75
                    createdAt: "2023-10-15T10:00:00Z"
                    updatedAt: "2023-10-15T10:05:00Z"
        "401":
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
        "404":
          description: Solicitud de préstamo no encontrada
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                no_encontrado:
                  value:
                    errorCode: "NOT_FOUND"
                    message: "No se encontró la solicitud de préstamo con ID proporcionado"
        "500":
          description: Error interno del servidor
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
    patch:
      tags:
        - Préstamos
      summary: Actualizar el estado de una solicitud de préstamo
      description: |
        Actualiza el estado de una solicitud de préstamo existente.
        Permite transiciones como "APROBADO", "RECHAZADO" o "DESEMBOLSADO".
      operationId: updateLoanStatus
      parameters:
        - name: loanId
          in: path
          description: ID de la solicitud de préstamo
          required: true
          schema:
            type: string
            format: uuid
            example: "loan-123e4567-e89b-12d3-a456-426614174000"
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/LoanStatusUpdate'
            examples:
              actualizacion_valida:
                value:
                  status: "APROBADO"
                  notes: "Aprobado por sistema de scoring"
      responses:
        "200":
          description: Estado de la solicitud actualizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/LoanResponse'
              examples:
                actualizado:
                  value:
                    loanId: "loan-123e4567-e89b-12d3-a456-426614174000"
                    status: "APROBADO"
                    updatedAt: "2023-10-15T11:30:00Z"
        "400":
          description: Datos inválidos o transición no permitida
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                transicion_invalida:
                  value:
                    errorCode: "VALIDATION_ERROR"
                    message: "Transición de estado no permitida"
                    details:
                      - field: "status"
                        message: "No se puede pasar de EN_PROCESO a DESEMBOLSADO directamente"
        "401":
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
        "404":
          description: Solicitud de préstamo no encontrada
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
        "409":
          description: Conflicto por estado actual
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                conflicto_estado:
                  value:
                    errorCode: "CONFLICT"
                    message: "La solicitud ya fue aprobada anteriormente"
        "500":
          description: Error interno del servidor
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'

  /loans/{loanId}/documents:
    post:
      tags:
        - Préstamos
      summary: Adjuntar documentos a una solicitud de préstamo
      description: |
        Permite adjuntar documentos requeridos para una solicitud de préstamo,
        como identificación, comprobantes de ingresos, etc.
      operationId: uploadLoanDocuments
      parameters:
        - name: loanId
          in: path
          description: ID de la solicitud de préstamo
          required: true
          schema:
            type: string
            format: uuid
            example: "loan-123e4567-e89b-12d3-a456-426614174000"
      requestBody:
        required: true
        content:
          multipart/form-data:
            schema:
              type: object
              properties:
                documentType:
                  type: string
                  enum: ["IDENTIFICATION", "INCOME_PROOF", "BANK_STATEMENT"]
                file:
                  type: string
                  format: binary
            examples:
              documento_valido:
                value:
                  documentType: "IDENTIFICATION"
                  file: "documento.pdf"
      responses:
        "201":
          description: Documento adjuntado exitosamente
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/DocumentResponse'
              examples:
                exito_documento:
                  value:
                    documentId: "doc-123e4567-e89b-12d3-a456-426614174000"
                    documentType: "IDENTIFICATION"
                    status: "PENDIENTE_REVISION"
                    uploadedAt: "2023-10-15T12:00:00Z"
        "400":
          description: Datos inválidos o tipo de documento no permitido
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                tipo_documento_invalido:
                  value:
                    errorCode: "VALIDATION_ERROR"
                    message: "Tipo de documento no permitido para esta solicitud"
        "401":
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
        "404":
          description: Solicitud de préstamo no encontrada
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
        "413":
          description: Archivo demasiado grande
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                archivo_grande:
                  value:
                    errorCode: "PAYLOAD_TOO_LARGE"
                    message: "El archivo excede el tamaño máximo permitido (10MB)"
        "500":
          description: Error interno del servidor
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'

components:
  schemas:
    LoanRequest:
      type: object
      required:
        - customerId
        - amount
        - termMonths
        - purpose
        - income
        - employmentStatus
      properties:
        customerId:
          type: string
          format: uuid
          description: ID único del cliente
          example: "cust-123e4567-e89b-12d3-a456-426614174000"
        amount:
          type: number
          format: double
          description: Monto solicitado en COP
          minimum: 1000000
          maximum: 20000000
          example: 5000000
        termMonths:
          type: integer
          description: Plazo del préstamo en meses
          minimum: 6
          maximum: 60
          example: 24
        purpose:
          type: string
          description: Propósito del préstamo
          enum: ["VIVIENDA", "VEHICULO", "EDUCACION", "CONSOLIDACION_DE_DEUDAS", "OTRO"]
          example: "CONSOLIDACION_DE_DEUDAS"
        income:
          type: number
          format: double
          description: Ingresos mensuales del cliente en COP
          minimum: 1000000
          example: 3000000
        employmentStatus:
          type: string
          description: Situación laboral del cliente
          enum: ["EMPLEADO", "INDEPENDIENTE", "PENSIONADO", "DESEMPLEADO"]
          example: "EMPLEADO"
        creditScore:
          type: integer
          description: Puntaje crediticio del cliente (opcional)
          minimum: 300
          maximum: 850
          example: 720
        notes:
          type: string
          description: Notas adicionales para la solicitud
          example: "Cliente con historial crediticio estable"
    
    LoanResponse:
      type: object
      required:
        - loanId
        - status
        - customerId
        - amount
        - termMonths
        - createdAt
        - updatedAt
      properties:
        loanId:
          type: string
          format: uuid
          description: ID único de la solicitud de préstamo
          example: "loan-123e4567-e89b-12d3-a456-426614174000"
        status:
          type: string
          description: Estado actual de la solicitud
          enum: ["EN_PROCESO", "APROBADO", "RECHAZADO", "DESEMBOLSADO"]
          example: "EN_PROCESO"
        customerId:
          type: string
          format: uuid
          description: ID único del cliente
          example: "cust-123e4567-e89b-12d3-a456-426614174000"
        amount:
          type: number
          format: double
          description: Monto solicitado en COP
          example: 5000000
        termMonths:
          type: integer
          description: Plazo del préstamo en meses
          example: 24
        purpose:
          type: string
          description: Propósito del préstamo
          enum: ["VIVIENDA", "VEHICULO", "EDUCACION", "CONSOLIDACION_DE_DEUDAS", "OTRO"]
          example: "CONSOLIDACION_DE_DEUDAS"
        income:
          type: number
          format: double
          description: Ingresos mensuales del cliente en COP
          example: 3000000
        employmentStatus:
          type: string
          description: Situación laboral del cliente
          enum: ["EMPLEADO", "INDEPENDIENTE", "PENSIONADO", "DESEMPLEADO"]
          example: "EMPLEADO"
        creditScore:
          type: integer
          description: Puntaje crediticio del cliente
          example: 720
        approvalPercentage:
          type: number
          format: double
          description: Porcentaje de aprobación calculado por el sistema
          minimum: 0
          maximum: 100
          example: 75
        createdAt:
          type: string
          format: date-time
          description: Fecha y hora de creación de la solicitud
          example: "2023-10-15T10:00:00Z"
        updatedAt:
          type: string
          format: date-time
          description: Fecha y hora de la última actualización
          example: "2023-10-15T10:05:00Z"
        documents:
          type: array
          description: Lista de documentos adjuntos a la solicitud
          items:
            $ref: '#/components/schemas/DocumentResponse'
    
    LoanStatusUpdate:
      type: object
      required:
        - status
      properties:
        status:
          type: string
          description: Nuevo estado de la solicitud
          enum: ["APROBADO", "RECHAZADO", "DESEMBOLSADO"]
          example: "APROBADO"
        notes:
          type: string
          description: Notas adicionales para la actualización
          example: "Aprobado por sistema de scoring"
    
    DocumentResponse:
      type: object
      required:
        - documentId
        - documentType
        - status
        - uploadedAt
      properties:
        documentId:
          type: string
          format: uuid
          description: ID único del documento
          example: "doc-123e4567-e89b-12d3-a456-426614174000"
        documentType:
          type: string
          description: Tipo de documento
          enum: ["IDENTIFICATION", "INCOME_PROOF", "BANK_STATEMENT"]
          example: "IDENTIFICATION"
        status:
          type: string
          description: Estado del documento
          enum: ["PENDIENTE_REVISION", "VALIDADO", "RECHAZADO"]
          example: "PENDIENTE_REVISION"
        uploadedAt:
          type: string
          format: date-time
          description: Fecha y hora de subida del documento
          example: "2023-10-15T12:00:00Z"
        validatedAt:
          type: string
          format: date-time
          description: Fecha y hora de validación del documento (si aplica)
          example: "2023-10-16T09:30:00Z"
    
    ErrorResponse:
      type: object
      required:
        - errorCode
        - message
      properties:
        errorCode:
          type: string
          description: Código de error estandarizado
          example: "VALIDATION_ERROR"
        message:
          type: string
          description: Mensaje descriptivo del error
          example: "El monto solicitado excede el límite permitido"
        details:
          type: array
          description: Detalles adicionales del error
          items:
            type: object
            properties:
              field:
                type: string
                description: Campo afectado por el error
                example: "amount"
              message:
                type: string
                description: Mensaje específico del error
                example: "Debe ser menor o igual a 20000000"


// === ARCHIVO: proceso.bpmn.md ===
# Proceso de Solicitud de Crédito Hipotecario (BPMN 2.0)

```bpmn
<?xml version="1.0" encoding="UTF-8"?>
<bpmn:definitions xmlns:bpmn="http://www.omg.org/spec/BPMN/20100524/MODEL"
                  xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI"
                  xmlns:dc="http://www.omg.org/spec/DD/20100524/DC"
                  xmlns:di="http://www.omg.org/spec/DD/20100524/DI"
                  id="Definitions_1"
                  targetNamespace="http://bpmn.io/schema/bpmn">
  <bpmn:process id="Process_1" isExecutable="false">
    <bpmn:startEvent id="StartEvent_1" name="Inicio Solicitud">
      <bpmn:outgoing>Flow_1</bpmn:outgoing>
    </bpmn:startEvent>
    <bpmn:task id="Task_1" name="Validar Requisitos Mínimos">
      <bpmn:incoming>Flow_1</bpmn:incoming>
      <bpmn:outgoing>Flow_2</bpmn:outgoing>
    </bpmn:task>
    <bpmn:exclusiveGateway id="Gateway_1" name="Requisitos Válidos?">
      <bpmn:incoming>Flow_2</bpmn:incoming>
      <bpmn:outgoing>Flow_3</bpmn:outgoing>
      <bpmn:outgoing>Flow_4</bpmn:outgoing>
    </bpmn:exclusiveGateway>
    <bpmn:task id="Task_2" name="Solicitar Documentos Adicionales">
      <bpmn:incoming>Flow_4</bpmn:incoming>
      <bpmn:outgoing>Flow_5</bpmn:outgoing>
    </bpmn:task>
    <bpmn:task id="Task_3" name="Realizar Estudio de Crédito">
      <bpmn:incoming>Flow_3</bpmn:incoming>
      <bpmn:outgoing>Flow_6</bpmn:outgoing>
    </bpmn:task>
    <bpmn:exclusiveGateway id="Gateway_2" name="Crédito Aprobado?">
      <bpmn:incoming>Flow_6</bpmn:incoming>
      <bpmn:outgoing>Flow_7</bpmn:outgoing>
      <bpmn:outgoing>Flow_8</bpmn:outgoing>
    </bpmn:exclusiveGateway>
    <bpmn:task id="Task_4" name="Generar Oferta">
      <bpmn:incoming>Flow_7</bpmn:incoming>
      <bpmn:outgoing>Flow_9</bpmn:outgoing>
    </bpmn:task>
    <bpmn:task id="Task_5" name="Notificar Rechazo">
      <bpmn:incoming>Flow_8</bpmn:incoming>
      <bpmn:outgoing>Flow_10</bpmn:outgoing>
    </bpmn:task>
    <bpmn:endEvent id="EndEvent_1" name="Fin Proceso (Aprobado)">
      <bpmn:incoming>Flow_9</bpmn:incoming>
    </bpmn:endEvent>
    <bpmn:endEvent id="EndEvent_2" name="Fin Proceso (Rechazado)">
      <bpmn:incoming>Flow_10</bpmn:incoming>
    </bpmn:endEvent>
    <bpmn:sequenceFlow id="Flow_1" sourceRef="StartEvent_1" targetRef="Task_1" />
    <bpmn:sequenceFlow id="Flow_2" sourceRef="Task_1" targetRef="Gateway_1" />
    <bpmn:sequenceFlow id="Flow_3" sourceRef="Gateway_1" targetRef="Task_3" name="Sí">
      <bpmn:conditionExpression xsi:type="bpmn:tFormalExpression">#{requisitosValidos == true}</bpmn:conditionExpression>
    </bpmn:sequenceFlow>
    <bpmn:sequenceFlow id="Flow_4" sourceRef="Gateway_1" targetRef="Task_2" name="No">
      <bpmn:conditionExpression xsi:type="bpmn:tFormalExpression">#{requisitosValidos == false}</bpmn:conditionExpression>
    </bpmn:sequenceFlow>
    <bpmn:sequenceFlow id="Flow_5" sourceRef="Task_2" targetRef="Task_1" />
    <bpmn:sequenceFlow id="Flow_6" sourceRef="Task_3" targetRef="Gateway_2" />
    <bpmn:sequenceFlow id="Flow_7" sourceRef="Gateway_2" targetRef="Task_4" name="Sí">
      <bpmn:conditionExpression xsi:type="bpmn:tFormalExpression">#{creditoAprobado == true}</bpmn:conditionExpression>
    </bpmn:sequenceFlow>
    <bpmn:sequenceFlow id="Flow_8" sourceRef="Gateway_2" targetRef="Task_5" name="No">
      <bpmn:conditionExpression xsi:type="bpmn:tFormalExpression">#{creditoAprobado == false}</bpmn:conditionExpression>
    </bpmn:sequenceFlow>
    <bpmn:sequenceFlow id="Flow_9" sourceRef="Task_4" targetRef="EndEvent_1" />
    <bpmn:sequenceFlow id="Flow_10" sourceRef="Task_5" targetRef="EndEvent_2" />
  </bpmn:process>
  <bpmndi:BPMNDiagram id="BPMNDiagram_1">
    <bpmndi:BPMNPlane id="BPMNPlane_1" bpmnElement="Process_1">
      <bpmndi:BPMNShape id="_BPMNShape_StartEvent_2" bpmnElement="StartEvent_1">
        <dc:Bounds x="100" y="100" width="36" height="36" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Task_1_di" bpmnElement="Task_1">
        <dc:Bounds x="200" y="80" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Gateway_1_di" bpmnElement="Gateway_1">
        <dc:Bounds x="350" y="100" width="50" height="50" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Task_2_di" bpmnElement="Task_2">
        <dc:Bounds x="450" y="200" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Task_3_di" bpmnElement="Task_3">
        <dc:Bounds x="450" y="0" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Gateway_2_di" bpmnElement="Gateway_2">
        <dc:Bounds x="600" y="100" width="50" height="50" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Task_4_di" bpmnElement="Task_4">
        <dc:Bounds x="700" y="0" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Task_5_di" bpmnElement="Task_5">
        <dc:Bounds x="700" y="200" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="EndEvent_1_di" bpmnElement="EndEvent_1">
        <dc:Bounds x="850" y="15" width="36" height="36" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="EndEvent_2_di" bpmnElement="EndEvent_2">
        <dc:Bounds x="850" y="215" width="36" height="36" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNEdge id="Flow_1_di" bpmnElement="Flow_1">
        <di:waypoint x="136" y="118" />
        <di:waypoint x="200" y="118" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_2_di" bpmnElement="Flow_2">
        <di:waypoint x="300" y="118" />
        <di:waypoint x="350" y="118" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_3_di" bpmnElement="Flow_3">
        <di:waypoint x="375" y="100" />
        <di:waypoint x="375" y="40" />
        <di:waypoint x="450" y="40" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_4_di" bpmnElement="Flow_4">
        <di:waypoint x="375" y="150" />
        <di:waypoint x="375" y="240" />
        <di:waypoint x="450" y="240" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_5_di" bpmnElement="Flow_5">
        <di:waypoint x="550" y="240" />
        <di:waypoint x="320" y="240" />
        <di:waypoint x="320" y="198" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_6_di" bpmnElement="Flow_6">
        <di:waypoint x="550" y="40" />
        <di:waypoint x="600" y="40" />
        <di:waypoint x="600" y="100" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_7_di" bpmnElement="Flow_7">
        <di:waypoint x="625" y="100" />
        <di:waypoint x="625" y="40" />
        <di:waypoint x="700" y="40" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_8_di" bpmnElement="Flow_8">
        <di:waypoint x="625" y="150" />
        <di:waypoint x="625" y="240" />
        <di:waypoint x="700" y="240" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_9_di" bpmnElement="Flow_9">
        <di:waypoint x="800" y="40" />
        <di:waypoint x="850" y="33" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_10_di" bpmnElement="Flow_10">
        <di:waypoint x="800" y="240" />
        <di:waypoint x="850" y="233" />
      </bpmndi:BPMNEdge>
    </bpmndi:BPMNPlane>
  </bpmndi:BPMNDiagram>
</bpmn:definitions>
```

## Descripción del Proceso

Este diagrama BPMN 2.0 modela el flujo de negocio para la solicitud de crédito hipotecario en una entidad financiera. El proceso incluye los siguientes actores y pasos:

### Actores:
1. **Cliente**: Solicitante del crédito hipotecario.
2. **Analista de Crédito**: Valida requisitos y documentos.
3. **Sistema Central**: Realiza el estudio de crédito automático.
4. **Notificador**: Envía comunicaciones al cliente.

### Pasos Detallados:

1. **Inicio Solicitud**
   - El proceso comienza cuando el cliente envía una solicitud de crédito hipotecario.

2. **Validar Requisitos Mínimos**
   - El analista verifica que el cliente cumpla con los requisitos mínimos:
     - Edad entre 25 y 65 años.
     - Ingresos mensuales superiores a 3 SMMLV (Salario Mínimo Mensual Legal Vigente).
     - Historial crediticio sin reportes negativos en centrales de riesgo.
   - **Punto de decisión**: Si los requisitos no se cumplen, se solicita documentación adicional.

3. **Solicitar Documentos Adicionales (si aplica)**
   - Si los requisitos no se cumplen, se notifica al cliente para que envíe documentos adicionales:
     - Certificado de ingresos.
     - Extractos bancarios de los últimos 6 meses.
     - Certificado de tradición y libertad del inmueble.
   - Una vez recibidos los documentos, se vuelve a validar los requisitos.

4. **Realizar Estudio de Crédito**
   - El sistema central realiza un estudio automático que incluye:
     - Validación de capacidad de endeudamiento.
     - Cálculo de score crediticio.
     - Simulación de cuotas mensuales.
   - **Punto de decisión**: Si el crédito es aprobado, se genera una oferta. Si es rechazado, se notifica al cliente.

5. **Generar Oferta (si aprobado)**
   - Se genera una oferta formal que incluye:
     - Monto del crédito.
     - Tasa de interés.
     - Plazo de pago.
     - Cuota mensual estimada.
     - Condiciones legales.

6. **Notificar Rechazo (si aplica)**
   - Si el crédito es rechazado, se notifica al cliente con los motivos:
     - Capacidad de endeudamiento insuficiente.
     - Score crediticio bajo.
     - Inconsistencias en la documentación.

### Reglas de Negocio:
- **Validación de Requisitos**: Los requisitos mínimos son obligatorios para continuar con el proceso.
- **Estudio de Crédito**: La aprobación automática se basa en un algoritmo que evalúa capacidad de pago y riesgo crediticio.
- **Idempotencia**: El sistema debe garantizar que una solicitud con los mismos datos no genere duplicados.
- **Trazabilidad**: Cada paso del proceso debe quedar registrado en el sistema de auditoría.

### Ejemplo de Datos:
- **Solicitud ID**: `550e8400-e29b-41d4-a716-446655440000`
- **Monto Solicitado**: `350,000,000 COP`
- **Plazo**: `20 años`
- **Tasa de Interés**: `12.5% E.A.`
- **Cuota Mensual Estimada**: `3,800,000 COP`

### Observaciones:
- Este proceso es **orquestado**, ya que existe un sistema central que coordina las tareas y decisiones.
- La decisión de usar orquestación se basa en la necesidad de centralizar la lógica de negocio y garantizar trazabilidad.
- En un escenario de **coreografía**, cada microservicio tomaría decisiones autónomas, lo que podría mejorar la escalabilidad pero dificultaría la trazabilidad.

---

// === ARCHIVO: mapeo-de-datos.csv ===
campo_origen,tipo_origen,obligatorio,campo_destino,tipo_destino,regla_transformacion,ejemplo_origen,ejemplo_destino
solicitud_id,string,true,id_solicitud,UUID,Generar UUID v4 si no existe,REQ-2023-001,550e8400-e29b-41d4-a716-446655440000
cliente_nombre,string,true,nombre_cliente,string,Normalizar texto (trim, mayúsculas iniciales),Juan perez,Juan Perez
cliente_tipo_documento,string,true,tipo_identificacion,string,Mapear a valores permitidos (CC, CE, NIT),Cédula de Ciudadanía,CC
cliente_numero_documento,string,true,numero_identificacion,string,Limpiar caracteres no numéricos (excepto para NIT),1.053.789-45,105378945
cliente_fecha_nacimiento,date,true,fecha_nacimiento,date,Convertir a formato ISO 8601 (YYYY-MM-DD),15/08/1985,1985-08-15
cliente_ingresos_mensuales,number,true,ingresos_mensuales,number,Convertir a COP (multiplicar por 1 si ya está en COP),4500000,4500000
cliente_historial_crediticio,string,true,score_crediticio,number,Mapear a score numérico (0-1000),"Sin reportes negativos",750
inmueble_valor,number,true,valor_inmueble,number,Convertir a COP si está en otra moneda,250000USD,1000000000
inmueble_direccion,string,true,direccion_inmueble,string,Normalizar formato de dirección,Calle 12 # 34-56,CL 12 34 56
monto_solicitado,number,true,monto_credito,number,Validar que sea mayor a 0 y menor al 80% del valor del inmueble,180000000,180000000
plazo_meses,number,true,plazo_meses,integer,Redondear a entero y validar rango (5-360 meses),240,240
tasa_interes,number,true,tasa_interes,decimal,Convertir a formato decimal (0.0000),12.5%,0.125
cuota_mensual_estimada,number,false,cuota_mensual,number,Calcular si no viene,"",3800000
fecha_solicitud,datetime,true,fecha_creacion,timestamp,Convertir a timestamp UTC,2023-10-01T10:00:00-05:00,2023-10-01T15:00:00Z
estado_solicitud,string,true,estado,string,Mapear a valores permitidos (PENDIENTE, EN_REVISION, APROBADO, RECHAZADO),En revisión,EN_REVISION
motivo_rechazo,string,false,motivo_rechazo,string,Normalizar texto si existe,"Capacidad de endeudamiento insuficiente","Capacidad de endeudamiento insuficiente"

## Descripción del Mapeo de Datos

Este archivo CSV define el mapeo entre los campos del sistema origen (solicitud de crédito) y el sistema destino (sistema central de créditos). Cada fila incluye:

1. **campo_origen**: Nombre del campo en el sistema que envía los datos.
2. **tipo_origen**: Tipo de dato en el sistema origen (string, number, date, datetime).
3. **obligatorio**: Indica si el campo es obligatorio (true/false).
4. **campo_destino**: Nombre del campo en el sistema destino.
5. **tipo_destino**: Tipo de dato en el sistema destino (UUID, string, number, integer, decimal, date, timestamp).
6. **regla_transformacion**: Reglas aplicadas para transformar el dato.
7. **ejemplo_origen**: Ejemplo de dato en el sistema origen.
8. **ejemplo_destino**: Ejemplo de dato transformado en el sistema destino.

### Reglas de Transformación Destacadas:
- **UUID**: Si el campo `solicitud_id` no es un UUID, se genera uno nuevo para garantizar unicidad.
- **Normalización de Texto**: Los campos de texto se normalizan para eliminar espacios adicionales y corregir mayúsculas.
- **Limpieza de Caracteres**: En campos como `cliente_numero_documento`, se eliminan caracteres no numéricos (excepto para NIT).
- **Mapeo de Valores**: Campos como `cliente_tipo_documento` y `estado_solicitud` se transforman a valores permitidos en el sistema destino.
- **Conversión de Unidades**: El campo `inmueble_valor` se convierte a COP si viene en otra moneda (ejemplo: USD → COP usando una tasa de cambio ficticia de 4000).
- **Cálculo de Campos**: La `cuota_mensual_estimada` se calcula si no viene en la solicitud original.

### Validaciones Adicionales:
- **Monto del Crédito**: Debe ser mayor a 0 y no superar el 80% del valor del inmueble.
- **Plazo**: Debe estar entre 5 y 360 meses.
- **Tasa de Interés**: Debe ser un valor decimal entre 0.01 y 0.30 (1% a 30%).
- **Fecha de Nacimiento**: Debe corresponder a una edad entre 25 y 65 años.

### Ejemplo de Flujo de Datos:
1. El sistema origen envía una solicitud con los siguientes datos:
   ```json
   {
     "solicitud_id": "REQ-2023-001",
     "cliente_nombre": "Juan perez",
     "cliente_tipo_documento": "Cédula de Ciudadanía",
     "cliente_numero_documento": "1.053.789-45",
     "monto_solicitado": 180000000
   }
   ```

2. El sistema destino recibe los datos transformados:
   ```json
   {
     "id_solicitud": "550e8400-e29b-41d4-a716-446655440000",
     "nombre_cliente": "Juan Perez",
     "tipo_identificacion": "CC",
     "numero_identificacion": "105378945",
     "monto_credito": 180000000
   }
   ```

### Observaciones:
- Este mapeo es **bidireccional**: algunos campos pueden requerir transformaciones inversas al devolver respuestas al sistema origen.
- Las reglas de transformación deben implementarse en un **servicio de mapeo** que valide y transforme los datos antes de enviarlos al sistema destino.
- La decisión de centralizar el mapeo en un servicio (orquestación) permite reutilizar las reglas en múltiples integraciones, pero puede convertirse en un cuello de botella si el volumen de solicitudes es alto.

---

// === ARCHIVO: README.md ===
# API de Solicitud de Crédito Hipotecario - Documentación

## Descripción
Este proyecto define los contratos y procesos para la integración de un sistema de solicitud de crédito hipotecario bajo el enfoque **SOA (Service-Oriented Architecture)**. El objetivo es garantizar la interoperabilidad entre sistemas financieros mediante APIs bien documentadas y procesos de negocio estandarizados.

## Estructura del Proyecto
```
.
├── api/
│   ├── openapi.yaml          # Contrato OpenAPI 3.1 de la API
│   └── cliente-http-externo.yaml # Especificación del cliente HTTP externo
├── proceso/
│   └── proceso.bpmn.md       # Flujo de negocio en notación BPMN
├── mapeo/
│   └── mapeo-de-datos.csv    # Mapeo de datos origen → destino
├── documentacion/
│   └── criterios-aceptacion.feature # Criterios de aceptación en Gherkin
├── riesgos/
│   └── analisis-riesgo.md    # Análisis de riesgos de la integración
└── README.md                 # Documentación del proyecto
```

## Decisión Arquitectónica: Orquestación vs. Coreografía

### **Orquestación (Enfoque Elegido)**
- **Definición**: Un sistema central (orquestador) coordina las tareas y decisiones del proceso.
- **Ventajas**:
  - **Trazabilidad**: Todos los pasos del proceso quedan registrados en un solo lugar.
  - **Centralización de Lógica**: Las reglas de negocio se implementan en un único servicio, facilitando su mantenimiento.
  - **Consistencia**: Garantiza que el flujo de negocio se ejecute siempre en el orden correcto.
- **Desventajas**:
  - **Cuello de Botella**: El orquestador puede convertirse en un punto único de fallo si no está bien escalado.
  - **Acoplamiento**: Los cambios en el flujo de negocio pueden requerir modificaciones en el orquestador.

### **Coreografía**
- **Definición**: Cada microservicio toma decisiones autónomas y se comunica mediante eventos.
- **Ventajas**:
  - **Escalabilidad**: Cada servicio escala independientemente según su carga.
  - **Bajo Acoplamiento**: Los servicios no dependen de un orquestador central.
- **Desventajas**:
  - **Complejidad**: La trazabilidad y depuración son más difíciles al no existir un flujo centralizado.
  - **Consistencia Eventual**: Puede haber inconsistencias temporales entre los datos de los servicios.

### **Justificación de la Elección**
Se optó por **orquestación** debido a:
1. **Requisitos de Trazabilidad**: El dominio financiero exige un registro detallado de cada paso del proceso.
2. **Complejidad del Flujo**: El proceso de solicitud de crédito incluye múltiples puntos de decisión que requieren coordinación centralizada.
3. **Regulaciones**: Las entidades financieras deben cumplir con normativas que exigen auditoría y control estricto sobre los procesos.

Sin embargo, se reconoce que en escenarios con **alto volumen de transacciones** o donde la **escalabilidad horizontal** es crítica, la coreografía podría ser una mejor opción.

## Comandos de Verificación

### Validar el Contrato OpenAPI
```bash
npx --yes @redocly/cli lint api/openapi.yaml
```

### Validar el Mapeo de Datos
```bash
# Verificar que el CSV tenga el formato correcto (campo_origen,tipo_origen,obligatorio,...)
head -n 1 mapeo/mapeo-de-datos.csv | grep -q "campo_origen,tipo_origen,obligatorio,campo_destino,tipo_destino,regla_transformacion"
if [ $? -eq 0 ]; then
  echo "✅ Formato del mapeo de datos es correcto."
else
  echo "❌ Error: El formato del CSV no coincide con el esperado."
  exit 1
fi
```

### Validar el Proceso BPMN
```bash
# Verificar que el archivo BPMN contenga las etiquetas XML requeridas
grep -q "<bpmn:definitions" proceso/proceso.bpmn.md && echo "✅ Archivo BPMN válido." || echo "❌ Error: El archivo BPMN no es válido."
```

## Requisitos Previos
- Node.js (v16 o superior) para ejecutar `@redocly/cli`.
- Un editor de texto para visualizar los archivos (recomendado: VS Code con extensiones para BPMN, CSV y OpenAPI).

## Ejemplo de Uso
1. **Validar el Contrato OpenAPI**:
   ```bash
   npx --yes @redocly/cli lint api/openapi.yaml
   ```

2. **Visualizar el Proceso BPMN**:
   - Copiar el contenido XML del archivo `proceso.bpmn.md` y pegarlo en un editor BPMN como [bpmn.io](https://bpmn.io/).

3. **Revisar el Mapeo de Datos**:
   - Abrir `mapeo/mapeo-de-datos.csv` en una hoja de cálculo (Excel, Google Sheets) para verificar las reglas de transformación.

## Dominio del Problema
El dominio de este proyecto es la **solicitud de crédito hipotecario**, que incluye:
- Validación de requisitos mínimos del cliente.
- Estudio de crédito automático.
- Generación de ofertas y notificación de rechazos.
- Mapeo de datos entre sistemas con diferentes esquemas.

## Fases del Reto
1. **Diseño de API**: Crear el contrato OpenAPI con endpoints, schemas y ejemplos.
2. **Implementación de API**: Definir los flujos de integración y el mapeo de datos.
3. **Documentación**: Completar los criterios de aceptación y el análisis de riesgos.

## Convenciones
- **OpenAPI**: Todos los schemas incluyen ejemplos concretos y campos `required`.
- **BPMN**: El flujo de negocio está descrito en notación BPMN 2.0.
- **Mapeo de Datos**: El CSV sigue el formato `campo_origen,tipo_origen,obligatorio,campo_destino,tipo_destino,regla_transformacion`.
- **Gherkin**: Los criterios de aceptación usan datos reales del dominio (montos en COP, UUIDs, etc.).

## Trade-offs y Consideraciones
- **Orquestación vs. Coreografía**: Como se mencionó anteriormente, la orquestación centraliza la lógica pero puede crear cuellos de botella.
- **Mapeo de Datos**: Centralizar el mapeo en un servicio facilita su mantenimiento pero añade una capa adicional de complejidad.
- **Trazabilidad**: La orquestación garantiza trazabilidad, pero requiere un sistema de logging robusto para manejar grandes volúmenes.

## Observaciones Finales
- Este proyecto **no genera código de implementación**, sino los contratos y documentos necesarios para la integración.
- El enfoque **contrato primero** asegura que los desarrolladores trabajen con una especificación clara antes de implementar.
- Los riesgos de la integración (ej. fallos en el mapeo de datos, inconsistencias entre sistemas) se analizan en `riesgos/analisis-riesgo.md`."


// === ARCHIVO: api/openapi.yaml ===
openapi: 3.1.0
info:
  title: API de Gestión de Solicitudes de Crédito
  description: |-
    API para el registro, consulta y validación de solicitudes de crédito en una fintech.
    Incluye integración con servicios externos como buró de riesgos y motor antifraude.
  version: 1.0.0
  contact:
    name: Equipo de Integración Fintech
    email: integracion@fintech.com
servers:
  - url: https://api.fintech.com/v1
    description: Producción
  - url: https://sandbox.api.fintech.com/v1
    description: Sandbox para pruebas
paths:
  /solicitudes:
    post:
      summary: Registrar una nueva solicitud de crédito
      description: |-
        Registra una solicitud de crédito con los datos del solicitante y el monto solicitado.
        Valida que el solicitante no tenga solicitudes pendientes con el mismo ID.
      operationId: registrarSolicitud
      tags:
        - Solicitudes
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/SolicitudCredito'
            examples:
              solicitudEjemplo:
                value:
                  idSolicitud: "a1b2c3d4-5678-90ef-ghij-klmnopqrstuv"
                  tipoDocumento: "CC"
                  numeroDocumento: "1234567890"
                  nombre: "Juan Pérez"
                  apellido: "Gómez"
                  email: "juan.perez@example.com"
                  telefono: "3001234567"
                  montoSolicitado: 5000000
                  plazoMeses: 24
                  ingresosMensuales: 3000000
                  empleoActual: "Empleado"
                  fechaSolicitud: "2023-10-15"
      responses:
        '201':
          description: Solicitud creada exitosamente
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/SolicitudResponse'
              examples:
                exito:
                  value:
                    idSolicitud: "a1b2c3d4-5678-90ef-ghij-klmnopqrstuv"
                    estado: "EN_PROCESO"
                    fechaCreacion: "2023-10-15T10:00:00Z"
        '400':
          description: Error de validación en los datos de entrada
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                validacion:
                  value:
                    codigo: "VALIDACION_ERROR"
                    mensaje: "El campo 'montoSolicitado' debe ser mayor a 1,000,000 COP"
                    detalles:
                      - campo: "montoSolicitado"
                        error: "Debe ser mayor a 1,000,000 COP"
        '401':
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
        '409':
          description: Conflicto - Solicitud ya existe
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                conflicto:
                  value:
                    codigo: "SOLICITUD_DUPLICADA"
                    mensaje: "Ya existe una solicitud con el mismo ID"
        '500':
          description: Error interno del servidor
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'

    get:
      summary: Consultar historial de solicitudes
      description: |-
        Retorna el historial de solicitudes de crédito para un solicitante, filtrando por estado si se especifica.
      operationId: consultarHistorial
      tags:
        - Solicitudes
      parameters:
        - name: numeroDocumento
          in: query
          description: Número de documento del solicitante
          required: true
          schema:
            type: string
            example: "1234567890"
        - name: estado
          in: query
          description: Estado de la solicitud (opcional)
          required: false
          schema:
            type: string
            enum: ["EN_PROCESO", "APROBADA", "RECHAZADA", "CANCELADA"]
      responses:
        '200':
          description: Historial de solicitudes
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/SolicitudResponse'
              examples:
                historial:
                  value:
                    - idSolicitud: "a1b2c3d4-5678-90ef-ghij-klmnopqrstuv"
                      estado: "APROBADA"
                      fechaCreacion: "2023-10-10T09:00:00Z"
                      montoAprobado: 4500000
                    - idSolicitud: "z9y8x7w6-5432-10uv-tsrq-ponmlkjihgfed"
                      estado: "RECHAZADA"
                      fechaCreacion: "2023-09-20T08:30:00Z"
        '400':
          description: Error de validación
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
        '401':
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
        '500':
          description: Error interno del servidor
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'

  /solicitudes/{idSolicitud}:
    get:
      summary: Consultar detalle de una solicitud
      description: |-
        Retorna el detalle de una solicitud específica incluyendo su estado actual y validaciones realizadas.
      operationId: consultarSolicitud
      tags:
        - Solicitudes
      parameters:
        - name: idSolicitud
          in: path
          description: ID de la solicitud
          required: true
          schema:
            type: string
            format: uuid
            example: "a1b2c3d4-5678-90ef-ghij-klmnopqrstuv"
      responses:
        '200':
          description: Detalle de la solicitud
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/SolicitudDetalle'
              examples:
                detalle:
                  value:
                    idSolicitud: "a1b2c3d4-5678-90ef-ghij-klmnopqrstuv"
                    estado: "EN_PROCESO"
                    fechaCreacion: "2023-10-15T10:00:00Z"
                    tipoDocumento: "CC"
                    numeroDocumento: "1234567890"
                    nombre: "Juan Pérez"
                    apellido: "Gómez"
                    email: "juan.perez@example.com"
                    montoSolicitado: 5000000
                    plazoMeses: 24
                    ingresosMensuales: 3000000
                    validaciones:
                      - tipo: "ANTIFRAUDE"
                        estado: "APROBADO"
                        fecha: "2023-10-15T10:05:00Z"
                      - tipo: "BUREAU_RIESGO"
                        estado: "PENDIENTE"
                        fecha: null
        '401':
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
        '404':
          description: Solicitud no encontrada
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                noEncontrado:
                  value:
                    codigo: "SOLICITUD_NO_ENCONTRADA"
                    mensaje: "No existe una solicitud con el ID proporcionado"
        '500':
          description: Error interno del servidor
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'

components:
  schemas:
    SolicitudCredito:
      type: object
      required:
        - idSolicitud
        - tipoDocumento
        - numeroDocumento
        - nombre
        - apellido
        - email
        - telefono
        - montoSolicitado
        - plazoMeses
        - ingresosMensuales
        - empleoActual
      properties:
        idSolicitud:
          type: string
          format: uuid
          description: Identificador único de la solicitud
          example: "a1b2c3d4-5678-90ef-ghij-klmnopqrstuv"
        tipoDocumento:
          type: string
          enum: ["CC", "CE", "NIT", "PASAPORTE"]
          description: Tipo de documento de identidad
          example: "CC"
        numeroDocumento:
          type: string
          description: Número de documento de identidad
          example: "1234567890"
          pattern: "^[0-9]{6,15}$"
        nombre:
          type: string
          description: Nombre del solicitante
          example: "Juan"
          minLength: 2
          maxLength: 50
        apellido:
          type: string
          description: Apellido del solicitante
          example: "Pérez"
          minLength: 2
          maxLength: 50
        email:
          type: string
          format: email
          description: Correo electrónico del solicitante
          example: "juan.perez@example.com"
        telefono:
          type: string
          description: Número de teléfono del solicitante
          example: "3001234567"
          pattern: "^[0-9]{10,15}$"
        montoSolicitado:
          type: number
          description: Monto solicitado en COP
          example: 5000000
          minimum: 1000000
          maximum: 50000000
        plazoMeses:
          type: integer
          description: Plazo de pago en meses
          example: 24
          minimum: 6
          maximum: 72
        ingresosMensuales:
          type: number
          description: Ingresos mensuales del solicitante en COP
          example: 3000000
          minimum: 1000000
        empleoActual:
          type: string
          description: Situación laboral actual del solicitante
          example: "Empleado"
          enum: ["Empleado", "Independiente", "Pensionado", "Sin empleo"]
        fechaSolicitud:
          type: string
          format: date
          description: Fecha de la solicitud (opcional, si no se envía se usa la fecha actual)
          example: "2023-10-15"

    SolicitudResponse:
      type: object
      required:
        - idSolicitud
        - estado
        - fechaCreacion
      properties:
        idSolicitud:
          type: string
          format: uuid
          description: Identificador único de la solicitud
          example: "a1b2c3d4-5678-90ef-ghij-klmnopqrstuv"
        estado:
          type: string
          enum: ["EN_PROCESO", "APROBADA", "RECHAZADA", "CANCELADA"]
          description: Estado actual de la solicitud
          example: "EN_PROCESO"
        fechaCreacion:
          type: string
          format: date-time
          description: Fecha y hora de creación de la solicitud
          example: "2023-10-15T10:00:00Z"
        montoAprobado:
          type: number
          description: Monto aprobado en COP (solo para estado APROBADA)
          example: 4500000
          nullable: true

    SolicitudDetalle:
      allOf:
        - $ref: '#/components/schemas/SolicitudResponse'
        - type: object
          required:
            - tipoDocumento
            - numeroDocumento
            - nombre
            - apellido
            - email
            - montoSolicitado
            - plazoMeses
            - ingresosMensuales
            - validaciones
          properties:
            tipoDocumento:
              type: string
              enum: ["CC", "CE", "NIT", "PASAPORTE"]
              description: Tipo de documento de identidad
              example: "CC"
            numeroDocumento:
              type: string
              description: Número de documento de identidad
              example: "1234567890"
            nombre:
              type: string
              description: Nombre del solicitante
              example: "Juan"
            apellido:
              type: string
              description: Apellido del solicitante
              example: "Pérez"
            email:
              type: string
              format: email
              description: Correo electrónico del solicitante
              example: "juan.perez@example.com"
            montoSolicitado:
              type: number
              description: Monto solicitado en COP
              example: 5000000
            plazoMeses:
              type: integer
              description: Plazo de pago en meses
              example: 24
            ingresosMensuales:
              type: number
              description: Ingresos mensuales del solicitante en COP
              example: 3000000
            validaciones:
              type: array
              description: Validaciones realizadas sobre la solicitud
              items:
                type: object
                required:
                  - tipo
                  - estado
                properties:
                  tipo:
                    type: string
                    enum: ["ANTIFRAUDE", "BUREAU_RIESGO", "VERIFICACION_IDENTIDAD"]
                    description: Tipo de validación
                    example: "ANTIFRAUDE"
                  estado:
                    type: string
                    enum: ["PENDIENTE", "APROBADO", "RECHAZADO"]
                    description: Estado de la validación
                    example: "APROBADO"
                  fecha:
                    type: string
                    format: date-time
                    description: Fecha y hora de la validación (null si está pendiente)
                    example: "2023-10-15T10:05:00Z"
                    nullable: true

    ErrorResponse:
      type: object
      required:
        - codigo
        - mensaje
      properties:
        codigo:
          type: string
          description: Código de error
          example: "VALIDACION_ERROR"
        mensaje:
          type: string
          description: Mensaje descriptivo del error
          example: "El campo 'montoSolicitado' debe ser mayor a 1,000,000 COP"
        detalles:
          type: array
          description: Detalles adicionales del error (opcional)
          items:
            type: object
            properties:
              campo:
                type: string
                description: Nombre del campo con error
                example: "montoSolicitado"
              error:
                type: string
                description: Descripción del error
                example: "Debe ser mayor a 1,000,000 COP"

// === ARCHIVO: api/cliente-http-externo.yaml ===
openapi: 3.1.0
info:
  title: Cliente HTTP para Integración con Servicio Externo
  description: |-
    Configuración del cliente HTTP para consumir el servicio de buró de riesgos.
    Incluye manejo de fallos con timeouts y circuit breaker.
  version: 1.0.0
servers:
  - url: https://bureau-riesgos.externo.com/api/v1
    description: Producción
  - url: https://sandbox.bureau-riesgos.externo.com/api/v1
    description: Sandbox para pruebas
paths:
  /consulta:
    post:
      summary: Consultar perfil de riesgo de un solicitante
      description: |-
        Consulta el perfil de riesgo de un solicitante en el buró de riesgos.
        Retorna información sobre comportamiento crediticio, deudas y score de riesgo.
      operationId: consultarPerfilRiesgo
      tags:
        - Buró de Riesgos
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/ConsultaRiesgoRequest'
            examples:
              consultaEjemplo:
                value:
                  tipoDocumento: "CC"
                  numeroDocumento: "1234567890"
                  nombre: "Juan Pérez"
                  apellido: "Gómez"
      responses:
        '200':
          description: Perfil de riesgo del solicitante
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ConsultaRiesgoResponse'
              examples:
                perfilRiesgo:
                  value:
                    numeroDocumento: "1234567890"
                    scoreRiesgo: 750
                    deudasActivas: 2
                    montoDeudas: 8500000
                    historicoPagos:
                      - fecha: "2023-09-15"
                        monto: 1500000
                        estado: "AL_DIA"
                      - fecha: "2023-08-15"
                        monto: 1200000
                        estado: "ATRASADO"
                    recomendacion: "APROBAR_CON_CONDICIONES"
        '400':
          description: Error de validación en los datos de entrada
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
        '401':
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
        '408':
          description: Timeout en la solicitud
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                timeout:
                  value:
                    codigo: "TIMEOUT_ERROR"
                    mensaje: "El servicio de buró de riesgos no respondió en el tiempo esperado"
        '500':
          description: Error interno del servidor
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
        '503':
          description: Servicio no disponible
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
              examples:
                servicioNoDisponible:
                  value:
                    codigo: "SERVICE_UNAVAILABLE"
                    mensaje: "El servicio de buró de riesgos no está disponible"

components:
  schemas:
    ConsultaRiesgoRequest:
      type: object
      required:
        - tipoDocumento
        - numeroDocumento
        - nombre
        - apellido
      properties:
        tipoDocumento:
          type: string
          enum: ["CC", "CE", "NIT", "PASAPORTE"]
          description: Tipo de documento de identidad
          example: "CC"
        numeroDocumento:
          type: string
          description: Número de documento de identidad
          example: "1234567890"
          pattern: "^[0-9]{6,15}$"
        nombre:
          type: string
          description: Nombre del solicitante
          example: "Juan"
          minLength: 2
          maxLength: 50
        apellido:
          type: string
          description: Apellido del solicitante
          example: "Pérez"
          minLength: 2
          maxLength: 50

    ConsultaRiesgoResponse:
      type: object
      required:
        - numeroDocumento
        - scoreRiesgo
        - deudasActivas
        - montoDeudas
      properties:
        numeroDocumento:
          type: string
          description: Número de documento de identidad
          example: "1234567890"
        scoreRiesgo:
          type: integer
          description: Score de riesgo del solicitante (0-1000)
          example: 750
          minimum: 0
          maximum: 1000
        deudasActivas:
          type: integer
          description: Número de deudas activas
          example: 2
        montoDeudas:
          type: number
          description: Monto total de deudas en COP
          example: 8500000
        historicoPagos:
          type: array
          description: Historial de pagos realizados
          items:
            type: object
            required:
              - fecha
              - monto
              - estado
            properties:
              fecha:
                type: string
                format: date
                description: Fecha del pago
                example: "2023-09-15"
              monto:
                type: number
                description: Monto pagado en COP
                example: 1500000
              estado:
                type: string
                enum: ["AL_DIA", "ATRASADO", "EN_MORA"]
                description: Estado del pago
                example: "AL_DIA"
        recomendacion:
          type: string
          enum: ["APROBAR", "APROBAR_CON_CONDICIONES", "RECHAZAR"]
          description: Recomendación basada en el perfil de riesgo
          example: "APROBAR_CON_CONDICIONES"

    ErrorResponse:
      type: object
      required:
        - codigo
        - mensaje
      properties:
        codigo:
          type: string
          description: Código de error
          example: "VALIDACION_ERROR"
        mensaje:
          type: string
          description: Mensaje descriptivo del error
          example: "El campo 'numeroDocumento' es obligatorio"

// === ARCHIVO: proceso/flujo-bpmn.md ===
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

// === ARCHIVO: mapeo/mapeo-datos.csv ===
campo_origen,tipo_origen,obligatorio,campo_destino,tipo_destino,regla_transformacion,ejemplo_origen,ejemplo_destino
id_solicitud,string,obligatorio,id,UUID,Generar UUID v4 si no existe,"SOL-2023-0001","550e8400-e29b-41d4-a716-446655440000"
tipo_solicitud,string,obligatorio,loan_type,string,Mapeo directo: PERSONAL->PERSONAL, HIPOTECARIO->MORTGAGE,"PERSONAL","PERSONAL"
monto_solicitado,number(15,2),obligatorio,amount,number(15,2),Convertir a formato numérico con 2 decimales,"15000000.50","15000000.50"
plazo_meses,integer,obligatorio,term_months,integer,Mapeo directo,"36","36"
tasa_interes,number(5,2),obligatorio,interest_rate,number(5,4),Dividir por 100 para convertir a porcentaje decimal,"12.50","0.1250"
fecha_solicitud,string(date),obligatorio,request_date,string(date-time),Convertir a formato ISO 8601 con zona horaria UTC,"2023-10-15","2023-10-15T00:00:00Z"
identificacion_cliente,string,obligatorio,customer_id,string,Mapeo directo,"1020304050","1020304050"
tipo_identificacion,string,obligatorio,id_type,string,Mapeo directo: CC->CC, NIT->NIT, CE->CE,"CC","CC"
nombre_cliente,string,obligatorio,customer_name,string,Mapeo directo,"Juan Pérez","Juan Pérez"
email_cliente,string(email),condicional,email,string(email),Validar formato de email antes de mapear,"juan.perez@example.com","juan.perez@example.com"
telefono_cliente,string,condicional,phone,string,Validar formato internacional (+57 para Colombia),"3101234567","+573101234567"
estado_solicitud,string,obligatorio,status,string,Mapeo directo: EN_PROCESO->PENDING, APROBADO->APPROVED, RECHAZADO->REJECTED,"EN_PROCESO","PENDING"
fecha_aprobacion,string(date),condicional,approval_date,string(date-time),Convertir a formato ISO 8601 con zona horaria UTC si existe,"2023-10-20","2023-10-20T00:00:00Z"
motivo_rechazo,string,condicional,rejection_reason,string,Mapeo directo si estado es RECHAZADO,"INFORMACION_INCOMPLETA","INFORMATION_INCOMPLETE"
score_credito,integer,condicional,credit_score,integer,Mapeo directo,"750","750"
capacidad_pago,string,condicional,payment_capacity,string,Mapeo directo: ALTA->HIGH, MEDIA->MEDIUM, BAJA->LOW,"ALTA","HIGH"

// === ARCHIVO: documentacion/criterios-aceptacion.feature ===
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

// === ARCHIVO: riesgos/analisis-riesgo.md ===
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
```
