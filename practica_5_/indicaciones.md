# Práctica 5
#### One does only move the body into the file, and viceversa

## Objetivos
- Implementar un servidor de archivos.
- Manejo de archivos y directorios en ruby.
- Aprender el concepto de 'directory traversal'

## Indicaciones
Crear una aplicación en Grape similar a las prácticas 3 y 4 que soporte las siguientes operaciones:
- mostrar los archivos de un directorio
- crear un directorio
- crear un archivo
- borrar un archivo
- copiar un archivo/carpeta
- mover un archivo/carpeta
Los archivos deben ir en una carpeta dentro del proyecto llamada `resources`. Todos los archivos que el usuario mande deben ser almacenados dentro de esa carpeta. 

## Especificaciones técnicas
### Rutas a implementar
- `GET` Todas las rutas retornan el archivo que se encuentra guardado segun la ruta de la petición. Si la ruta solicitada no existe retornara un error 404. Si la ruta es una carpeta, retornara en un JSON la lista de archivos y subdirectorios.  
- `POST` Cualquier ruta. Si el cuerpo de la peticion esta vacio, entonces se considerara como una operacion de creación de carpeta. Si tiene contenidos, se creará el archivo en la ruta dada.
- `PATCH` según la variable `:command` (`cp`, `mv`), ser mueve/copia el archivo/carpeta de `:source` a `:target`.
- `DELETE` todas las rutas eliminaran el archivo en la ruta dada. Hay que tener cuidado de no
  permitir el borrado de carpetas que contengan cualquier objeto.
- 10% extra si la aplicación se protege de la vulnerabilidad 'directory traversal'.

### Recursos
- Mas detalles de la directory traversal https://es.wikipedia.org/wiki/Directory_traversal
- Definir un mismo comportamiento para todas las rutas:
```ruby
module FileServer
  class API < Grape::API
    get '*path' do
      "You requested `#{params[:path]}`"
    end
  end
end
```
