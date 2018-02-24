# Práctica 5
#### Queues for all the world!

## Objetivos
- Implementar un sistema de colas distribuidas
- Uso de transacciones de bases de datos.

## Indicaciones
- Implementar un servicio que provea de colas mediante un servidor web.
- Las especificaciones técnicas de implementación conjugan lo hecho en las prácticas anteriores.
- Se deberán utilizar transacciones para las operaciones de lectura y escritura sobre las colas.
- Las operaciones soportadas son:
   - Crear una cola por un nombre.
   - Listar las colas existentes.
   - Suscribir usuario a una cola.
   - Marcar todos los mensajes pendientes como leídos.
   - Escribir un mensaje en la cola.
   - Leer el siguiente mensaje de la cola.

## Especificaciones técnicas
### Rutas a implementar
- GET `/api/queues` listar
- POST `/api/queues` crear, el nombre se manda en el campo 'queue'
- POST `/api/:queue/subscribe` suscribirse, el nombre del suscriptor se manda en el campo subscriber
- POST `/api/:queue/purge` marcar mensajes pendientes como leidos.
- POST `/api/:queue` escribe un mensaje. El cuerpo de la petición es el contenido del mensaje.
- POST `/api/:queue/:subscriber` Lee el siguiente mensaje del subscriptor.
### Casos esquina
- Si alguien se suscribe a una cola existente y que ya tiene mensajes, debera de ver los mensajes anteriores.
- Si se tiene un mensaje y varios solicitan a la par el mismo mensaje, solo uno debe recibirlo.
- Si se escriben 2 mensajes a la par, se debe asegurar de que el servicio almacene ambos mensajes.
### Extra
- 10% extra
  - Soporta en POST `/api/:queue/:subscriber` la opción `skip_delete` al momento de leer el mensaje, que pone el mensaje en espera. Se debe agregar un identificador al mensaje y retornarlo.
  - Agregar POST `/api/:queue/:subscriber/mark_done/:message` que recibe el identificador del mensaje y lo pone como
  hecho.
  - Si pasan 5 minutos y un mensaje que no se borró nunca se confirmó, se debe marcar como no leido y estar en espera de nuevo.
  - Si se confirma un mensaje como procesado 5 minutos después, no se podrá confirmar.
