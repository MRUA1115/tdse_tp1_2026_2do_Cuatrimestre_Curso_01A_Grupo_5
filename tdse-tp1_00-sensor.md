
Descripción del Comportamiento (Sensor de un solo botón)
Este modelo describe un módulo que se ejecuta con una temporización de 1ms para "escrutar" el estado físico del botón. Su función principal es lidiar con el rebote del pulsador ("switch bounce" o "debouncing"), un fenómeno mecánico que genera múltiples fluctuaciones antes de que la señal eléctrica se estabilice.

Eventos (Triggers)
Un sensor del tipo binario genera 2 (dos) eventos que reflejan su valor binario asociados a su posición física. Para procesarlos se utiliza la convención EV_BTN_NAME:  
1. EV_BTN_PRESSED: Evento que actúa como trigger e indica que el pulsador se encuentra en la posición de presionado.  
2. EV_BTN_NOT_PRESSED: Evento que actúa como trigger e indica que el pulsador se encuentra en la posición de no presionado o liberado.  
3. tick: Evento de actualización de tiempo generado cada 1ms, el cual es necesario para medir el tiempo de estabilización de la señal y filtrar el rebote mecánico.

Acciones (Effects)
El modelo cuenta con al menos 2 (dos) acciones que reflejan que hubo un cambio real y estable en la posición del botón. Estas se expresan usando la convención EV_SYS_NAME (para señales) y DEL_BTN_NAME (para el timer):

1. EV_SYS_BTN_DOWN (Signal): Acción que emite una señal o evento hacia el modelo System informando que el botón se ha presionado de forma firme y estable.
2. EV_SYS_BTN_UP (Signal): Acción que notifica mediante una señal al modelo System que el botón ha sido soltado y su estado de liberación es estable.
3. DEL_BTN_NAME = 0 (Modificación de variable): Acción de inicialización o reseteo de la variable de control de tiempo (timer) al detectar un flanco en la señal.
4. DEL_BTN_NAME++: Acción de incremento del timer, utilizado como condición o guard (ej. [guard]) para autorizar una transición de estado recién cuando haya pasado el tiempo necesario para ignorar los rebotes.
