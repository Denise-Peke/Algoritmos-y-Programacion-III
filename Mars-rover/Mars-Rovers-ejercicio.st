!classDefinition: #Test category: 'Mars-Rovers'!
TestCase subclass: #Test
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rovers'!

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:54:49'!
test01RecibeComandoVacioYNoSeMueve

	self serciorarUnMarsRoverInicializadoEn: 0@0 direccionadoHacia: 'N' terminaEn: 0@0 despuesDeRecibir: ''
	! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:55:43'!
test02RecibeComandoVacioYNoGira
	
	self serciorarUnMarsRoverInicializadoEn: 0@0 direccionadoHacia: 'N' terminaDireccionadoHacia: 'N' despuesDeRecibir: ''
	! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:26:14'!
test03inicializadoHaciaElNorteEnX0Y0AvanzaAX0Y1

	self serciorarUnMarsRoverInicializadoEn: 0@0 direccionadoHacia: 'N' terminaEn: 0@1 despuesDeRecibir: 'f'	! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:26:36'!
test04inicializadoHaciaElNorteEnX0Y0RetrocedeAX0Y_1
	
	self serciorarUnMarsRoverInicializadoEn: 0@0 direccionadoHacia: 'N' terminaEn: 0@-1 despuesDeRecibir: 'b'	
	! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:27:51'!
test05inicializadoHaciaElNorteEnX0Y0GiraALaDerechaHaciaElEste

	self serciorarUnMarsRoverInicializadoEn: 0@0 direccionadoHacia: 'N' terminaDireccionadoHacia: 'E' despuesDeRecibir: 'r' 
	! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:28:26'!
test06inicializadoHaciaElNorteEnX0Y0GiraALaIzquierdaHaciaElOeste

	self serciorarUnMarsRoverInicializadoEn: 0@0 direccionadoHacia: 'N' terminaDireccionadoHacia: 'O' despuesDeRecibir: 'l' 
! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:29:19'!
test07inicializadoHaciaElSurEnX0Y0AvanzaAX0Y_1

	self serciorarUnMarsRoverInicializadoEn: 0@0 direccionadoHacia: 'S' terminaEn: 0@-1 despuesDeRecibir: 'f'	! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:29:56'!
test08inicializadoHaciaElSurEnX0Y0RetrocedeAX0Y1
	
	self serciorarUnMarsRoverInicializadoEn: 0@0 direccionadoHacia: 'S' terminaEn: 0@1 despuesDeRecibir: 'b'	
	! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:30:26'!
test09inicializadoHaciaElSurEnX0Y0GiraALaDerechaHaciaElOeste

	self serciorarUnMarsRoverInicializadoEn: 0@0 direccionadoHacia: 'S' terminaDireccionadoHacia: 'O' despuesDeRecibir: 'r' 
	! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:31:16'!
test10inicializadoHaciaElSurEnX0Y0GiraALaIzquierdaHaciaElEste

	self serciorarUnMarsRoverInicializadoEn: 0@0 direccionadoHacia: 'S' terminaDireccionadoHacia: 'E' despuesDeRecibir: 'l' 
! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:32:24'!
test11inicializadoHaciaElEsteEnX0Y0AvanzaAX1Y0

	self serciorarUnMarsRoverInicializadoEn: 0@0 direccionadoHacia: 'E' terminaEn: 1@0 despuesDeRecibir: 'f'	! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:33:06'!
test12inicializadoHaciaElEsteEnX0Y0RetrocedeAX_1Y0
	
	self serciorarUnMarsRoverInicializadoEn: 0@0 direccionadoHacia: 'E' terminaEn: -1@0 despuesDeRecibir: 'b'	
	! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:33:37'!
test13inicializadoHaciaElEsteEnX0Y0GiraALaDerechaHaciaElSur

	self serciorarUnMarsRoverInicializadoEn: 0@0 direccionadoHacia: 'E' terminaDireccionadoHacia: 'S' despuesDeRecibir: 'r' 
	! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:34:08'!
test14inicializadoHaciaElEsteEnX0Y0GiraALaIzquierdaHaciaElNorte

	self serciorarUnMarsRoverInicializadoEn: 0@0 direccionadoHacia: 'E' terminaDireccionadoHacia: 'N' despuesDeRecibir: 'l' 
! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:34:49'!
test15inicializadoHaciaElOesteEnX0Y0AvanzaAX_1Y0

	self serciorarUnMarsRoverInicializadoEn: 0@0 direccionadoHacia: 'O' terminaEn: -1@0 despuesDeRecibir: 'f'	! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:35:28'!
