# Preguntas

## Abstracción de los tests 01 y 02

En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo nuevo. Eso es algo que estaba en la realidad y no estaba representado en nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de la realidad que crearon?

Para resolver este problema utilizamos un método `should: aClosure notTakeMoreThan: aLimit` ya implementado en Smalltalk para `TestCase`. Con este traemos a nuestra representación un **cronómetro** como ente de la realidad que nos permite medir el tiempo, en este caso en milisegundos, para luego compararlo con lo esperado.

## Cómo representar en Smalltalk

¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés? Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?

La principal forma de representar un ente de la realidad en Smalltalk es a través de objetos. Los objetos, o instancias puntuales de las clases, simbolizan entes concretos, mientras que las clases se refieren a la idea platónica de un "tipo" de objeto que describe las propiedades que lo caracterizan. A su vez, estos tienen mensajes y colaboradores internos o variables que también pueden representar entes de la realidad. Por ejemplo, una instancia de la clase `CustomerBook` tiene dos variables `active` y `suspended` que representan las dos listas de clientes activos y suspendidos, respectivamente. Estas dos listas son a la vez dos entes encapsulados dentro del libro. Además, una interacción como `ACutomerBook numberOfActiveCustomers` me devuelve el número de clientes activos en la instancia `ACutomerBook` de clase `CutomerBook`. Este es una característica de mi libro de clientes.

## Teoría de Naur

¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?

La teoría del modelo/sistema que plantea Peter Naur en su paper describe la programación como un proceso de construcción de una teoría del dominio del problema. En este, el programador modela los entes del sistema, con su comportamiento y sus posibles interacciones. De esta manera, cada ente tiene la capacidad de realizar las tareas de las que es "responsable". 
La abstracción como forma de sacar código repetido involucra la generalización de un problema y su solución. Cuando modelamos en un ente un conjunto de capacidades, podemos reutilizar estas en la elaboración de otras. Volviendo al ejemplo planteado anteriormente, `ACustomerBook` sabe responder a `ACustomerBook numberOfActiveCustomers` y a `ACustomerBook numberOfSuspendedCustomers`, por lo que implementar `ACustomerBook numberOfCustomers` resulta de sumar el resultado de las dos interacciones anteriores, así reutilizando el código.
También se puede dar el caso de que exista métodos repetidos entre dos clases distintas. Esto podría ser indicativo de que estas dos clases son, en realidad, subclases de otra más que no habíamos modelado. Esta nueva superclase respondería a este conjunto de mensajes repetidos de la misma forma.