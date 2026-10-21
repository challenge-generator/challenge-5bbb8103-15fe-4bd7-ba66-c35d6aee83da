# AGENTS.md

Instrucciones para el agente de IA que abra este repositorio (Claude Code, Cursor, Codex, Copilot, Gemini). Se cargan solas: no hay que pegar nada en ningun chat.

## Que es este repositorio

Es el codigo base de un reto de aprendizaje de Pragma: **Desarrollo de Habilidades en Análisis SOA e Integración**.

| | |
|---|---|
| Tema | Implementación SOA - API - MicroServicios |
| Nivel | junior-l1 |
| Chapter | Integración — Analista |
| Especialidad | SOA |
| Stack | YAML / OpenAPI 3.1 |
| Patron arquitectonico | Contrato primero con patrones SOA y bajo acoplamiento |
| Tiempo estimado | 15 horas |

## Receta del stack

Esqueleto obligatorio:

- `openapi.yaml`
- `proceso.bpmn.md`
- `mapeo-de-datos.csv`

Dependencias:

- @redocly/cli 1.12.0
- OpenAPI 3.1 specification 3.1.0
- BPMN 2.0 notation 2.0
- Gherkin n/a

## Tu tarea

Dejar este conjunto de artefactos en estado **verificable**: que el comando de verificacion corra sin errores. Escribi los archivos en disco, en este repositorio. No generes ZIPs ni archivos adjuntos.

En orden:

1. Corre `npx --yes @redocly/cli lint api/openapi.yaml` y mira que falla.
2. Completa lo que falte de la lista de abajo: manifiesto de dependencias, punto de entrada, capa de interfaz y las capas del patron declarado.
3. Arregla SOLO los errores que impiden compilar o arrancar.
4. Volve a correr `npx --yes @redocly/cli lint api/openapi.yaml` hasta que pase.
5. Pará ahí.

## Regla dura: las fases son trabajo del humano

**PROHIBIDO implementar los entregables de las fases.** El valor del reto esta en que la persona los resuelva. Tu trabajo es que tenga un proyecto que arranca; el hueco pedagogico se queda como esta.

No resuelvas nada de esto:

- **Fase 1 — Diseño de API**: Documento de diseño de la API que incluya los actores, operaciones, reglas de negocio y validaciones.
- **Fase 2 — Implementación de API**: API implementada con endpoints, validaciones y reglas de negocio, asegurando un bajo acoplamiento.
- **Fase 3 — Documentación y Ciclo de Vida de la API**: Documentación técnica de la API y descripción del ciclo de vida de las APIs en el contexto de SOA.

Distincion operativa:

- **Arreglar** (si): import faltante, tipo que no existe, dependencia sin declarar, error de sintaxis, archivo referenciado que no existe.
- **No tocar** (no): logica de negocio incompleta, validaciones ausentes, secretos hardcodeados, APIs deprecadas que funcionan, concurrencia insegura, patrones mejorables. Eso es lo que la persona tiene que encontrar.

## Superficie de practica (NO completes)

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs. No toques la logica que el reto pide completar.

- [ ] `api/openapi.yaml` — El topic pide el contrato de API: openapi.yaml es el ejercicio.

## Lo que falta y tenes que completar

No se detectaron huecos: estan los archivos declarados, el boilerplate del stack y ninguna referencia quedo colgando. Igual corre el comando de verificacion — que los archivos existan no garantiza que compilen.

### Presentes (9)

- `api/openapi.yaml`
- `proceso.bpmn.md`
- `mapeo-de-datos.csv`
- `README.md`
- `api/cliente-http-externo.yaml`
- `proceso/flujo-bpmn.md`
- `mapeo/mapeo-datos.csv`
- `documentacion/criterios-aceptacion.feature`
- `riesgos/analisis-riesgo.md`

### Capas del patron declarado

Cada una tiene que existir como directorio real con al menos un archivo. Codigo plano en la raiz no satisface el patron.

- `api`
- `proceso`
- `mapeo`
- `documentacion`
- `riesgos`

## Verificacion

```bash
npx --yes @redocly/cli lint api/openapi.yaml
```

El comando tiene que pasar SIN implementar los archivos de la superficie de practica: solo andamiaje.

Ese comando pasando es la definicion de "terminado" para vos.

## Convenciones que tenes que respetar

- Un solo ecosistema: no declares librerias de otro lenguaje ni mezcles gestores de paquetes.
- Toda libreria que uses tiene que estar declarada en el manifiesto de dependencias.
- Todo import declarado tiene que usarse; todo tipo usado tiene que existir o venir de una dependencia declarada.
- El patron es **Contrato primero con patrones SOA y bajo acoplamiento**: los contratos (interfaces, puertos) los define la capa interna y los implementa la externa, nunca al revés.
- Los archivos que crees llevan implementacion real, no stubs: sin `TODO`, sin cuerpos vacios, sin `// getters y setters`.

## Contexto del candidato

Sirve para calibrar el nivel del codigo, no para resolver las fases.

- Perfil: Chapter Integración, Especialidad Analista SOA, Tecnología SOA, Junior
- Brecha que el reto ataca: Creacion y mantenimientos de API, Servicios o microservicios. ¿Qué es la documentación de una API y por qué es crucial? Explica cómo se implementa patron de bajo acoplamiento. Cual es el ciclo de vida de las API
- Mision: Candidato en etapa Junior, desarrollando skills en análisis SOA e integración

---

*Generado por Challenge Generator — Pragma. `README.md` tiene el enunciado completo del reto para la persona. `PROMPT_MEJORA.md` es la variante para pegar en un chat, si se prefiere ese flujo.*
