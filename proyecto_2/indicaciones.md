# Proyecto Integrador 2
#### There's a block, there's a chain and there's a coin.


## Objetivos
- Entender el modelo blockchain y sus aplicaciones.
- Adquirir conocimientos básicos sobre criptografia de llave publica
- Entender como funcionan las criptomonedas.


## Problemática

### DinuzCoin
El DinuzCoin es una criptomoneda que permite hacer transferencias seguras
por internet de forma anónima y en un sistema seguro donde nadie confia en nadie y no existe un lider.
Todas las transacciones son seguras ya que nadie tiene la autoridad suficiente para controlar la red.

#### Usuarios
Los usuarios son aquellos que realizan transferencias. Un usuario puede enviar una transferencia a otro usuario de forma anonima. Cada usuario
tiene un monedero donde se guarda el dinero que contiene.
#### Monederos
Los monederos son identificados por una llave pública. Solo el dueño de la llave privada puede hacer transferencias, pues para eso se requiere una firma digital. Los montos se obtienen a partir de recorrer
todas las transferencias y sumar/restar los montos.
#### Transferencias
Una transferencia esta compuesta por un receptor, un emisor, la cantidad de la transferencia, la fecha y una firma digital con la llave privada del emisor.
#### Hechos
Las transferencias crean un hecho. Cada que hay una transferencia se almacena como un hecho. Todos los hechos son un conjunto de transferencias. Los hechos no son definitivos y pueden cambiar.
#### Bloques
Los bloques se crean cuando algún minero encuentra una moneda, en este caso todos los hechos que tiene se convierten en un bloque y recibe algunas monedas como pago por el esfuerzo de buscar.
Los bloques estan compuestos por una serie de transferencias y el bloque inicial, a excepcion del primer bloque que es conocido como el
bloque genesis. Este bloque es especial y no almacena ninguna transferencia.
#### Mineros
Los mineros son nodos en busca de monedas. Se encargan de procesar las transferencias. Una vez que encuentran una moneda reportan su hallazgo a toda la red para que agreguen el bloque creado con la moneda.
#### Monedas
Las monedas se crean al encontrar una cadena que crea un hash 'MD5' que contiene la palabra 'cafe' en cualquier posicion.
#### Ovejas blancas
Las ovejas blancas son mineros que una vez que reciben una solicitud la procesan de forma correcta.
#### Ovejas Negras
Las ovejas negras tambien son mineros, solo que algunas transferencias las ignorar y los bloques de otros mineros tambien. Pueden crear un bloque desde un bloque mas viejo. Tambien pueden aceptar bloques de longitud menor cuando les llegue.


## Indicaciones
- Implementar una clase para abstraer un monedero.
- Implementar una clase para abstraer una transferencia.
- Implementar una clase para abstraer a un cliente que desea realizar una transferencia. Este debe administrar la llave publica/privada.
- Implementar un servidor que se encargara de la mineria. Debera escuchar peticiones de los clientes y ademas correr en varios hilos la mineria de DinuzCoins. Una vez que encuentra una moneda debera notificar a los demas que encontro la moneda y proveer lo encontrado.
- Implementar una clase para administrar la cadena de bloques.
- Se recomienda almacenar en una base de datos la lista de bloques para facilitar la implementación.
- Implementar una clase para administrar la lista de nodos.
- Implementar las ovejas negras.

## Detalles de implementación
### Formatos de los mensajes del cliente
- Registrarse a la red
- Desregistrarse de la red
- Solicitar la cadena de bloques
- Notificar un hallazgo de una moneda
- Solicitar una transferencia.
### Formatos de los mensajes del servidor
- El lenguaje de programación es abierto, pero se debe respetar el estandar de comunicación.
- Se debera utilizar OpenSSL para firmar las transferencias. El algoritmo debe ser RSA con llaves de 512 bits.

### Integración
