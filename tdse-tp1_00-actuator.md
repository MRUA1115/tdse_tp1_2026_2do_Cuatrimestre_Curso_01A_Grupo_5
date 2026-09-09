Descripción del Comportamiento (Modelo Actuator)
El modelo Actuator gestiona el comportamiento físico de una salida digital (un LED). Un LED puede tener múltiples modos de operación: apagado, encendido o titilando/parpadeando (blinking).
Para lograr el parpadeo en un entorno temporizado sin utilizar retardos bloqueantes (delay), el modelo escucha el evento tick generado cada 1ms y utiliza una variable de temporización (DEL_ACT_NAME) para conmutar el estado del LED a un intervalo determinado (por ejemplo, cada 500 ms).

Eventos (Triggers)
Los eventos que desencadenan respuestas o cambios de modo en el modelo Actuator provienen de las señales enviadas por el modelo System y del reloj temporizado:
1. EV_ACT_LED_OFF (Signal / Trigger): Evento enviado por el modelo System para ordenar que el LED pase al estado apagado de forma permanente.
2. EV_ACT_LED_ON (Signal / Trigger): Evento enviado por el modelo System para ordenar que el LED pase al estado encendido de forma permanente.
3. EV_ACT_LED_BLINK (Signal / Trigger): Evento enviado por el modelo System para ordenar que el LED ingrese en modo de destello/parpadeo periódico.
4. tick: Evento temporizado recibido cada 1ms, utilizado para contabilizar los períodos de encendido y apagado durante el modo blinking.

Acciones (Effects)
Las acciones del modelo Actuator ejecutan la manipulación directa de la salida digital del microcontrolador o modifican variables de control de tiempo:
Funciones / Salida física (Digital Output):
1. led_turn_on(): Acción de bajo nivel que asigna valor lógico alto (1 / High) a la salida digital donde se conecta el LED.
2. led_turn_off(): Acción de bajo nivel que asigna valor lógico bajo (0 / Low) a la salida digital donde se conecta el LED.

Variables de control de tiempo (Convención DEL_ACT_NAME):
1. DEL_ACT_NAME = 0: Inicialización o reseteo de la variable de temporización del actuador al ingresar al modo de parpadeo o al conmutar de pulso.
2. DEL_ACT_NAME++: Incremento de la variable temporizadora en cada llamada de 1ms (tick).
3. [DEL_ACT_NAME >= MAX_DEL_ACT]: Condición de guarda (guard) que verifica si transcurrió el semiciclo de parpadeo para realizar la alternancia del LED.

**Actuator Statechart - State Transition Table**

| Current State | Event | [Guard] | Next State | Actions |
| :---: | :---: | :---: | :---: | :---: |
| **ST_ACT_OFF** | EV_ACT_LED_ON | - | **ST_ACT_ON** | led_turn_on() |
| **ST_ACT_OFF** | EV_ACT_LED_BLINK | - | **ST_ACT_BLINK_ON** | led_turn_on(), DEL_ACT_NAME = 0 |
| **ST_ACT_OFF** | EV_ACT_LED_OFF / tick | - | **ST_ACT_OFF** | - |
| **ST_ACT_ON** | EV_ACT_LED_OFF | - | **ST_ACT_OFF** | led_turn_off() |
| **ST_ACT_ON** | EV_ACT_LED_BLINK | - | **ST_ACT_BLINK_ON** | led_turn_on(), DEL_ACT_NAME = 0 |
| **ST_ACT_ON** | EV_ACT_LED_ON / tick | - | **ST_ACT_ON** | - |
| **ST_ACT_BLINK_ON** | EV_ACT_LED_OFF | - | **ST_ACT_OFF** | led_turn_off() |
| **ST_ACT_BLINK_ON** | EV_ACT_LED_ON | - | **ST_ACT_ON** | led_turn_on() |
| **ST_ACT_BLINK_ON** | tick | [DEL_ACT_NAME < MAX_DEL_ACT] | **ST_ACT_BLINK_ON** | DEL_ACT_NAME++ |
| **ST_ACT_BLINK_ON** | tick | [DEL_ACT_NAME >= MAX_DEL_ACT] | **ST_ACT_BLINK_OFF** | led_turn_off(), DEL_ACT_NAME = 0 |
| **ST_ACT_BLINK_OFF** | EV_ACT_LED_OFF | - | **ST_ACT_OFF** | led_turn_off() |
| **ST_ACT_BLINK_OFF** | EV_ACT_LED_ON | - | **ST_ACT_ON** | led_turn_on() |
| **ST_ACT_BLINK_OFF** | tick | [DEL_ACT_NAME < MAX_DEL_ACT] | **ST_ACT_BLINK_OFF** | DEL_ACT_NAME++ |
| **ST_ACT_BLINK_OFF** | tick | [DEL_ACT_NAME >= MAX_DEL_ACT] | **ST_ACT_BLINK_ON** | led_turn_on(), DEL_ACT_NAME = 0 |

