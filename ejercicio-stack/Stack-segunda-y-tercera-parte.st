!classDefinition: #OOLimitedStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOLimitedStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOLimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 18:28:08'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOLimitedStack new with: 4.
	
	self assert: stack isEmpty! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 18:35:52'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOLimitedStack new with: 4.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 18:40:24'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOLimitedStack new with: 4.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 19:51:49'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOLimitedStack new with: 4.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 20:05:21'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOLimitedStack new with: 3.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 19:53:03'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOLimitedStack new with: 4.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 19:53:18'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOLimitedStack new with: 4.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 19:53:51'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOLimitedStack new with: 4.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 19:55:52'!
test09CanNotPopWhenStackSizeIsZero

	| stack  |
	
	stack := OOLimitedStack new with: 0.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 19:56:22'!
test10CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOLimitedStack new with: 4.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 19:56:37'!
test11CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOLimitedStack new with: 4.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 19:58:55'!
test12CanNotPushMoreElementsThanSize

	| stack  |
	
	stack := OOLimitedStack new with: 2.
	stack push: 'something'.
	stack push: 'anotherthing'.
	self
		should: [ stack push: 'extra thing' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOLimitedStack stackOverflow equals: anError messageText ]
		
! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 20:00:39'!
test13TopCanGetLastElementOnFullStack

	| stack  |
	
	stack := OOLimitedStack new with: 2.
	stack push: 'something'.
	stack push: 'anotherthing'.
	
	self assert: stack top equals: 'anotherthing'.
	
		
! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 20:01:37'!
test14PopReturnsLastElementOnFullStack

	| stack  |
	
	stack := OOLimitedStack new with: 2.
	stack push: 'something'.
	stack push: 'anotherthing'.
	
	self assert: stack pop equals: 'anotherthing'.
	
		
! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 20:23:48'!
test15PopCanRemoveLastElementOnFullStack

	| stack  |
	
	stack := OOLimitedStack new with: 2.
	stack push: 'something'.
	stack push: 'anotherthing'.
	stack pop.
	
	self assert: stack size equals: 1.
	
	self assert: stack pop equals: 'something'.
	
	
		
! !


!classDefinition: #OOUnlimitedStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOUnlimitedStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 17:35:54'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOUnlimitedStack new.
	
	self assert: stack isEmpty! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 17:36:00'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOUnlimitedStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 17:36:03'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOUnlimitedStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 17:36:06'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOUnlimitedStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 17:36:10'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOUnlimitedStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 17:36:13'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOUnlimitedStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 17:36:15'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOUnlimitedStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 17:36:25'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOUnlimitedStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 17:36:30'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOUnlimitedStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'PT 10/11/2022 17:36:34'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOUnlimitedStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PT 10/11/2022 17:36:57'!
test01PrefixCannotBeEmpty

	| stack sentenceFinderByPrefix |
	
	stack := OOUnlimitedStack new.
	
	sentenceFinderByPrefix := SentenceFinderByPrefix new with: stack.
	
	self
		should: [ sentenceFinderByPrefix find: '' ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix prefixCannotBeEmptyErrorDescription equals: anError messageText
		].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PT 10/11/2022 17:37:02'!
test02PrefixCannotHaveEmptySpaces

	| stack sentenceFinderByPrefix |
	
	stack := OOUnlimitedStack new.
	
	sentenceFinderByPrefix := SentenceFinderByPrefix new with: stack.
	
	self
		should: [ sentenceFinderByPrefix find: 'text text' ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix prefixCannotHaveEmptySpacesErrorDescription equals: anError messageText
		].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PT 10/13/2022 13:45:38'!
