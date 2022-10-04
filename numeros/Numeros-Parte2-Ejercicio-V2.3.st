!classDefinition: #FibonacciTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #FibonacciTest
	instanceVariableNames: 'zero one two three four five minusFive fibonacciZero fibonacciOne fibonacciTwo fibonacciThree fibonacciFour fibonacciFive fibonacciNumbersUpToFive'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!FibonacciTest methodsFor: 'setUp' stamp: 'PT 9/29/2022 18:32:16'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	minusFive := Entero with: -5.
	
	fibonacciZero := Entero with: 1.
	fibonacciOne := Entero with: 1.
	fibonacciTwo := Entero with: 2.
	fibonacciThree:= Entero with: 3.
	fibonacciFour := Entero with: 5.
	fibonacciFive := Entero with: 8.
	
	fibonacciNumbersUpToFive := { fibonacciZero. fibonacciOne . fibonacciTwo . fibonacciThree . fibonacciFour . fibonacciFive }.! !


!FibonacciTest methodsFor: 'tests' stamp: 'PT 9/29/2022 17:51:37'!
test01ZerothFibonacciIsOne

	self assert: zero fibonacci equals: fibonacciZero.! !

!FibonacciTest methodsFor: 'tests' stamp: 'PT 9/29/2022 17:53:11'!
test02OnethFibonacciIsOne

	self assert: one fibonacci equals: fibonacciZero.! !

!FibonacciTest methodsFor: 'tests' stamp: 'PT 9/29/2022 18:31:51'!
test03ZerothToFifthFibonacciAreCorrect
	
	0 to: 5 do: [ :index | self assert: ( (fibonacciNumbersUpToFive at: index + 1) = (Entero with: index) fibonacci) ].! !

!FibonacciTest methodsFor: 'tests' stamp: 'PT 9/29/2022 18:41:23'!
test04NegativeShouldRaiseError
	
	self 
		should: [ minusFive fibonacci ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]
	! !


!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:39:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:58'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5) equals: one + oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:42:29'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:40'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:24'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'PT 10/2/2022 20:36:09'!
test43isNegativeOneReturnsTrueWhenAskToNegative

	self assert: negativeOne isNegative ! !

!NumeroTest methodsFor: 'tests' stamp: 'PT 10/2/2022 20:36:44'!
test44isOneReturnsFalseWhenAskToNegative

	self deny: one isNegative ! !

!NumeroTest methodsFor: 'tests' stamp: 'PT 10/2/2022 20:38:05'!
test45isTwoReturnsTrueWhenAskToGreaterThanOne

	self assert: two isGreaterThanOne ! !

!NumeroTest methodsFor: 'tests' stamp: 'PT 10/2/2022 20:38:27'!
test46isOneReturnsFalseWhenAskToGreaterThanOne

	self deny: one isGreaterThanOne ! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 16:58:56'!
* aMultiplier 
	^aMultiplier multiplicarPorElEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 16:46:33'!
+ anAdder 
	^anAdder sumaConElEntero: self.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 17:23:41'!
- aSubtrahend 
		
	^ aSubtrahend restadoDelEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 17:07:43'!
/ aDivisor 
	
	^aDivisor divisionDelEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 17:16:11'!
divisionDeLaFraccion: aFraction
	| newNumerator newDenominator |
	
	newNumerator := aFraction numerator.
	newDenominator := aFraction denominator * self.
	
	^ newNumerator / newDenominator.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 17:08:19'!
divisionDelEntero: anInteger
	
	^Fraccion with: anInteger over: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 18:32:47'!
fibonacci

	self subclassResponsibility.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'PT 10/2/2022 19:05:55'!
multiplicarPorElEntero: anInteger

	^Entero with: value * anInteger integerValue.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 17:02:38'!
multiplicarPorLaFraccion: aFraction

	^(self * aFraction numerator) / (aFraction denominator).! !

!Entero methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 17:29:42'!
restadoDeLaFraccion: aFraction
	| newNumerator newDenominator |
	
	newNumerator := aFraction numerator - (self * aFraction denominator).
	newDenominator := aFraction denominator.
	
	^newNumerator / newDenominator ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'PT 10/2/2022 19:06:27'!
restadoDelEntero: anInteger

	^Entero with: anInteger integerValue - value.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'PT 10/2/2022 19:06:17'!
sumaConElEntero: anInteger
	
	^Entero with: value + anInteger integerValue.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 16:58:00'!
