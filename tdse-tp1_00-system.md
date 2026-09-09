Descripción del Comportamiento (Modelo System)
El módulo System es el encargado de la lógica de procesamiento central del sistema de control del dispensador de tickets / barrera (simplificado en la abstracción a botonera e indicadores LED).
Este modelo corre temporizado a 1ms (tick) y reacciona a las señales validadas que le envía el modelo Sensor (EV_SYS_BTN_DOWN, EV_SYS_BTN_UP). A partir de estos eventos y de temporizadores internos, determina el estado del sistema y genera señales que comandan al modelo Actuator (como encender, apagar o hacer titilar un LED).

Eventos (Triggers)
Los eventos que desencadenan respuestas o transiciones en el modelo System provienen del modelo Sensor y del tick de tiempo:
1. EV_SYS_BTN_DOWN (Signal / Trigger): Evento recibido desde el modelo Sensor que notifica que el botón ha sido presionado de forma estable (después del filtrado antirrebote).
2. EV_SYS_BTN_UP (Signal / Trigger): Evento recibido desde el modelo Sensor que notifica que el botón ha sido liberado de forma estable.
3. tick: Evento de temporización recibido cada 1ms para actualizar contadores y controlar el tiempo que el sistema permanece en determinados estados.

Acciones (Effects)
Las acciones del modelo System consisten en señales dirigidas al modelo Actuator, llamadas a funciones o la modificación de variables temporizadoras de control (timer):
Signals hacia el modelo Actuator (Convención EV_ACT_NAME):
1. EV_ACT_LED_ON: Señal emitida hacia el modelo Actuator para ordenar que el LED/actuador se encienda.
2. EV_ACT_LED_OFF: Señal emitida hacia el modelo Actuator para ordenar que el LED/actuador se apague.
3. EV_ACT_LED_BLINK: Señal emitida hacia el modelo Actuator para ordenar que el LED entre en modo destello/parpadeo.

Variables de control de tiempo (Convención DEL_SYS_NAME):
1. DEL_SYS_NAME = 0: Inicialización o reseteo de la variable de temporización del sistema al ingresar a un estado o al detectar un evento determinado.
2. DEL_SYS_NAME++: Incremento de la variable de temporización en cada ciclo de 1ms (tick).
3. [DEL_SYS_NAME >= MAX_DEL_SYS]: Uso de la variable temporizadora como condición de guarda (guard) para autorizar una transición por timeout o cumplimiento de un intervalo de tiempo.

4. 