test03FindFiltersOutByDifferentLetters

	| stack originalCollection findResult spectedFindResult sentenceFinderByPrefix resultingStackOrder |
	
	stack := OOUnlimitedStack new.
	
	originalCollection := { 'Hola' . 'Holanda' . 'Azul' }.
	spectedFindResult := { 'Hola' . 'Holanda' }.
	resultingStackOrder := OrderedCollection new.
	
	originalCollection do: [ :aSentence |
		stack push: aSentence.
	].
		
	sentenceFinderByPrefix := SentenceFinderByPrefix new with: stack.
	
	findResult := sentenceFinderByPrefix find: 'Hol'.
	
	[ stack isEmpty ] whileFalse: [
		resultingStackOrder addFirst: stack pop.
	].
	
	
	self assert: [ findResult asBag = spectedFindResult asBag ].
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PT 10/13/2022 13:46:31'!
test04FindFiltersOutASentenceWherePrefixIsNotInTheBegining

	| stack originalCollection findResult spectedFindResult sentenceFinderByPrefix resultingStackOrder |
	
	stack := OOUnlimitedStack new.
	
	originalCollection := { 'Hola' . 'Holanda' . 'Ey Hola' }.
	spectedFindResult := { 'Hola' . 'Holanda' }.
	resultingStackOrder := OrderedCollection new.
	
	originalCollection do: [ :aSentence |
		stack push: aSentence.
	].
		
	sentenceFinderByPrefix := SentenceFinderByPrefix new with: stack.
	
	findResult := sentenceFinderByPrefix find: 'Hol'.
	
	[ stack isEmpty ] whileFalse: [
		resultingStackOrder addFirst: stack pop.
	].
	
	
	self assert: [ findResult asBag = spectedFindResult asBag ].
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PT 10/13/2022 13:46:48'!
test05FindFiltersOutByCasing

	| stack originalCollection findResult spectedFindResult sentenceFinderByPrefix resultingStackOrder |
	
	stack := OOUnlimitedStack new.
	
	originalCollection := { 'Hola' . 'Holanda' . 'hola' }.
	spectedFindResult := { 'Hola' . 'Holanda' }.
	resultingStackOrder := OrderedCollection new.
	
	originalCollection do: [ :aSentence |
		stack push: aSentence.
	].
		
	sentenceFinderByPrefix := SentenceFinderByPrefix new with: stack.
	
	findResult := sentenceFinderByPrefix find: 'Hol'.
	
	[ stack isEmpty ] whileFalse: [
		resultingStackOrder addFirst: stack pop.
	].
	
	
	self assert: [ findResult asBag = spectedFindResult asBag ].
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PT 10/13/2022 13:47:24'!
test06FindPreservesStackOrder

	| stack originalCollection sentenceFinderByPrefix resultingStackOrder |
	
	stack := OOUnlimitedStack new.
	
	originalCollection := OrderedCollection new.
	{ 'Hola' . 'Holanda' . 'Azul' . 'Ey Hola!!' . 'hola' . 'Hoy' } do: [ :aSentence |
		originalCollection addLast: aSentence
	].
	
	resultingStackOrder := OrderedCollection new.
	
	originalCollection do: [ :aSentence |
		stack push: aSentence.
	].
		
	sentenceFinderByPrefix := SentenceFinderByPrefix new with: stack.
	
	sentenceFinderByPrefix find: 'Hol'.
	
	[ stack isEmpty ] whileFalse: [
		resultingStackOrder addFirst: stack pop.
	].
	
	
	self assert: [ resultingStackOrder = originalCollection ].
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PT 10/13/2022 13:47:18'!
test07FindReturnsEmptyCollectionWithAbsentPrefix

	| stack originalCollection findResult spectedFindResult sentenceFinderByPrefix resultingStackOrder |
	
	stack := OOUnlimitedStack new.
	
	originalCollection := { 'Hola' . 'Holanda' . 'Azul' . 'Ey Hola!!' . 'hola' . 'Hoy' }.
	spectedFindResult := Bag new.
	resultingStackOrder := OrderedCollection new.
	
	originalCollection do: [ :aSentence |
		stack push: aSentence.
	].
		
	sentenceFinderByPrefix := SentenceFinderByPrefix new with: stack.
	
	findResult := sentenceFinderByPrefix find: 'Lol'.
	
	[ stack isEmpty ] whileFalse: [
		resultingStackOrder addFirst: stack pop.
	].
	
	
	self assert: [ findResult asBag = spectedFindResult ].
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PT 10/13/2022 13:46:54'!
test08FindReturnsEmptyCollectionWithEmptyStack

	| stack findResult spectedFindResult sentenceFinderByPrefix |
	
	stack := OOUnlimitedStack new.
	
	spectedFindResult := Bag new.
		
	sentenceFinderByPrefix := SentenceFinderByPrefix new with: stack.
	
	findResult := sentenceFinderByPrefix find: 'Lol'.
	
	self assert: [ findResult asBag = spectedFindResult ].
	! !