sumaConLaFraccion: aFraction
	| newNumerator |
	
	newNumerator := self * aFraction denominator + aFraction numerator.
	
	^newNumerator / aFraction denominator. ! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'JS 5/5/2022 03:55:37'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'PT 10/2/2022 20:33:38'!
isGreaterThanOne
	
	self subclassResponsibility.! !

!Entero methodsFor: 'testing' stamp: 'PT 10/2/2022 20:29:30'!
isNegative
	
	self subclassResponsibility.! !

!Entero methodsFor: 'testing' stamp: 'PT 10/2/2022 20:30:39'!
isOne
	
	self subclassResponsibility.! !

!Entero methodsFor: 'testing' stamp: 'PT 10/2/2022 20:32:47'!
isZero
	
	self subclassResponsibility.! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'PT 10/2/2022 19:05:09'!
// aDivisor 
	
	^Entero with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'PT 10/2/2022 19:07:40'!
greatestCommonDivisorWith: anEntero 
	
	^Entero with: (value gcd: anEntero integerValue)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'PT 10/2/2022 18:32:52'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^(self subclasses detect: [:aSubclass | aSubclass aceptaEsteValor: aValue]) with: aValue
	"
	(aValue = 0) ifTrue: [ ^Cero new ].
	(aValue < 0) ifTrue: [ ^Negativo new initializeWith: aValue ] ifFalse: [ ^Positivo new initializeWith: aValue ].
	"! !


!Entero class methodsFor: 'private' stamp: 'PT 10/2/2022 18:41:33'!
aceptaEsteValor: aValue
	
	self subclassResponsibility.! !


!classDefinition: #Cero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Cero methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 18:50:00'!
fibonacci
	
	^Uno new.! !


!Cero methodsFor: 'initialization' stamp: 'PT 10/2/2022 20:21:20'!
initializeWith: aValue

	value := aValue.! !


!Cero methodsFor: 'DP - fraction operations' stamp: 'PT 10/2/2022 19:26:26'!
fraccionandoA: aDividend
	
	^self error: self class canNotDivideByZeroErrorDescription.! !

!Cero methodsFor: 'DP - fraction operations' stamp: 'PT 10/2/2022 19:47:01'!
sobre: aDivisor
	
	^self.! !


!Cero methodsFor: 'testing' stamp: 'PT 10/2/2022 20:33:51'!
isGreaterThanOne
	
	^false.! !

!Cero methodsFor: 'testing' stamp: 'PT 10/2/2022 20:29:52'!
isNegative
	
	^false.
	! !

!Cero methodsFor: 'testing' stamp: 'PT 10/2/2022 20:30:48'!
isOne
	
	^false.
	! !

!Cero methodsFor: 'testing' stamp: 'PT 10/2/2022 20:32:57'!
isZero
	
	^value = 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: 'Numeros-Parte2-Ejercicio'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'instance creation' stamp: 'PT 10/2/2022 18:50:38'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	aValue = 0 ifFalse: [ self error: 'aValue debe ser 0' ].
	
	^self new initializeWith: aValue.! !


!Cero class methodsFor: 'private' stamp: 'PT 10/2/2022 20:24:31'!
aceptaEsteValor: aValue

	^aValue = 0 and: [ aValue isInteger ].! !


!classDefinition: #Negativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Negativo methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 18:42:38'!
fibonacci

	self error: Entero negativeFibonacciErrorDescription.! !


!Negativo methodsFor: 'initialization' stamp: 'PT 10/2/2022 19:12:04'!
initializeWith: aValue
	value := aValue.! !


!Negativo methodsFor: 'DP - fraction operations' stamp: 'PT 10/2/2022 19:27:30'!
fraccionandoA: aDividend
	
	^aDividend negated / self negated.! !

!Negativo methodsFor: 'DP - fraction operations' stamp: 'PT 10/2/2022 20:23:00'!
sobre: aDivisor
	| greatestCommonDivisor numerator denominator |
	
	greatestCommonDivisor := self greatestCommonDivisorWith: aDivisor. 
	numerator := self // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	 ^denominator debajoDe: numerator.! !


!Negativo methodsFor: 'testing' stamp: 'PT 10/2/2022 20:33:56'!
isGreaterThanOne
	
	^false.! !

!Negativo methodsFor: 'testing' stamp: 'PT 10/2/2022 20:30:25'!
isNegative
	
	^value < 0.! !

