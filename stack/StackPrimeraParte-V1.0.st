!classDefinition: #StackTest category: 'StackPrimeraParte'!
TestCase subclass: #StackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!StackTest methodsFor: 'Tests' stamp: 'IL 10/1/2022 19:24:17'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := Stack new.
	
	self assert: stack isEmpty! !

!StackTest methodsFor: 'Tests' stamp: 'PT 10/10/2022 10:05:39'!
test02StackShouldBeSizeOneWhenPushedOneElement

	| stack |
	
	stack := Stack new.
	
	stack push: 'anElement'.
	
	self assert: stack size = 1.! !

!StackTest methodsFor: 'Tests' stamp: 'PT 10/10/2022 09:38:40'!
test03StackShouldBeSizeTwoWhenPushedTwoElements

	| stack |
	
	stack := Stack new.
	
	stack push: 'firstElement'.
	stack push: 'secondElement'.
	
	self assert: stack size = 2.! !

!StackTest methodsFor: 'Tests' stamp: 'PT 10/10/2022 09:40:34'!
test04StackShouldBeSizeOneWhenPushedTwoElementsAndPopedOne

	| stack |
	
	stack := Stack new.
	
	stack push: 'firstElement'.
	stack push: 'secondElement'.
	
	stack pop.
	
	self assert: ( stack size = 1 ).! !

!StackTest methodsFor: 'Tests' stamp: 'PT 10/10/2022 10:07:40'!
test05StackShouldReturnLastElementWhenPoped

	| stack popedElement firstElement lastElement |
	
	stack := Stack new.
	
	firstElement := 'firstElement'.
	lastElement := 'lastElement'.
	
	stack push: firstElement.
	stack push: lastElement.
	
	popedElement := stack pop.
	
	self assert: popedElement == lastElement.! !

!StackTest methodsFor: 'Tests' stamp: 'PT 10/10/2022 10:01:43'!
test06StackIsLIFO

	| stack originalList spectedList popedList |
	
	stack := Stack new.
	
	originalList := { 1 . 2 . 3 . 4 . 5 }.
	spectedList := { 5 . 4 . 3 . 2 . 1 }.
	popedList := OrderedCollection new.
	
	originalList do: [ :anElement |
		stack push: anElement.
	].

	[ stack isEmpty ] whileFalse: [
		popedList addLast: (stack pop).	
	].
	
	self assert: ( popedList hasEqualElements: spectedList ).! !

!StackTest methodsFor: 'Tests' stamp: 'PT 10/10/2022 10:08:31'!
test07StackTopShouldReturnLastElement

	| stack firstElement lastElement |
	
	stack := Stack new.
	
	firstElement := 'firstElement'.
	lastElement := 'lastElement'.
	
	stack push: firstElement.
	stack push: lastElement.
	
	self assert: ( stack top == lastElement and: [ stack size = 2 ] ).! !


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'elementos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'Testing' stamp: 'PT 10/10/2022 09:30:15'!
isEmpty

	^self size = 0.

	
	! !

!Stack methodsFor: 'Testing' stamp: 'PT 10/10/2022 09:26:06'!
size

	^elementos size.

	
	! !


!Stack methodsFor: 'Initialization' stamp: 'PT 10/10/2022 09:25:05'!
initialize
	elementos := OrderedCollection new.! !


!Stack methodsFor: 'Operations' stamp: 'PT 10/10/2022 09:39:11'!
pop

	^elementos removeLast.! !

!Stack methodsFor: 'Operations' stamp: 'PT 10/10/2022 09:33:25'!
push: anElement

	elementos addLast: anElement.! !

!Stack methodsFor: 'Operations' stamp: 'PT 10/10/2022 10:04:15'!
top

	^elementos last.! !