!classDefinition: #OOLimitedStackCell category: 'Stack-Exercise'!
Object subclass: #OOLimitedStackCell
	instanceVariableNames: 'previousCell'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOLimitedStackCell methodsFor: 'getters' stamp: 'PT 10/13/2022 13:59:57'!
previousCell

	^previousCell.! !


!OOLimitedStackCell methodsFor: 'operations' stamp: 'PT 10/13/2022 14:02:24'!
emptyLastFilledCell

	self subclassResponsibility.! !

!OOLimitedStackCell methodsFor: 'operations' stamp: 'PT 10/13/2022 14:02:21'!
lastFilledCell

	self subclassResponsibility.! !

!OOLimitedStackCell methodsFor: 'operations' stamp: 'PT 10/13/2022 14:02:17'!
numberOfFollowingFilledCells

	self subclassResponsibility.! !

!OOLimitedStackCell methodsFor: 'operations' stamp: 'PT 10/13/2022 14:01:24'!
storeInFirstEmptyCell: anElement

	self subclassResponsibility.! !


!OOLimitedStackCell methodsFor: 'setters' stamp: 'PT 10/13/2022 14:02:55'!
previousCell: aPreviosCell

	previousCell := aPreviosCell.! !


!OOLimitedStackCell methodsFor: 'testing' stamp: 'PT 10/13/2022 14:05:29'!
isEmpty

	self subclassResponsibility.! !


!classDefinition: #OOLimitedStackNullCell category: 'Stack-Exercise'!
OOLimitedStackCell subclass: #OOLimitedStackNullCell
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOLimitedStackNullCell methodsFor: 'getters' stamp: 'PT 10/11/2022 17:57:50'!
storedElement

	^self error: OOStack stackEmptyErrorDescription.! !


!OOLimitedStackNullCell methodsFor: 'initialization' stamp: 'PT 10/11/2022 18:08:22'!
withPreviousCell: aPreviosCell

	previousCell := aPreviosCell.! !


!OOLimitedStackNullCell methodsFor: 'operations' stamp: 'PT 10/11/2022 21:31:39'!
emptyLastFilledCell
	| newCell |
	
	newCell := OOLimitedStackEmptyCell new withNextCell: self previousCell: previousCell previousCell.
	previousCell previousCell nextCell: newCell.
	^newCell.! !

!OOLimitedStackNullCell methodsFor: 'operations' stamp: 'PT 10/11/2022 19:38:51'!
lastFilledCell

	^previousCell.! !

!OOLimitedStackNullCell methodsFor: 'operations' stamp: 'PT 10/11/2022 17:55:45'!
numberOfFollowingFilledCells

	^0.! !

!OOLimitedStackNullCell methodsFor: 'operations' stamp: 'PT 10/11/2022 18:14:13'!
storeInFirstEmptyCell: anElement

	self error: OOLimitedStack stackOverflow.! !


!OOLimitedStackNullCell methodsFor: 'testing' stamp: 'PT 10/11/2022 17:51:58'!
isEmpty

	^true.! !


!classDefinition: #OOLimitedStackRealCell category: 'Stack-Exercise'!
OOLimitedStackCell subclass: #OOLimitedStackRealCell
	instanceVariableNames: 'nextCell'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOLimitedStackRealCell methodsFor: 'getters' stamp: 'PT 10/13/2022 13:54:02'!
storedElement

	self subclassResponsibility.! !


!OOLimitedStackRealCell methodsFor: 'operations' stamp: 'PT 10/13/2022 13:54:40'!
emptyLastFilledCell

	self subclassResponsibility.! !

!OOLimitedStackRealCell methodsFor: 'operations' stamp: 'PT 10/13/2022 13:55:42'!
lastFilledCell

	self subclassResponsibility.! !

!OOLimitedStackRealCell methodsFor: 'operations' stamp: 'PT 10/13/2022 13:55:39'!
numberOfFollowingFilledCells

	self subclassResponsibility.! !

!OOLimitedStackRealCell methodsFor: 'operations' stamp: 'PT 10/13/2022 13:55:36'!
storeInFirstEmptyCell: anElement

	self subclassResponsibility.! !


!OOLimitedStackRealCell methodsFor: 'setters' stamp: 'PT 10/13/2022 13:58:12'!
nextCell: aCell

	nextCell := aCell.! !


