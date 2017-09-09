# Práctica 2
#### There's always a Sequel

## Objetivos
- Utilización de bases de datos en Ruby
- Familiarizarse con el concepto de 'migracioens'
- Implementación de clases en Ruby
- Uso de herencia
- Uso de polimorfismo
- Gestión de configuraciones con archivos YAML
- Conocimiento de almacenamiento de contraseñas

## Incicaciones
- Crear una base de datos en algún motor (MySQL o PostgreSQL).
- Crear el esquema de bases de datos para almacenar:
  * Usuarios
  * Sitios
  * Contraseñas de los Usuarios en diversos sitios
  * Un usuario puede tener una contraseña distinta en cada sitio
  * Las tablas deben tener un indice incremental
- Implementar una migración con Sequel para crer cada tabla
- Las configuraciones de los archivos deben cargarse de un archivo YAML.
- Por cada entidad debe haber una clase que admita los 3 tipos de consulta ABC:
   * Altas
   * Bajas
   * Consultas
 - Abstraer en una clase abstracta de forma que se pueda reutilizar la mayor cantidad de codigo.
 - Los metodos requeridos son:
   - `initialize` un constructor que crea el objeto detallando los campos.
   - `register` almacena el objeto en la base de datos.
   - `by_id` un método de clase que crea el objeto desde la base de datos.
   - `list_all` que trae todos los objetos de la base de datos.
   - `by_name` que busca el dato por nombre y lo instancia.
 - Las contraseñas deben guardarse utilizando salteados.
 - 5% extra por implementar una función para actualizar la contraseña.
 - 5% extra si no tiene ninún comentario de rubocop

## Forma de entrega
- La tarea debe subirse al repositorio creado en la practica 1, pero esta vez en la carpeta `practica_2`
- Por favor incluyan el archivo `/practica_2/test.rb` también que está en este repositorio para poder hacer las pruebas.
- Agregar todos los archivos necesarios, respetando las siguientes carpetar:
  * `/practica_2/models/migrations` archivos de migración. Deben ir numerados a 3 digitos empezando por `001`.
  * `/practica_2/config/config.yaml.sample` Contiene un archivo con keys falsos a modo de ejemplo. El archivo real estará aqui mismo sin la extension sample.
  * `/practica_2/controllers/` Contiene las clases solicitadas en la práctica
  * incluir un `/practica_2/Gemfile` donde se definan las dependencias.
- Fecha de entrega antes del Sábado 23 de septiembre de 2017 23:59:59 (GMT-5)

## Recursos de ayuda
- Archivos yaml. http://www.webtutoriales.com/articulos/yaml
- Migraciones en Sequel. http://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html
- Consultas en Sequel. http://sequel.jeremyevans.net/rdoc/files/doc/cheat_sheet_rdoc.html
- La forma correcta de almacenar contraseñas. https://crackstation.net/hashing-security.htm
- Bcrypt en Ruby https://github.com/codahale/bcrypt-ruby
