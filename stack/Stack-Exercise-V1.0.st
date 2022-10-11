!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:57'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:56:59'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:26'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:27'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:44'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:56'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:07'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
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

!SentenceFinderByPrefixTest methodsFor: 'Test' stamp: 'PT 10/10/2022 11:44:01'!
test01PrefixCannotBeEmpty

	| stack sentenceFinderByPrefix |
	
	stack := OOStack new.
	
	sentenceFinderByPrefix := SentenceFinderByPrefix new with: stack.
	
	self
		should: [ sentenceFinderByPrefix find: '' ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix prefixCannotBeEmptyErrorDescription equals: anError messageText
		].! !

!SentenceFinderByPrefixTest methodsFor: 'Test' stamp: 'PT 10/10/2022 11:52:53'!
test02PrefixCannotHaveEmptySpaces

	| stack sentenceFinderByPrefix |
	
	stack := OOStack new.
	
	sentenceFinderByPrefix := SentenceFinderByPrefix new with: stack.
	
	self
		should: [ sentenceFinderByPrefix find: 'text text' ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix prefixCannotHaveEmptySpacesErrorDescription equals: anError messageText
		].! !

!SentenceFinderByPrefixTest methodsFor: 'Test' stamp: 'PT 10/10/2022 12:19:49'!
test03FindReturnsCorrectSentences

	| stack originalCollection findResult spectedFindResult sentenceFinderByPrefix resultingStackOrder |
	
	stack := OOStack new.
	
	originalCollection := { 'Hola' . 'Holanda' . 'Azul' . 'Ey Hola!!' . 'hola' . 'Hoy' }.
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

!SentenceFinderByPrefixTest methodsFor: 'Test' stamp: 'PT 10/11/2022 17:03:11'!
test04FindPreservesStackOrder

	| stack originalCollection sentenceFinderByPrefix resultingStackOrder |
	
	stack := OOStack new.
	
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

!SentenceFinderByPrefixTest methodsFor: 'Test' stamp: 'PT 10/11/2022 17:05:52'!
test05FindReturnsEmptyCollectionWithAbsentPrefix

	| stack originalCollection findResult spectedFindResult sentenceFinderByPrefix resultingStackOrder |
	
	stack := OOStack new.
	
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

!SentenceFinderByPrefixTest methodsFor: 'Test' stamp: 'PT 10/11/2022 17:05:22'!
test06FindReturnsEmptyCollectionWithEmptyStack

	| stack findResult spectedFindResult sentenceFinderByPrefix |
	
	stack := OOStack new.
	
	spectedFindResult := Bag new.
		
	sentenceFinderByPrefix := SentenceFinderByPrefix new with: stack.
	
	findResult := sentenceFinderByPrefix find: 'Lol'.
	
	self assert: [ findResult asBag = spectedFindResult ].
	! !


!classDefinition: #Cell category: 'Stack-Exercise'!
Object subclass: #Cell
	instanceVariableNames: 'cellBelow'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Cell methodsFor: 'Operations' stamp: 'PT 10/10/2022 11:07:05'!
cellBelow

	self subclassResponsibility.! !

!Cell methodsFor: 'Operations' stamp: 'PT 10/10/2022 11:18:40'!
numberOfCellsBelow

	self subclassResponsibility.! !

!Cell methodsFor: 'Operations' stamp: 'PT 10/10/2022 10:45:17'!
storedElement

	self subclassResponsibility.! !


!Cell methodsFor: 'Testing' stamp: 'PT 10/10/2022 10:52:30'!
isEmpty

	self subclassResponsibility.! !


!classDefinition: #EmpyCell category: 'Stack-Exercise'!
Cell subclass: #EmpyCell
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmpyCell methodsFor: 'Operations' stamp: 'PT 10/10/2022 11:11:16'!
cellBelow

	self error: OOStack stackEmptyErrorDescription.! !

!EmpyCell methodsFor: 'Operations' stamp: 'PT 10/10/2022 11:18:32'!
numberOfCellsBelow

	^0.! !

!EmpyCell methodsFor: 'Operations' stamp: 'PT 10/10/2022 11:11:29'!
storedElement

	self error: OOStack stackEmptyErrorDescription.! !


!EmpyCell methodsFor: 'Testing' stamp: 'PT 10/10/2022 10:52:19'!
isEmpty

	^true.! !


!classDefinition: #FilledCell category: 'Stack-Exercise'!
Cell subclass: #FilledCell
	instanceVariableNames: 'storedElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!FilledCell methodsFor: 'Operations' stamp: 'PT 10/10/2022 11:05:17'!
cellBelow
	
	^cellBelow.! !

!FilledCell methodsFor: 'Operations' stamp: 'PT 10/10/2022 11:18:10'!
numberOfCellsBelow
	
	^1 + cellBelow numberOfCellsBelow.! !

!FilledCell methodsFor: 'Operations' stamp: 'PT 10/10/2022 10:44:56'!
storedElement

	^storedElement.! !


!FilledCell methodsFor: 'Initialization' stamp: 'PT 10/10/2022 10:49:06'!
withElement: anElement andNextCell: aCell

	storedElement := anElement.
	cellBelow := aCell.

	! !


!FilledCell methodsFor: 'Testing' stamp: 'PT 10/10/2022 10:52:07'!
isEmpty
	
	^false.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topCell'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'Testing' stamp: 'PT 10/10/2022 10:51:57'!
isEmpty

	^topCell isEmpty.! !

!OOStack methodsFor: 'Testing' stamp: 'PT 10/10/2022 11:19:03'!
size

	^topCell numberOfCellsBelow.! !


!OOStack methodsFor: 'Initialization' stamp: 'PT 10/10/2022 11:19:54'!
initialize
	
	topCell := EmpyCell new.! !


!OOStack methodsFor: 'Operations' stamp: 'PT 10/10/2022 11:20:15'!
pop

	| popedElement secondCell |
	
	popedElement := topCell.
	secondCell := topCell cellBelow .
	topCell := secondCell.
	
	^popedElement storedElement.! !

!OOStack methodsFor: 'Operations' stamp: 'PT 10/10/2022 11:20:20'!
push: anElement

	topCell := FilledCell new withElement: anElement andNextCell: topCell.! !

!OOStack methodsFor: 'Operations' stamp: 'PT 10/10/2022 11:20:24'!
top
	
	^topCell storedElement.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stackSentences'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'Operations' stamp: 'PT 10/10/2022 12:13:51'!
find: aPrefix

	| temporaryStack results |
	
	aPrefix isEmpty ifTrue: [ self error: self class prefixCannotBeEmptyErrorDescription ].
	( aPrefix includesSubString: ' ' ) ifTrue: [ self error: self class prefixCannotHaveEmptySpacesErrorDescription ].
	
	results := OrderedCollection new.
	temporaryStack := OOStack new.
	
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

!SentenceFinderByPrefix methodsFor: 'Operations' stamp: 'PT 10/10/2022 11:43:18'!
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