!OOLimitedStackRealCell methodsFor: 'testing' stamp: 'PT 10/13/2022 13:58:48'!
isEmpty

	self subclassResponsibility.! !


!classDefinition: #OOLimitedStackEmptyCell category: 'Stack-Exercise'!
OOLimitedStackRealCell subclass: #OOLimitedStackEmptyCell
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOLimitedStackEmptyCell methodsFor: 'getters' stamp: 'PT 10/11/2022 19:35:50'!
nextCell

	^nextCell.! !

!OOLimitedStackEmptyCell methodsFor: 'getters' stamp: 'PT 10/11/2022 17:57:41'!
storedElement

	^self error: OOStack stackEmptyErrorDescription.! !


!OOLimitedStackEmptyCell methodsFor: 'initialization' stamp: 'PT 10/11/2022 18:07:31'!
withNextCell: aNextCell previousCell: aPreviosCell

	nextCell := aNextCell.
	previousCell := aPreviosCell.! !


!OOLimitedStackEmptyCell methodsFor: 'operations' stamp: 'PT 10/11/2022 21:31:39'!
emptyLastFilledCell
	| newCell |
	
	newCell := OOLimitedStackEmptyCell new withNextCell: self previousCell: previousCell previousCell.
	previousCell previousCell nextCell: newCell.
	^newCell.! !

!OOLimitedStackEmptyCell methodsFor: 'operations' stamp: 'PT 10/11/2022 19:38:37'!
lastFilledCell

	^previousCell.! !

!OOLimitedStackEmptyCell methodsFor: 'operations' stamp: 'PT 10/11/2022 17:55:38'!
numberOfFollowingFilledCells

	^0.! !

!OOLimitedStackEmptyCell methodsFor: 'operations' stamp: 'PT 10/11/2022 21:31:54'!
storeInFirstEmptyCell: anElement
	| aFilledCell |
	
	aFilledCell := OOLimitedStackFilledCell new withElement: anElement nextCell: nextCell previousCell: previousCell.
	nextCell previousCell: aFilledCell.
	
	^aFilledCell.! !


!OOLimitedStackEmptyCell methodsFor: 'testing' stamp: 'PT 10/11/2022 17:49:03'!
isEmpty

	^true.! !


!classDefinition: #OOLimitedStackFilledCell category: 'Stack-Exercise'!
OOLimitedStackRealCell subclass: #OOLimitedStackFilledCell
	instanceVariableNames: 'storedElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOLimitedStackFilledCell methodsFor: 'getters' stamp: 'PT 10/11/2022 19:36:55'!
nextCell

	^nextCell.! !

!OOLimitedStackFilledCell methodsFor: 'getters' stamp: 'PT 10/11/2022 17:58:11'!
storedElement

	^storedElement.! !


!OOLimitedStackFilledCell methodsFor: 'initialization' stamp: 'PT 10/11/2022 18:07:59'!
withElement: anElement nextCell: aNextCell previousCell: aPreviosCell
	
	storedElement := anElement.
	nextCell := aNextCell.
	previousCell := aPreviosCell.! !


!OOLimitedStackFilledCell methodsFor: 'operations' stamp: 'PT 10/11/2022 20:23:27'!
emptyLastFilledCell

	nextCell emptyLastFilledCell.! !

!OOLimitedStackFilledCell methodsFor: 'operations' stamp: 'PT 10/11/2022 19:38:45'!
lastFilledCell

	^nextCell lastFilledCell.! !

!OOLimitedStackFilledCell methodsFor: 'operations' stamp: 'PT 10/11/2022 17:56:01'!
numberOfFollowingFilledCells

	^1 + nextCell numberOfFollowingFilledCells.! !

!OOLimitedStackFilledCell methodsFor: 'operations' stamp: 'PT 10/11/2022 18:16:31'!
storeInFirstEmptyCell: anElement

	nextCell := nextCell storeInFirstEmptyCell: anElement.! !


!OOLimitedStackFilledCell methodsFor: 'testing' stamp: 'PT 10/11/2022 17:48:42'!
isEmpty

	^false.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'PT 10/11/2022 17:33:53'!
isEmpty

	self subclassResponsibility.! !


!OOStack methodsFor: 'operations' stamp: 'PT 10/11/2022 17:35:16'!
pop

	self subclassResponsibility.! !

