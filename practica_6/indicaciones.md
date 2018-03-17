# Práctica 6
#### *Mold, assemble, paint, pack, deliver*

## Objetivos
- Aprender a utilizar el patrón de diseño `Adapter`
- Conocimientos básicos de recabación de evidencias en sistemas de producción.
- Aprender a instalar y utilizar Kafka de forma básica.
- Implementación de demonios.
- Armado de "lineas de ensamble" (pipelines).

## Instrucciones
- Instalar `kafka` mediante la terminal, se adjunta enlace a un tutorial para su instalación en ubuntu. Deberá instalarse ademas `zookeper`.
- Todas las salidas de los comandos introducidos en la consola deben ser guardados y adjuntados en el archivo `evidencias_kafka.log`.
- Con base al proyecto de ejemplo, crear una aplicación similar que levante varios demonios para cada paso del ensamblado.
- El consumo de mensajes debe implementarse con el patrón de diseño `Adapter`, de modo que si se implementa un adaptador para el servicio realizado en la práctica 5, la aplicación pueda seguir funcionando con tan solo modificar una configuración.

## Línea de ensamble
- El objetivo es crear pasos **granulares** que realicen tareas pequeñas con una complejidad muy pequeña.
- Cada paso potencialmente puede enviar mensajes nuevos para que nuevos mensajes se procesen.
- La línea de ensamble tendrá como objetivo procesar imágenes que fueron subidas a una aplicación.

## Demonios
- `NewImageUploaded`. Su objetivo es iniciar el flujo, deberá recibir la ruta del archivo con la imágen que se va a procesar.
- `MetadataExtractor`. Utilizando `exiftool`, se extraeran los metadatos de la imagen y se almacenaran en un archivo `json`.
- `MetadataCleaner`. De nuevo, utilizando `exiftool`, se deben remover los metadatos de la imagen.
- `ImageConverter`. Utilizando `ImageMagick`, convertir la imagen a un formato jpg con una calidad baja y almacenarla en otro formato.

## Coordinación
Debe diseñarse una estructura que permita los pasos ser ejecutados con base a dependencias y que evite que se procesen de forma incorrecta los datos. Por ejemplo, si se procesara primero el limpiado de metadatos, el demonio que los extrae no podría hacer este trabajo.

Por cada dependencia, debe crearse un tópico en kafka y escribir los mensajes a ese tópico. Por ejemplo, puede crearse un tópico para `NewImageUploaded`, y este a su vez escribir al tópico `ImagePipeline`. El demonio `MetadataExtractor` puede escribir al tópico `ImageMetadaRetrieved`, que será tomado por `MetadataCleaner`.

El cuerpo del mensaje sera un json con el campo `image` con la ruta absoluta al archivo.

## Recursos
- Exiftool en ruby  https://github.com/mceachen/exiftool.rb

- Instalación de kafka https://www.digitalocean.com/community/tutorials/how-to-install-apache-kafka-on-ubuntu-14-04

- ImageMagick en ruby https://github.com/minimagick/minimagick
