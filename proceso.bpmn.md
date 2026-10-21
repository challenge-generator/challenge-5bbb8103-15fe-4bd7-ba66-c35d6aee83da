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