!OOStack methodsFor: 'operations' stamp: 'PT 10/11/2022 17:35:12'!
push: anElement

	self subclassResponsibility.! !

!OOStack methodsFor: 'operations' stamp: 'PT 10/11/2022 17:34:59'!
size

	self subclassResponsibility.! !

!OOStack methodsFor: 'operations' stamp: 'PT 10/11/2022 17:34:20'!
top

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOLimitedStack category: 'Stack-Exercise'!
OOStack subclass: #OOLimitedStack
	instanceVariableNames: 'firstCell'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOLimitedStack methodsFor: 'initialization' stamp: 'PT 10/11/2022 21:52:24'!
with: numberOfCells
	| newFirstCell |
	
	firstCell := OOLimitedStackNullCell new.
	
	1 to: numberOfCells do: [ :value |
		newFirstCell := OOLimitedStackEmptyCell new.
		newFirstCell nextCell: firstCell.
		firstCell previousCell: newFirstCell. 
		firstCell := newFirstCell.
	].

	firstCell previousCell: self.! !


!OOLimitedStack methodsFor: 'testing' stamp: 'PT 10/11/2022 17:48:30'!
isEmpty

	^firstCell isEmpty.! !


!OOLimitedStack methodsFor: 'operations' stamp: 'PT 10/11/2022 19:51:15'!
pop
	| removedElement |
	
	removedElement := self top.
	firstCell emptyLastFilledCell.
	
	^removedElement.! !

!OOLimitedStack methodsFor: 'operations' stamp: 'PT 10/11/2022 18:38:55'!
push: anElement

	firstCell := firstCell storeInFirstEmptyCell: anElement.! !

!OOLimitedStack methodsFor: 'operations' stamp: 'PT 10/11/2022 17:55:18'!
size

	^firstCell numberOfFollowingFilledCells.! !

!OOLimitedStack methodsFor: 'operations' stamp: 'PT 10/11/2022 18:43:03'!
top
	
	^firstCell lastFilledCell storedElement.! !


!OOLimitedStack methodsFor: 'private' stamp: 'PT 10/13/2022 14:10:00'!
nextCell: aCell
	"Although an OOLimitedStack is not a cell, it must answer to this message
	to behave as a cell for certain operations"

	firstCell := aCell.! !

!OOLimitedStack methodsFor: 'private' stamp: 'PT 10/13/2022 14:10:08'!
storedElement
	"Although an OOLimitedStack is not a cell, it must answer to this message
	to behave as a cell for certain operations"

	^self error: OOStack stackEmptyErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOLimitedStack class' category: 'Stack-Exercise'!
OOLimitedStack class
	instanceVariableNames: ''!

!OOLimitedStack class methodsFor: 'error descriptions' stamp: 'PT 10/11/2022 18:14:51'!
stackOverflow

	^'Stack is full'.! !


!classDefinition: #OOUnlimitedStack category: 'Stack-Exercise'!
OOStack subclass: #OOUnlimitedStack
	instanceVariableNames: 'firstLink'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOUnlimitedStack methodsFor: 'initialization' stamp: 'PT 10/11/2022 21:51:37'!
initialize

	firstLink := OOUnlimitedStackNullLink new.! !


!OOUnlimitedStack methodsFor: 'testing' stamp: 'PT 10/11/2022 17:52:28'!
isEmpty

	^firstLink isEmpty.! !


!OOUnlimitedStack methodsFor: 'operations' stamp: 'PT 10/11/2022 21:09:55'!
pop

	| popedElement secondCell |
	
	popedElement := firstLink.
	secondCell := firstLink linkBelow .
	firstLink := secondCell.
	
	^popedElement storedElement.! !

!OOUnlimitedStack methodsFor: 'operations' stamp: 'PT 10/13/2022 14:12:06'!
push: anElement

	firstLink := OOUnlimitedStackFilledRealLink new withElement: anElement andLinkBelow: firstLink.! !

!OOUnlimitedStack methodsFor: 'operations' stamp: 'PT 10/11/2022 17:54:47'!
size

	^firstLink numberOfLinksBelow.! !

!OOUnlimitedStack methodsFor: 'operations' stamp: 'PT 10/11/2022 17:52:51'!
top
	
	^firstLink storedElement.! !


