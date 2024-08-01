# Práctica 6
#### The index leads the way

## Objetivos
- Implementar un indexador para el servidor de archivos.
- Creación de un cliente http.

## Indicaciones
- Tomando como base la práctica 5, debe ser modificada para integrarse al indexador.
- En las rutas `GET` de la práctica 5, agregar la opción `hash=true`, que retornará
  en un json el hash `sha1` del archivo.
- El servidor indexador no almacenara ningún archivo, solo guardará en una base de datos
  la dirección ip / puerto de dónde se almacenó el archivo y el hash, además.
- Como respuesta al cliente, se le enviará la ruta donde esta almacenado el archivo.
- Deberá implementarse un demonio que se encargue de estar replicando los archivos entre otros
  servidores (buscará tener el archivo en 2 servidores a la par).
- El registro de servidores será por base de datos
- La comunicación hacia el servidor de archivos será por un cliente http propio.
- Recomiendo utilizar HTTParty para hacer la comunicación.

## Especificaciones técnicas
### Tablas
- server:
  - URI - primary key
- file:
  - path - primary key
  - hash
  - status (DELETED ACTIVE PENDING_DELETE PENDING_COPY)
  - updated_at
- location:
  - path - foreign key
  - server - foreign key
  - primary key (path, server)

### Rutas a implementar
- `GET` buscará el archivo en algún servidor y comparará que el hash sea valido. En caso de fallo
        borrara el archivo del servidor y buscara en otro servidor el archivo. Si no no lo encuentra
        retornarar un error 404. Si lo encuentra, el URI donde se encuentra el recurso (http://server:port/path)  
- `POST` creara el archivo en algún servidor y lo guardara en la base de datos. El demonio será quien lo
         replique después.
- `PATCH` Renombra el path del archivo en algún servidor, el archivo viejo se marca como pendiente de eliminación
          y la nueva ruta se marca como pendiente de replicación.
- `DELETE` Marca como eliminado el archivo. El demonio debería de eliminarlo de los servidores.
#### Rutas a agregar en la práctica 5
  `GET` si el parametro `hash` esta en la petición y es verdadero, se calculara el hash `sha1` y esa será la respuesta.
#### Sobre el demonio de actualización
- Será un hilo que se arrancara justo antes de lanzar el servidor HTTP. Hay que tener cuidado que si se cierra la aplicación, se espere a que el demonio termine su última transacción.
- El proceso será el siguiente:
    - Tomar el siguiente registro ordenado por `updated_at` en la base de datos que sea `PENDING_COPY` o
      `PENDING_DELETE`.
    - Atender el mensaje.
    - `PENDING_COPY` se cambiará a `ACTIVE` si hay al menos 2 copias del archivo.
    - `PENDING_DELETE` se camabiara a `DELETE` si se ha eliminado de todos los servidores.

## Recursos
- Uso de HTTParty https://github.com/jnunemaker/httparty
- Calcular SHA1 en ruby https://ruby-doc.org/stdlib-2.4.0/libdoc/digest/rdoc/Digest/SHA1.html
- Crear Hilos en Ruby https://ruby-doc.org/core-2.2.0/Thread.html