test16inicializadoHaciaElOesteEnX0Y0RetrocedeAX1Y0
	
	self serciorarUnMarsRoverInicializadoEn: 0@0 direccionadoHacia: 'O' terminaEn: 1@0 despuesDeRecibir: 'b'	
	! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:35:56'!
test17inicializadoHaciaElOesteEnX0Y0GiraALaDerechaHaciaElNorte

	self serciorarUnMarsRoverInicializadoEn: 0@0 direccionadoHacia: 'O' terminaDireccionadoHacia: 'N' despuesDeRecibir: 'r' 
	! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:36:19'!
test18inicializadoHaciaElOesteEnX0Y0GiraALaIzquierdaHaciaElSur

	self serciorarUnMarsRoverInicializadoEn: 0@0 direccionadoHacia: 'O' terminaDireccionadoHacia: 'S' despuesDeRecibir: 'l' 
! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:41:31'!
test19inicializadoHaciaElNorteEnX0Y0AvanzaDosVecesHastaX0Y2

	self serciorarUnMarsRoverInicializadoEn: 0@0 direccionadoHacia: 'N' terminaEn: 0@2 despuesDeRecibir: 'ff'
! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:41:03'!
test20inicializadoHaciaElNorteEnX0Y0AvanzaYRetrocedeAX0Y0
	
	self serciorarUnMarsRoverInicializadoEn: 0@0 direccionadoHacia: 'N' terminaEn: 0@0 despuesDeRecibir: 'fb'
	! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:43:03'!
test21EmiteErrorAlRecibirUnComandoInvalido
	
	|unMarsRover|
	
	unMarsRover := self marsRoverInicializadoEn: 0@0 conDireccion: 'N'.
	
	self 
		should: [ unMarsRover comando: 'p' ]
		raise: Error
		withExceptionDo: [ :anError | self assert: ( MarsRover comandoInvalido: 'p' ) equals: anError messageText ]
! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:46:32'!
test22noSeMueveAlRecibirUnComandoInvalido
	
	|unMarsRover|
	
	unMarsRover := self marsRoverInicializadoEn: 0@0 conDireccion: 'N'.
	
	self 
		should: [ unMarsRover comando: 'p' ]
		raise: Error
		withExceptionDo: [ :anError | 
			self assert: 0@0 equals: unMarsRover posicion.
			self assert: 'N' equals: unMarsRover direccion
			]
! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:48:10'!
test23noEjecutaNadaDespuesDeUnComandoInvalido
	
	|unMarsRover|
	
	unMarsRover := self marsRoverInicializadoEn: 0@0 conDireccion: 'N'.
	
	self 
		should: [ unMarsRover comando: 'pf' ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: ( MarsRover comandoInvalido: 'p' ) equals: anError messageText.
			self assert: 0@0 equals: unMarsRover posicion ]
! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:49:13'!
test24ejecutaTodoAntesDeUnComandoInvalido
	
	|unMarsRover|
	
	unMarsRover := self marsRoverInicializadoEn: 0@0 conDireccion: 'N'.
	
	self 
		should: [ unMarsRover comando: 'fp' ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: ( MarsRover comandoInvalido: 'p' ) equals: anError messageText.
			self assert: 0@1 equals: unMarsRover posicion ]
! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:53:06'!
test25incializadoHaciaElNorteEnX1Y1RecibeComandoVacioYNoSeMueve
	
	self serciorarUnMarsRoverInicializadoEn: 1@1 direccionadoHacia: 'N' terminaEn: 1@1 despuesDeRecibir: ''
	! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:50:43'!
test26inicializadoHaciaElNorteEnX1Y1AvanzaAX1Y2

	self serciorarUnMarsRoverInicializadoEn: 1@1 direccionadoHacia: 'N' terminaEn: 1@2 despuesDeRecibir: 'f'	! !

!Test methodsFor: 'tests' stamp: 'PT 11/4/2022 15:53:59'!
test27PuedeEjecutarUnaSerieDeComandosValidos
	
	|unMarsRover|
	
	unMarsRover := self marsRoverInicializadoEn: 0@0 conDireccion: 'N' despuesDeRecibir: 'fflfrrb'.
	
	self assert: -2@2 equals: unMarsRover posicion 
! !