!classDefinition: #OOUnlimitedStackLink category: 'Stack-Exercise'!
Object subclass: #OOUnlimitedStackLink
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOUnlimitedStackLink methodsFor: 'operations' stamp: 'PT 10/11/2022 17:54:47'!
numberOfLinksBelow

	self subclassResponsibility.! !


!OOUnlimitedStackLink methodsFor: 'testing' stamp: 'PT 10/10/2022 10:52:30'!
isEmpty

	self subclassResponsibility.! !


!OOUnlimitedStackLink methodsFor: 'getters' stamp: 'PT 10/11/2022 21:09:55'!
linkBelow

	self subclassResponsibility.! !

!OOUnlimitedStackLink methodsFor: 'getters' stamp: 'PT 10/10/2022 10:45:17'!
storedElement

	self subclassResponsibility.! !


!classDefinition: #OOUnlimitedStackFilledRealLink category: 'Stack-Exercise'!
OOUnlimitedStackLink subclass: #OOUnlimitedStackFilledRealLink
	instanceVariableNames: 'linkBelow storedElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOUnlimitedStackFilledRealLink methodsFor: 'operations' stamp: 'PT 10/11/2022 21:13:03'!
numberOfLinksBelow
	
	^1 + linkBelow numberOfLinksBelow.! !


!OOUnlimitedStackFilledRealLink methodsFor: 'initialization' stamp: 'PT 10/11/2022 21:13:22'!
withElement: anElement andLinkBelow: aLink

	storedElement := anElement.
	linkBelow := aLink.

	! !


!OOUnlimitedStackFilledRealLink methodsFor: 'testing' stamp: 'PT 10/10/2022 10:52:07'!
isEmpty
	
	^false.! !


!OOUnlimitedStackFilledRealLink methodsFor: 'getters' stamp: 'PT 10/11/2022 21:13:03'!
linkBelow
	
	^linkBelow.! !

!OOUnlimitedStackFilledRealLink methodsFor: 'getters' stamp: 'PT 10/10/2022 10:44:56'!
storedElement

	^storedElement.! !


!classDefinition: #OOUnlimitedStackNullLink category: 'Stack-Exercise'!
OOUnlimitedStackLink subclass: #OOUnlimitedStackNullLink
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOUnlimitedStackNullLink methodsFor: 'operations' stamp: 'PT 10/11/2022 17:54:47'!
numberOfLinksBelow

	^0.! !


!OOUnlimitedStackNullLink methodsFor: 'testing' stamp: 'PT 10/10/2022 10:52:19'!
isEmpty

	^true.! !


!OOUnlimitedStackNullLink methodsFor: 'getters' stamp: 'PT 10/11/2022 21:09:55'!
linkBelow

	self error: OOStack stackEmptyErrorDescription.! !

!OOUnlimitedStackNullLink methodsFor: 'getters' stamp: 'PT 10/10/2022 11:11:29'!
storedElement

	self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stackSentences'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'PT 10/11/2022 17:37:28'!
find: aPrefix

	| temporaryStack results |
	
	aPrefix isEmpty ifTrue: [ self error: self class prefixCannotBeEmptyErrorDescription ].
	( aPrefix includesSubString: ' ' ) ifTrue: [ self error: self class prefixCannotHaveEmptySpacesErrorDescription ].
	
	results := OrderedCollection new.
	temporaryStack := OOUnlimitedStack new.
	
	[ stackSentences isEmpty ] whileFalse: [
		( stackSentences top beginsWith: aPrefix ) ifTrue: [
			results add: stackSentences top.
		].
		temporaryStack push: stackSentences pop.
	].

	[ temporaryStack isEmpty ] whileFalse: [
		stackSentences push: temporaryStack pop.
	].
	
	^results.
	
	
	
	
	
	
	
	
	
	
	
	
	
	! !

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'PT 10/10/2022 11:43:18'!
with: aStackOfStrings

	stackSentences := aStackOfStrings.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'Errors' stamp: 'PT 10/10/2022 11:35:42'!
prefixCannotBeEmptyErrorDescription

	^'Prefix Cannot Be Empty'.! !

!SentenceFinderByPrefix class methodsFor: 'Errors' stamp: 'PT 10/10/2022 11:45:38'!
prefixCannotHaveEmptySpacesErrorDescription

	^'Prefix Cannot Have Empty Spaces'.! !
