# programacion-paralela-17b
## Prácticas

* 1.- [Fecha de entrega 2017-09-16](/practica_1/indicaciones.md)
* 2.- [Fecha de entrega 2017-09-23](/practica_2/indicaciones.md)
* 3.- [Fecha de entrega 2017-10-07](/practica_3/indicaciones.md)
* 4.- [Fecha de entrega 2017-10-21](/practica_4/indicaciones.md)
* 5.- [Fecha de entrega 2017-10-28](/practica_5/indicaciones.md)
* 6.- [Fecha de entrega 2017-11-05](/practica_6/indicaciones.md)

## Temas vistos

### Semana 1 (2017-09-02)
 - Introducción
 - Repaso de algoritmia
 - Repaso de estructuras de datos
 - Objetivos del curso
 - Evaluación
 - Repaso muy general de ruby
 - Uso de Git
 - Uso de linters
 - RubyGems
 - Asignación de la práctica 1

### Semana 2 (2017-09-09)
 - Sistemas de un procesador
 - Sistemas monoliticos
 - Sistemas multiprocesos
 - Sistemas multihilos
 - Diferencias entre hilo y proceso
 - Problemas en un sistema distribuido
   - Transparencia
	  - De replica
	  - De localización
	  - De migración
	  - De concurrencia
	  - De paralelismo
   - Paso de mensajes
      - Modelo cliente-servidor
      - Modelo RPC
      - Blockchain
      - Serializacion
         - bites crudos
         - xml
         - json
   - Sincronización
      - Relojes Naturales
        - Servidor NTP
        - Demonio de actualización
        - Latencia de mensajes  
      - Relojes lógicos
        - Desfase al reloj natural
        - Actualización del reloj ante una llegada de un mensaje del futuro.
   - Confiabilidad
      - Disponibilidad
      - Tolerancia a fallas
      - Degradación
   - Desempeño
      - Aplicaciones sin estado
      - Velocidad de ejecución
      - Utilización de recursos
      - Balanceador de carga
- Asignación de la práctica 2

## Semana 3 (2017-09-23)
- Administración de recursos
  - Administración de repositorios
  - Orquestación
  - Administración de configuraciones
  - Desplegar aplicaciones
  - Service Discovery
  - CI/CD
- Explicación del Proyecto 1

## Semana 4 (2017-09-30)
- Arquitecturas de sistemas basados en microservicios
  - Modelo Cliente-Servidor
    - Servidor
      - Aplicaciones inter servidores
      - Responsabilidades
        - Proveer recursos
        - Almacenar las operaciones
        - Validar las entradas
    - Cliente
      - Aplicación con GUI
      - Responsabilidades
        - Organizar datos
        - Interfaz Hombre-Máquina
        - Puede ser otra aplicación de tipo Servidor que requiere datos de otros servidores
  - Llamada a Procedimientos Remotos (RPC)
    - Invocación a otros servicios
    - Transparencia al invocar funciones
    - Formas de implemetación
      - RPC usando servicios REST
        + JSON
        + XML
      - RPC empaquetando los bytes crudos de los parámetros
        + Diferencias por hardware
        + Forma canónica
        + Diccionario de arquitecturas
        + Uso de middleware
  - Modelo Editor/Suscriptor
    + Modelo centralizado
    + Bajo acoplamiento del editor con los suscriptores
    + Alto acoplamiento de los suscriptores al editor
    + Editor
      + Envía mensajes a una cola
      + Flujo de mensajes
    + Suscriptor
      + Procesa mensajes
      + Facil adición de suscriptores
  - Modelo de cadena de bloques
    + Modelo descentralizado
    + Nodos
    + Minería
    + Transacciones
    + Hechos
    + Bloques
    + Cadenas de bloques
    + El bloque génesis

## Semana 5 (2017-10-07)
- Sistemas distribuidos a bajo nivel
 - Sistema Operativo
 - Aplicación
 - Protocolos de red
   - UDP
   - TCP
   - FTP
   - SMTP
   - HTTP
   - SSL/TLS
     - FTPS
     - HTTPS
  - Llamadas asincronas
  - Llamadas sincronas
- Tipos de paralelismo
  - Servidor/Trabajador
  - Modelo de Equipo
  - Modelo de Entubamiento (pipeline)
- Problemas del paralelismo
  - Condiciones de carrera
  - Mutex
- Seguridad
  - VPN
  - NAT
  - VPC
  Algoritmos de cifrado
  - PKI
  - RSA
  - Diffie-Hellman
  - AES
  Algoritmos de hashing
  - SHA1
  - MD5
  OpenSSL
  - Certificado (llave pública)
  - Llave Privada
  - Certificado de cliente
  - Firma digital
  - Autoridad de cetificación

# Evaluación
- Tareas 10
  - Modelo de trenes
  - Principios de programación
- Examen 40 (2 parciales)
- Prácticas 30 (6 prácticas, 5 puntos cada una)
- Proyecto 30 (Chat, requiere prácticas terminadas)
- Participación 10.