!Negativo methodsFor: 'testing' stamp: 'PT 10/2/2022 20:30:56'!
isOne
	
	^false.! !

!Negativo methodsFor: 'testing' stamp: 'PT 10/2/2022 20:33:05'!
isZero
	
	^false.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Negativo class' category: 'Numeros-Parte2-Ejercicio'!
Negativo class
	instanceVariableNames: ''!

!Negativo class methodsFor: 'instance creation' stamp: 'PT 10/2/2022 18:50:31'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	aValue < 0 ifFalse: [ self error: 'aValue debe ser negativo' ].
	
	^self new initializeWith: aValue.! !


!Negativo class methodsFor: 'private' stamp: 'PT 10/2/2022 20:24:20'!
aceptaEsteValor: aValue

	^aValue < 0 and: [ aValue isInteger ].! !


!classDefinition: #Positivo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Positivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Positivo methodsFor: 'arithmetic operations' stamp: 'PT 10/2/2022 18:41:09'!
fibonacci

	self subclassResponsibility.! !


!Positivo methodsFor: 'initialization' stamp: 'PT 10/2/2022 20:23:27'!
initializeWith: aValue 

	self subclassResponsibility.! !


!Positivo methodsFor: 'DP - fraction operations' stamp: 'PT 10/2/2022 20:13:58'!
debajoDe: aNumerator

	self subclassResponsibility.! !

!Positivo methodsFor: 'DP - fraction operations' stamp: 'PT 10/2/2022 20:13:32'!
fraccionandoA: aDividend
	
	self subclassResponsibility.! !

!Positivo methodsFor: 'DP - fraction operations' stamp: 'PT 10/2/2022 20:14:30'!
sobre: aDivisor
	| greatestCommonDivisor numerator denominator |
	
	greatestCommonDivisor := self greatestCommonDivisorWith: aDivisor. 
	numerator := self // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	^denominator debajoDe: numerator.! !


!Positivo methodsFor: 'testing' stamp: 'PT 10/2/2022 20:34:05'!
isGreaterThanOne
	
	self subclassResponsibility.! !

!Positivo methodsFor: 'testing' stamp: 'PT 10/2/2022 20:30:17'!
isNegative
	
	^false.! !

!Positivo methodsFor: 'testing' stamp: 'PT 10/2/2022 20:31:09'!
isOne
	
	self subclassResponsibility.! !

!Positivo methodsFor: 'testing' stamp: 'PT 10/2/2022 20:33:15'!
isZero
	
	^value = 0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Positivo class' category: 'Numeros-Parte2-Ejercicio'!
Positivo class
	instanceVariableNames: ''!

!Positivo class methodsFor: 'instance creation' stamp: 'PT 10/2/2022 18:39:19'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	aValue > 0 ifFalse: [  self error: 'aValue debe ser positivo' ].
	
	^(self subclasses detect: [:aSubclass | aSubclass aceptaEsteValor: aValue]) with: aValue	! !


!Positivo class methodsFor: 'private' stamp: 'PT 10/2/2022 20:15:56'!
aceptaEsteValor: aValue

	^aValue > 0 and: [ aValue isInteger ].! !


!classDefinition: #MayoresAUno category: 'Numeros-Parte2-Ejercicio'!
Positivo subclass: #MayoresAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!MayoresAUno methodsFor: 'arithmetic operations' stamp: 'PT 10/2/2022 20:15:10'!
fibonacci
	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^(self - one) fibonacci + (self - two) fibonacci.! !


!MayoresAUno methodsFor: 'initialization' stamp: 'PT 10/2/2022 20:15:18'!
initialize

	self initializeWith: 1.! !

!MayoresAUno methodsFor: 'initialization' stamp: 'PT 10/2/2022 20:15:23'!
initializeWith: aValue

	value := aValue.! !


!MayoresAUno methodsFor: 'DP - fraction operations' stamp: 'PT 10/2/2022 20:14:48'!
debajoDe: aNumerator

	^Fraccion new initializeWith: aNumerator over: self! !

!MayoresAUno methodsFor: 'DP - fraction operations' stamp: 'PT 10/2/2022 20:13:10'!
fraccionandoA: aDividend
	
	^aDividend sobre: self.! !


!MayoresAUno methodsFor: 'testing' stamp: 'PT 10/2/2022 20:34:25'!
isGreaterThanOne
	
	^value > 1.! !