!Test methodsFor: 'setup' stamp: 'PT 10/31/2022 16:56:24'!
marsRoverInicializadoEn: unaCoordenada conDireccion: unaClaseDireccion 
	|unMarsRover|
	
	 unMarsRover  := MarsRover en: unaCoordenada apuntandoA: unaClaseDireccion.
	^unMarsRover 
! !

!Test methodsFor: 'setup' stamp: 'PT 10/31/2022 16:01:11'!
marsRoverInicializadoEn: unaCoordenada conDireccion: unaDireccion despuesDeRecibir: unConjuntoDeComandos 
	|unMarsRover|
	
	 unMarsRover  := self marsRoverInicializadoEn: unaCoordenada  conDireccion: unaDireccion .
	unMarsRover comando: unConjuntoDeComandos.
	^unMarsRover 
! !

!Test methodsFor: 'setup' stamp: 'PT 11/4/2022 15:23:51'!
serciorarUnMarsRoverInicializadoEn: unaPosicionInicial direccionadoHacia: unaDireccionInicial terminaDireccionadoHacia: unaDireccionFinal despuesDeRecibir: unConjuntoDeComandos
	
	|unMarsRover|
	unMarsRover := self marsRoverInicializadoEn: unaPosicionInicial conDireccion: unaDireccionInicial despuesDeRecibir: unConjuntoDeComandos .
	self assert: unaDireccionFinal equals: unMarsRover direccion.
	! !

!Test methodsFor: 'setup' stamp: 'PT 11/4/2022 15:22:08'!
serciorarUnMarsRoverInicializadoEn: unaPosicionInicial direccionadoHacia: unaDireccionInicial terminaEn: unaPosicionFinal despuesDeRecibir: unConjuntoDeComandos
	
	|unMarsRover|
	unMarsRover := self marsRoverInicializadoEn: unaPosicionInicial conDireccion: unaDireccionInicial despuesDeRecibir: unConjuntoDeComandos .
	self assert: unaPosicionFinal equals: unMarsRover posicion.
	! !


!classDefinition: #Dirección category: 'Mars-Rovers'!
Object subclass: #Dirección
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rovers'!

!Dirección methodsFor: 'operaciones' stamp: 'PT 10/31/2022 16:41:34'!
avanzarDesde: posicionActual

	^posicionActual + self versorDireccion.! !

!Dirección methodsFor: 'operaciones' stamp: 'PT 10/31/2022 16:51:58'!
girarALaDerecha

	self subclassResponsibility.! !

!Dirección methodsFor: 'operaciones' stamp: 'PT 10/31/2022 16:51:50'!
girarALaIzquierda

	self subclassResponsibility.! !

!Dirección methodsFor: 'operaciones' stamp: 'PT 10/31/2022 16:43:41'!
retrocederDesde: posicionActual

	^posicionActual - self versorDireccion.! !


!Dirección methodsFor: 'simbolización' stamp: 'PT 11/4/2022 16:02:33'!
simbolo

	^self class simbolo.! !


!Dirección methodsFor: 'operaciones - privado' stamp: 'PT 10/31/2022 16:54:03'!
versorDireccion

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Dirección class' category: 'Mars-Rovers'!
Dirección class
	instanceVariableNames: ''!

!Dirección class methodsFor: 'instanciado' stamp: 'PT 11/4/2022 14:54:31'!
con: unStringDireccion

	self allSubclasses 
		detect:  [ :unaClaseDireccion | unaClaseDireccion seSimbolizaCon: unStringDireccion ] 
		ifFound: [ :claseDireccionSeleccionada | ^claseDireccionSeleccionada new] 
		ifNone:  [ MarsRover errorDireccionInvalida]
		
		
	
	
	! !

!Dirección class methodsFor: 'instanciado' stamp: 'PT 11/4/2022 15:59:52'!
seSimbolizaCon: unStringDireccion

	^self simbolo = unStringDireccion ! !


!Dirección class methodsFor: 'simbolización' stamp: 'PT 11/4/2022 15:58:35'!
simbolo

	self subclassResponsibility.! !


!classDefinition: #Este category: 'Mars-Rovers'!
Dirección subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rovers'!

!Este methodsFor: 'operaciones' stamp: 'PT 10/31/2022 15:30:57'!
girarALaDerecha
	^Sur new.! !

!Este methodsFor: 'operaciones' stamp: 'PT 10/31/2022 15:31:06'!
girarALaIzquierda
	^Norte new.! !


!Este methodsFor: 'operaciones - privado' stamp: 'PT 10/31/2022 16:41:34'!
versorDireccion
	^1@0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Este class' category: 'Mars-Rovers'!
