# Práctica 2
#### There's always a Sequel

## Objetivos
- Utilización de bases de datos en Ruby
- Familiarizarse con el concepto de 'migracioens'
- Gestión de configuraciones con archivos YAML
- Patrón de diseño "Singleton"

## Incicaciones
- Crear un Gemfile con las gemas de `sequel` y `safe_yaml`.
- Agregar el Gemfile la gema para el motor de base de datos usado.
  - `mysql2` para MariaDB y MySQL
  - `pg` para PostgreSQL.
- Crear una clase con el patrón Singleton para gestionar los servicios.
- Implementar el metodo `configure!` para cargar la configuración y registrar los servicios.
- Las configuraciones de los archivos deben cargarse de un archivo YAML.
- Para esta práctica solo es necesario el servicio `database`.
- correr el comando `bundle install` para instalar las gemas.
- Crear una base de datos en algún motor (MySQL/PostgreSQL/MariaDB).
- Crear el esquema de bases de datos para almacenar:
  * Usuarios
  * Sitios
  * Contraseñas de los Usuarios en diversos sitios
  * Un usuario puede tener una contraseña distinta en cada sitio
  * Las tablas deben tener un indice incremental
- Implementar una migración con Sequel para crear cada tabla
- Correr las migraciones con el comando `sequel -m`
- Realizar con sequel las siguientes consultas:
 - insertar un usuario, un sitio y un registro.
 - cambiar el correo de un usuario.
 - Listar todos los usuarios registrados en el sitio X.
 - Listar todos los sitios en los que esta registrado el usuario X.
 - Hacer un reporte de todos los usuarios registrados en todos los sitios ordenados por orden alfabetico iniciando por el nombre y despues el sitio.


## Forma de entrega
- La tarea debe subirse al repositorio creado en la practica 1, pero esta vez en la carpeta `practica_2`
- Agregar todos los archivos necesarios, respetando las siguientes carpetar:
  * `/practica_2/models/migrations` archivos de migración. Deben ir numerados a 3 digitos empezando por `001`.
  * `/practica_2/config/config.yaml.sample` Contiene un archivo con keys falsos a modo de ejemplo. El archivo real estará aqui mismo sin la extension sample.
  * El archivo `/practica_2/queries.rb` contendra las consultas.
- Fecha de entrega antes del Sábado 17 de Febrero de 2018 23:59:59.

## Recursos de ayuda
- Archivos yaml. http://www.webtutoriales.com/articulos/yaml
- Migraciones en Sequel. http://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html
- Consultas en Sequel. http://sequel.jeremyevans.net/rdoc/files/doc/cheat_sheet_rdoc.html
