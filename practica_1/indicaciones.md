# Práctica 1

##### *Coding Ruby like a Rockstar*

## Objetivos
- Configurar el entorno de desarrolllo en ruby.
- Familiarizarse con el lenguaje Ruby
- Uso de listas
- Uso de cadenas
- Introducción a los patrones de diseño
- Uso de clases y modulos
- Uso de bloques
- Salida estándar
- Uso de linters
- Uso de un sistema de control de versiones

## Entorno recomendado
- IDE: Sublime Text, Atom, RubyMine, VS code
- Sistema Operativo recomendado: Linux
- Git
    - Instalación
    - Registrarse en github
    - Crear un repositorio público con el nombre de la materia

## Indicaciones
- Implementar el algoritmo de cifrado César
  + Escribir una función `ceasars_crypt` que recibe una cadena y la retorna cifrada.
  + Se debe limpiar de otros caracteres y mantener solo las letras.
  + El resultado deberá ir en mayúsculas
  + Ejemplo:
     * `ceasars_crypt('hola mundo!!') = 'UBYNZHAQB'`
     * `ceasars_crypt('UBYNZHAQB') = 'HOLAMUNDO'`
- Verificar si cualquier cadena es un palíndromo
  + Escribir una función `palindrome?` que reciba una cadena y retorne en un valor booleano si es es un palíndromo o no.
  + Ejemplo:
    * `palindrome?(abcdcba) = true`
    * `palindrome?(abcddcba) = true`
    * `palindrome?(nope) = false`
- Escribir una una función que calcule la suma de los cuadrados de un arreglo
  + la función se llamará `sum_squares` y recibirá un arreglo.
  + Ejemplo:
    * `sum_squares([1, 2, 3]) = 14`
- Implementar un "decorator" que implemente el patrón de diseño "Circuit Breaker"
- 5% extra si no tiene ningún comentario de rubocop
- 5% extra si está ordenada la historia en git. (ver recursos de git)

## Forma de entrega
- Enviar por correo el enlace al repositorio en github. Sólo se recibirán las tareas por éste medio.
- El contenido de la práctica deberá ir en la carpeta `/practica_1/practica.rb`
- Por favor incluyan el archivo `/practica_1/test.rb` también que está en este repositorio para poder hacer las pruebas.
- Fecha de entrega antes del Sábado 10 de Febrero de 2018 23:59:59

## Recursos de ayuda:
 - https://es.wikipedia.org/wiki/Pal%C3%ADndromo
 - https://en.wikipedia.org/wiki/Caesar_cipher
 - https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
 - https://help.github.com/articles/create-a-repo/
 - https://rubyinstaller.org/
 - Instalar rubocop https://github.com/bbatsov/rubocop/blob/master/manual/installation.md
  - Como hacer un commit https://chris.beams.io/posts/git-commit/

### Instalar ruby en linux
https://stackoverflow.com/questions/37720892/you-dont-have-write-permissions-for-the-var-lib-gems-2-3-0-directory
```bash
cd $HOME
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.4.1
rbenv global 2.4.1
ruby -v
```

### Instalar en windows usando un modulo de ubuntu (recomendado para los que van a usar windows)
- No es necesario montar rails
https://gorails.com/setup/windows/10
