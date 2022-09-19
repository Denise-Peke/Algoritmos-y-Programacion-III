# Ataques fantásticos:
**Grupo: 11**
- Dall'Acqua, Denise - Legajo: 108645
- Tourne Passarino, Patricio - Legajo: 108725

## Preguntas

1. ¿Qué crítica le harías al protocolo de `#estaHerido` y `#noEstaHerido`? (en vez de tener solo el mensaje `#estaHerido` y hacer “`#estaHerido not`” para saber la negación)
   
   Creemos que va contra la minimalidad de mensajes. Es redundante tener dos mensajes para preguntar por el opuesto del otro y, además, si la implementación de cada uno chequeara la vida del combatiente, y luego quisiéramos hacer un cambio, tendríamos que modificar las dos implementaciones. Por esto, nosotros implementamos a `estaHerido` como
   
   ```smalltalk
   estaHerido
	^self noEstaHerido not.
   ```
   
2. ¿Qué opinan de que para algunas funcionalidades tenemos 3 tests para el mismo comportamiento pero aplicando a cada uno de los combatientes (Arthas, Mankrik y Olgra)
   
   Para nuestra implementación, en la que utilizamos el paradigma de prototipado, resulta redundante probar todas las funcionalidades en cada combatiente. Sin embargo, como no podrían asegurarse de que todos los grupos lo hicieran así, no creemos inapropiado que se asegure que todos los combatientes se comporten de igual manera.
   
3. ¿Cómo modelaron el resultado de haber desarrollado un combate? ¿qué opciones consideraron y por qué se quedaron con la que entregaron y por qué descartaron a las otras?
   
   Para modelar el resultado utilizamos el objeto `UltimoResultadoOrquestador` que tiene dos colaboradores internos: `numeroDeRondasSimuladas` y `ganador`. El primero es el número entero de rondas que se simularon y el segundo guarda `1` si ganó el `bando1`, `2` si ganó el `bando2` o `0` si quedó indeterminado. Este objeto tiene también dos métodos para modificar los colaboradores internos y dos para solicitarlos. Esto nos permite cargar y solicitar los datos de forma descriptiva:
   
   ```Smalltalk
   resultado := UltimoResultadoOrquestador.
   resultado ganadorEs: 1.
   ganador := resultado bandoGanador.
   resultado numeroDeRondasSimuladasEs: 50.
   numeroDeRondasSimuladas := resultado numeroDeRondas.
   ```
   
   La otra opción que evaluamos fue guardar los dos datos en una lista en un orden acordado y devolver esa lista.  El problema que vimos con esta implementación fue que la forma de acceder a los valores es poco descriptiva (`resultado at: 1` y `resultado at: 2`). Esta no aprovecha las facilidades que nos presta la Programación Orientada a Objetos.