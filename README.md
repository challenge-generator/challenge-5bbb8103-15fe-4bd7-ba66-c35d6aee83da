# Desarrollo de Habilidades en Análisis SOA e Integración

Como analista de integración en una empresa de fintech, tu tarea es crear y mantener APIs y microservicios que garanticen la interoperabilidad entre diferentes sistemas. La documentación de una API es crucial para asegurar que otros desarrolladores puedan utilizarla de manera efectiva. Además, debes implementar patrones de bajo acoplamiento para facilitar la mantenibilidad y escalabilidad del sistema. El ciclo de vida de las APIs incluye etapas como diseño, implementación, documentación, publicación, monitoreo y retiro. Tu objetivo es desarrollar habilidades en análisis SOA e integración.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Implementación SOA - API - MicroServicios |
| **Nivel** | junior-l1 |
| **Tipo** | practical |
| **Tiempo estimado** | 15 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y generará un ZIP listo para usar.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y generará un archivo ZIP descargable. Descárgalo y extráelo en la carpeta donde quieras trabajar.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no genera el ZIP automáticamente al terminar el análisis, escríbele: "genera el ZIP ahora".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Diseño de API

**Objetivo:** Crear un diseño conceptual de una API que cumpla con los requisitos del dominio de fintech.

**Tiempo estimado:** 5 horas

**Instrucciones:**

- Identificar los actores involucrados en la API (ej. originador de créditos, motor antifraude, buró de riesgos).
- Definir las operaciones que la API debe soportar (ej. registro de solicitud de crédito, consulta de historial de crédito).
- Establecer las reglas de negocio y las validaciones necesarias (ej. prohibición de solicitudes duplicadas, verificación de solvencia).

**Entregable:** Documento de diseño de la API que incluya los actores, operaciones, reglas de negocio y validaciones.

<details>
<summary>Pistas de conocimiento</summary>

- Considerar la idempotencia en las operaciones de la API.
- Evaluar la consistencia entre los diferentes sistemas involucrados.

</details>

### Fase 2: Implementación de API

**Objetivo:** Implementar la API diseñada en la fase anterior, asegurando un bajo acoplamiento entre los componentes.

**Tiempo estimado:** 5 horas

**Instrucciones:**

- Crear los endpoints necesarios para las operaciones definidas en la fase de diseño.
- Implementar las validaciones y reglas de negocio identificadas.
- Asegurar un bajo acoplamiento entre los componentes de la API.

**Entregable:** API implementada con endpoints, validaciones y reglas de negocio, asegurando un bajo acoplamiento.

<details>
<summary>Pistas de conocimiento</summary>

- Utilizar patrones de diseño que promuevan el bajo acoplamiento.
- Considerar la tolerancia a fallos en la implementación.

</details>

### Fase 3: Documentación y Ciclo de Vida de la API

**Objetivo:** Documentar la API implementada y entender el ciclo de vida de las APIs en el contexto de SOA.

**Tiempo estimado:** 5 horas

**Instrucciones:**

- Crear documentación técnica de la API que incluya los endpoints, las operaciones soportadas, las reglas de negocio y las validaciones.
- Describir el ciclo de vida de las APIs y cómo se aplica en el contexto de SOA.
- Identificar las etapas del ciclo de vida en las que se encuentra la API implementada.

**Entregable:** Documentación técnica de la API y descripción del ciclo de vida de las APIs en el contexto de SOA.

<details>
<summary>Pistas de conocimiento</summary>

- Utilizar herramientas de documentación como Swagger o Postman.
- Considerar la importancia de la documentación en el mantenimiento y evolución de la API.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es una API y cuál es su importancia en el contexto de SOA?
- **paraQueSirve**: ¿Para qué sirve la documentación de una API y cómo se implementa el patrón de bajo acoplamiento?
- **comoSeUsa**: ¿Cómo se utilizan las APIs en el ciclo de vida de los servicios en SOA?
- **erroresComunes**: ¿Cuáles son los errores comunes en la implementación y mantenimiento de APIs y cómo se pueden evitar?
- **queDecisionesImplica**: ¿Qué decisiones implica el diseño y mantenimiento de APIs en el contexto de SOA?

## Criterios de Evaluacion

- Diseñar una API que cumpla con los requisitos del dominio de fintech.
- Implementar la API asegurando un bajo acoplamiento entre los componentes.
- Documentar la API y entender el ciclo de vida de las APIs en el contexto de SOA.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT). Devuelve un ZIP con el proyecto. Sirve si no tenes un agente en el IDE.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
npx --yes @redocly/cli lint api/openapi.yaml
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
