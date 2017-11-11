# Proyecto De Integración: Chat Distribuido

# Objetivos
- Integrar las prácticas realizadas en una sola aplicación
- Implementar un chat escalable, distribuido y confiable
- Adquirir experiencia desarrollando aplicaciones con microservicios.

# Especificaciones
El sistema debe reutilizar las prácticas anteriores para manejar usuarios (Sistema de autenticación), envio de mensajes (Sistema de colas) y almacenar fotos y archivos (sistema de archivos de distribuido).

Se requieren evaluar los siguientes casos de uso:

- Control de usuarios (30%)
   - Registrar usuario (12 puntos)
   - Acceder con contraseña correcta (6 puntos)
   - Negar el acceso si el usuario no existe (2 puntos)
   - Negar el acceso si la contraseña es incorrecta (2 puntos)
   - Evitar que se pueda registrar el usuario si ya existe (2 puntos)
   - Cambio de contraseña (6 puntos)
- Salas de chat (50%)
   - Crear un chat 1 a 1 (5 puntos)
   - Crear un chat grupal  (5 puntos)
   - Consultar la lista de chats (5 puntos)
   - Añadir un usuario a un chat (5 puntos)
   - Eliminar un usuario de un chat (5 puntos)
   - Enviar un mensaje a un chat (5 puntos)
   - Consultar los mensajes de un chat, paginados de 100 en 100 (10 puntos)
   - Enviar un mensaje a un chat no existente (2 puntos)
   - Enviar un mensaje a un chat no registrado (2 puntos)
   - Consultar un chat no registrado (2 puntos)
   - Crear un chat ya existente (2 puntos)
   - Negar registrar un usuario a un chat personal (2 puntos)

- Archivos (20 %)
   - Crear/remplazar foto de perfil (5 puntos)
   - Bajar foto de perfil (5 puntos)
   - Adjuntar archivo por mensaje (5 puntos)
   - Bajar archivo adjunto (3 puntos)
   - Intentar bajar un archivo no existente (2 puntos)

- Puntos Negativos
  - Si la aplicación se detiene (10 puntos).
  - Mandar stacktrace o indicios de le excepción en la respuesta. (5 puntos).

# Evaluación
La evaluación de cada punto se hará por back end, no es necesario implementar una interfaz gráfica. Para las pruebas se puede utilizar CURL o el test de pruebas que viene integrado en los códigos de apoyo.

# Puntos Extra
Si se acompaña con una interfaz gráfica, se obtendra un 20% extra. El lenguaje para la GUI es libre.
- Ventana de acceso, user y password
- Botón de registro, user y password
- Lista de chats y botón para crear chat.
- Vista de chats (participantes, añadir participante)
- Vista de mensajes
- subida de archivos
- Bajada de archivos

# Código de apoyo
- Uso de helpers para la sesión (JWT/BasicAuth)
- Cliente HTTP (subir archivo .gem y ejemplo)
- Uso de logs (CuteLogger)
- Subir el set de pruebas