!MayoresAUno methodsFor: 'testing' stamp: 'PT 10/2/2022 20:31:18'!
isOne
	
	^false.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MayoresAUno class' category: 'Numeros-Parte2-Ejercicio'!
MayoresAUno class
	instanceVariableNames: ''!

!MayoresAUno class methodsFor: 'instance creation' stamp: 'PT 10/2/2022 18:52:09'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	aValue > 1 ifFalse: [ self error: 'aValue debe ser mayor a 1' ].
	
	^self new initializeWith: aValue.! !


!MayoresAUno class methodsFor: 'private' stamp: 'PT 10/2/2022 20:15:31'!
aceptaEsteValor: aValue

	^aValue > 1 and: [ aValue isInteger ].! !


!classDefinition: #Uno category: 'Numeros-Parte2-Ejercicio'!
Positivo subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Uno methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 18:48:56'!
fibonacci
	
	^self.! !


!Uno methodsFor: 'initialization' stamp: 'PT 10/2/2022 18:29:40'!
initialize
	self initializeWith: 1.! !

!Uno methodsFor: 'initialization' stamp: 'PT 10/2/2022 18:29:17'!
initializeWith: aValue
	value := aValue.! !


!Uno methodsFor: 'DP - fraction operations' stamp: 'PT 10/2/2022 20:06:40'!
debajoDe: aNumerator

	^aNumerator.! !

!Uno methodsFor: 'DP - fraction operations' stamp: 'PT 10/2/2022 19:29:23'!
fraccionandoA: aDividend

	^ aDividend.! !


!Uno methodsFor: 'testing' stamp: 'PT 10/2/2022 20:34:30'!
isGreaterThanOne
	
	^false.! !

!Uno methodsFor: 'testing' stamp: 'PT 10/2/2022 20:31:26'!
isOne
	
	^value = 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: 'Numeros-Parte2-Ejercicio'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'instance creation' stamp: 'PT 10/2/2022 18:50:54'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	aValue = 1 ifFalse: [ self error: 'aValue debe ser 1' ].
	
	^self new initializeWith: aValue.! !


!Uno class methodsFor: 'private' stamp: 'PT 10/2/2022 20:16:00'!
aceptaEsteValor: aValue

	^aValue = 1 and: [ aValue isInteger ].! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 17:01:30'!
* aMultiplier 
	
	^aMultiplier multiplicarPorLaFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PT 10/2/2022 19:13:24'!
+ anAdder 

	^anAdder sumaConLaFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 17:27:06'!
- aSubtrahend 
	
	^ aSubtrahend restadoDeLaFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 17:13:48'!
/ aDivisor 
	
	^aDivisor divisionDeLaFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 17:14:07'!
divisionDeLaFraccion: aFraction

	^(denominator * aFraction numerator) / (numerator * aFraction denominator).! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 17:11:36'!
divisionDelEntero: anInteger
	| newNumerator newDenominator |
	newNumerator := anInteger * denominator.
	newDenominator := numerator.
	^Fraccion with: newNumerator over: newDenominator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 17:00:58'!
multiplicarPorElEntero: anInteger
	| newNumerator |
	newNumerator := anInteger * numerator.
	^  newNumerator / denominator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 17:02:04'!
multiplicarPorLaFraccion: aFraction

	^(numerator * aFraction numerator) / (denominator * aFraction denominator).! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 17:29:07'!
restadoDeLaFraccion: aFraction
	| newNumerator newDenominator |
	
	newNumerator := (denominator * aFraction numerator) - (numerator * aFraction denominator).
	newDenominator := denominator * aFraction denominator.
	
	^newNumerator / newDenominator.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 17:26:08'!
restadoDelEntero: anInteger
	| newNumerator |
	newNumerator := (anInteger * denominator) - numerator.
	^ newNumerator / denominator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 16:53:54'!
sumaConElEntero: anInteger
	| newNumerator |
	newNumerator := (anInteger * denominator) + numerator.
	^ newNumerator / denominator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PT 9/29/2022 16:55:49'!
sumaConLaFraccion: aFraction
	| newNumerator newDenominator |
	
	newNumerator := (numerator * aFraction denominator) + (denominator * aFraction numerator).
	newDenominator := denominator * aFraction denominator.
	
	^newNumerator / newDenominator ! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'PT 10/2/2022 19:32:37'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator.! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'PT 10/2/2022 20:16:21'!
with: aDividend over: aDivisor

	^aDivisor fraccionandoA: aDividend.! !
