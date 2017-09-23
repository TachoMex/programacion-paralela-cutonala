# Práctica 3
#### Grapes makes wine, wine makes REST.

## Objetivos
- Levantar un servidor WEB en Ruby.
- Aprender a utilizar Grape.
- Aprender a implementar servicios REST.
- Conocer los verbos del protocolo HTTP.
- Conocer los códigos de respuesta de HTTP.

## Indicaciones
- Crear un servidor de autenticación con lo realizado en la práctica 2.
- El servicio debe permitir la gestión de:
    - *usuarios*
    - *sitios*
    - *contraseñas*.
- Para cada servicio, se deberá soportar altas, bajas y consultas. La modificación puede realizarse como una baja y una alta.
- Los nombres de usuarios y de los sitios deben estar limitados a letras, números y guion bajo.
- La alta de una contraseña se entenderá como el acceso a un sitio.
- La aplicación deberá servir de solo objetos serializados con el formato JSON
- 10% adicional si se implementa JWT para firmar los tokens.

## Especificaciones técnicas
### Rutas a implementar
- `GET /api/sites` - listar los usuarios
- `GET /api/sites/:site/users` - listar usuarios registrados en el sitio
- `POST /api/sites/` - crear sitio
- `POST /api/sites/:site/auth` - autenticar usuario, responderá con un token.
- `POST /api/sites/:site/register` - registrar usuario en el sitio.
### Ayuda
- Se deberá implementar el formato JSend para los mensajes. Se vale utilizar la gema RubyAntServer.
- Dentro viene una plantilla con el servidor corriendo.
- La gema RubyAntServer no esta disponible aun en rubygems.


### Recursos
- Gema RubyAntServer https://github.com/KueskiEngineering/ruby-ant-server
- Especificaciones JSend https://labs.omniti.com/labs/jsend
- Postman para hacer las pruebas desde chrome. https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop
- JWT https://github.com/jwt/ruby-jwt