Este class
	instanceVariableNames: ''!

!Este class methodsFor: 'simbolización' stamp: 'PT 11/4/2022 15:57:48'!
simbolo
	^'E'! !


!classDefinition: #Norte category: 'Mars-Rovers'!
Dirección subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rovers'!

!Norte methodsFor: 'operaciones' stamp: 'PT 10/31/2022 16:50:46'!
girarALaDerecha
	^Este new.! !

!Norte methodsFor: 'operaciones' stamp: 'PT 10/31/2022 15:32:03'!
girarALaIzquierda
	^Oeste new.! !


!Norte methodsFor: 'operaciones - privado' stamp: 'PT 10/31/2022 16:41:34'!
versorDireccion
	 ^(0@1)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Norte class' category: 'Mars-Rovers'!
Norte class
	instanceVariableNames: ''!

!Norte class methodsFor: 'simbolización' stamp: 'PT 11/4/2022 15:57:54'!
simbolo
	^'N'! !


!classDefinition: #Oeste category: 'Mars-Rovers'!
Dirección subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rovers'!

!Oeste methodsFor: 'operaciones' stamp: 'PT 10/31/2022 15:32:57'!
girarALaDerecha
	^Norte new.! !

!Oeste methodsFor: 'operaciones' stamp: 'PT 10/31/2022 15:33:07'!
girarALaIzquierda
	^Sur new.! !


!Oeste methodsFor: 'operaciones - privado' stamp: 'PT 10/31/2022 16:41:34'!
versorDireccion
	^(-1@0)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Oeste class' category: 'Mars-Rovers'!
Oeste class
	instanceVariableNames: ''!

!Oeste class methodsFor: 'simbolización' stamp: 'PT 11/4/2022 15:58:03'!
simbolo
	^'O'! !


!classDefinition: #Sur category: 'Mars-Rovers'!
Dirección subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rovers'!

!Sur methodsFor: 'operaciones' stamp: 'PT 10/31/2022 15:33:57'!
girarALaDerecha
	^Oeste new.! !

!Sur methodsFor: 'operaciones' stamp: 'PT 10/31/2022 16:50:46'!
girarALaIzquierda
	^Este new.! !


!Sur methodsFor: 'operaciones - privado' stamp: 'PT 10/31/2022 16:41:34'!
versorDireccion
	^(0@-1)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sur class' category: 'Mars-Rovers'!
Sur class
	instanceVariableNames: ''!

!Sur class methodsFor: 'simbolización' stamp: 'PT 11/4/2022 15:58:12'!
simbolo
	^'S'! !


!classDefinition: #MarsRover category: 'Mars-Rovers'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion direccion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rovers'!

!MarsRover methodsFor: 'inicializacion' stamp: 'PT 10/31/2022 16:57:45'!
initializeEn: coordenadaInicial apuntandoA: unaDirección 

	posicion := coordenadaInicial.
	direccion := unaDirección.! !


!MarsRover methodsFor: 'operacion' stamp: 'PT 10/31/2022 15:09:00'!
comando: unConjuntoDeComandos

	unConjuntoDeComandos do: [:unComando | self ejecutar: unComando]
	
	
	
	! !

!MarsRover methodsFor: 'operacion' stamp: 'PT 10/31/2022 15:39:38'!
direccion
	^direccion simbolo.! !

!MarsRover methodsFor: 'operacion' stamp: 'PT 11/4/2022 14:39:53'!
ejecutar: unComando
	
	Movimiento ejecutar: unComando en: self.! !

!MarsRover methodsFor: 'operacion' stamp: 'PT 10/31/2022 14:52:56'!
posicion
	^posicion! !


!MarsRover methodsFor: 'errores' stamp: 'PT 10/31/2022 16:11:19'!
elevarErrorComandoInvalido: unComando

	self error: ( self class comandoInvalido: unComando ).! !


!MarsRover methodsFor: 'movimientos' stamp: 'PT 10/31/2022 17:17:46'!
avanzar

	posicion := direccion avanzarDesde: posicion.! !

!MarsRover methodsFor: 'movimientos' stamp: 'PT 10/31/2022 17:27:38'!
girarALaDerecha

	direccion := direccion girarALaDerecha.! !

!MarsRover methodsFor: 'movimientos' stamp: 'PT 10/31/2022 17:27:46'!
girarALaIzquierda

	direccion := direccion girarALaIzquierda.! !

