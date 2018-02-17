#### There's always a Sequel

## Objetivos
- Utilización de bases de datos en Ruby
- Implementación de clases en Ruby
- Uso de herencia
- Uso de polimorfismo
- Conocimiento de almacenamiento de contraseñas
- Patrones de diseño "Dependency Injection" y "Factory"

## Indicaciones
Con la base de datos de la práctica 2:
- Abstraer en una clase abstracta de forma que se pueda reutilizar las siguientes operaciones:
   * Altas
   * Bajas
   * Consultas
 - Por cada entidad debe haber una clase que admita los 3 tipos de consulta ABC:
 - Pasar las conexiones a la base de datos con el patrón "Dependency Injection"
 - Los metodos requeridos son:
  * Con el patrón factory:
    - `create` Crea el objecto y lo almacena en la base de datos.
    - `by_id` un método de clase que crea el objeto desde la base de datos.
    - `list_all` que trae todos los objetos de la base de datos.

  - `initialize` un constructor que crea el objeto detallando los campos.
 - Las contraseñas deben guardarse utilizando salteados (Bcrypt)
 - 5% extra por implementar una función para actualizar la contraseña.
 - 5% extra si no tiene ningún comentario de rubocop

## Forma de entrega
- La tarea debe subirse al repositorio creado en la practica 1, pero esta vez en la carpeta `practica_2`
- Por favor incluyan el archivo `/practica_2/test.rb` también que está en este repositorio para poder hacer las pruebas.
- Agregar todos los archivos necesarios, respetando las siguientes carpetar:
  * `/practica_2/models/migrations` archivos de migración. Deben ir numerados a 3 digitos empezando por `001`.
  * `/practica_2/config/config.yaml.sample` Contiene un archivo con keys falsos a modo de ejemplo. El archivo real estará aqui mismo sin la extension sample.
  * `/practica_2/controllers/` Contiene las clases solicitadas en la práctica
  * incluir un `/practica_2/Gemfile` donde se definan las dependencias.
- Fecha de entrega antes del Sábado 3 de Marzo de 2018 23:59:59

## Recursos de ayuda
- Consultas en Sequel. http://sequel.jeremyevans.net/rdoc/files/doc/cheat_sheet_rdoc.html
- La forma correcta de almacenar contraseñas. https://crackstation.net/hashing-security.htm
- Bcrypt en Ruby https://github.com/codahale/bcrypt-ruby