!MarsRover methodsFor: 'movimientos' stamp: 'PT 10/31/2022 17:27:12'!
retroceder

	posicion := direccion retrocederDesde: posicion.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Mars-Rovers'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instanciado' stamp: 'PT 11/4/2022 14:51:08'!
en: coordenadaInicial apuntandoA: unStringDirección 
	^self new initializeEn: coordenadaInicial apuntandoA: (Dirección con: unStringDirección  )! !


!MarsRover class methodsFor: 'error' stamp: 'PT 10/31/2022 17:51:01'!
comandoInvalido: unComando

	^( 'El comando ' , ( unComando asString ) , ' es invalido' ).! !

!MarsRover class methodsFor: 'error' stamp: 'PT 11/4/2022 14:56:49'!
errorDireccionInvalida 

	self error: 'Direccion invalida'! !


!classDefinition: #Movimiento category: 'Mars-Rovers'!
Object subclass: #Movimiento
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rovers'!

!Movimiento methodsFor: 'DD - operaciones' stamp: 'PT 11/4/2022 14:42:18'!
ejecutarEn: unMarsRover

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Movimiento class' category: 'Mars-Rovers'!
Movimiento class
	instanceVariableNames: ''!

!Movimiento class methodsFor: 'DD - operaciones' stamp: 'PT 11/4/2022 14:42:18'!
ejecutar: unComando en: unMarsRover

	self allSubclasses 
		detect:  [ :unMovimiento | unMovimiento seSimbolizaCon: unComando] 
		ifFound: [ :movimientoSeleccionado | movimientoSeleccionado new ejecutarEn: unMarsRover] 
		ifNone:  [ unMarsRover elevarErrorComandoInvalido: unComando]
		
		
	! !

!Movimiento class methodsFor: 'DD - operaciones' stamp: 'PT 10/31/2022 17:07:04'!
seSimbolizaCon: unComando
	
	self subclassResponsibility.! !


!classDefinition: #Avance category: 'Mars-Rovers'!
Movimiento subclass: #Avance
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rovers'!

!Avance methodsFor: 'DD - operaciones' stamp: 'PT 11/4/2022 14:42:18'!
ejecutarEn: unMarsRover

	unMarsRover avanzar.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Avance class' category: 'Mars-Rovers'!
Avance class
	instanceVariableNames: ''!

!Avance class methodsFor: 'DD - operaciones' stamp: 'PT 10/31/2022 17:07:26'!
seSimbolizaCon: unComando
	
	^unComando = $f.! !


!classDefinition: #GiroALaDerecha category: 'Mars-Rovers'!
Movimiento subclass: #GiroALaDerecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rovers'!

!GiroALaDerecha methodsFor: 'DD - operaciones' stamp: 'PT 11/4/2022 14:42:18'!
ejecutarEn: unMarsRover

	unMarsRover girarALaDerecha .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GiroALaDerecha class' category: 'Mars-Rovers'!
GiroALaDerecha class
	instanceVariableNames: ''!

!GiroALaDerecha class methodsFor: 'DD - operaciones' stamp: 'PT 10/31/2022 17:07:32'!
seSimbolizaCon: unComando
	
	^unComando = $r.! !


!classDefinition: #GiroALaIzquierda category: 'Mars-Rovers'!
Movimiento subclass: #GiroALaIzquierda
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rovers'!

!GiroALaIzquierda methodsFor: 'DD - operaciones' stamp: 'PT 11/4/2022 14:42:18'!
ejecutarEn: unMarsRover

	unMarsRover girarALaIzquierda .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GiroALaIzquierda class' category: 'Mars-Rovers'!
GiroALaIzquierda class
	instanceVariableNames: ''!

!GiroALaIzquierda class methodsFor: 'DD - operaciones' stamp: 'PT 10/31/2022 17:07:36'!
seSimbolizaCon: unComando
	
	^unComando = $l.! !


!classDefinition: #Retroceso category: 'Mars-Rovers'!
Movimiento subclass: #Retroceso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rovers'!

!Retroceso methodsFor: 'DD - operaciones' stamp: 'PT 11/4/2022 14:42:18'!
ejecutarEn: unMarsRover

	unMarsRover retroceder. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Retroceso class' category: 'Mars-Rovers'!
Retroceso class
	instanceVariableNames: ''!

!Retroceso class methodsFor: 'DD - operaciones' stamp: 'PT 10/31/2022 17:07:43'!
seSimbolizaCon: unComando
	
	^unComando = $b.! !
