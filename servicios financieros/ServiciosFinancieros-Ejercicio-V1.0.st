!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'PTP 11/10/2022 14:49:48'!
test01newPortfoliosBalanceIsZero

	| aPortfolio |
	aPortfolio := Portfolio new.
	self assert: (0*peso) equals: aPortfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'PTP 11/10/2022 14:51:51'!
test02aPortfolioWithOneAccount
	| aPortfolio anAccount |
	
	aPortfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	Deposit register: (100*peso) on: anAccount .
	aPortfolio add: anAccount.
	self assert: (100*peso) equals: aPortfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'PTP 11/10/2022 14:52:24'!
test03aPortfolioWithTwoAccounts
	| aPortfolio anAccount1 anAccount2 |
	
	aPortfolio := Portfolio new.
	anAccount1 := ReceptiveAccount new.
	anAccount2 := ReceptiveAccount new.

	Deposit register: (100*peso) on: anAccount1 .
	Deposit register: (50*peso) on: anAccount2 .
	aPortfolio add: anAccount1.
	aPortfolio add: anAccount2.
	self assert: (150*peso) equals: aPortfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'PTP 11/10/2022 14:54:28'!
test04aPortfolioWithAnAccountAndAnotherPortfolioWithAnotherAccount
	| aPortfolio1 anAccount1 anAccount2 aPortfolio2 |
	
	aPortfolio1 := Portfolio new.
	aPortfolio2 := Portfolio new.

	anAccount1 := ReceptiveAccount new.
	anAccount2 := ReceptiveAccount new.

	Deposit register: (100*peso) on: anAccount1 .
	Withdraw register: (50*peso) on: anAccount2 .
	aPortfolio1 add: anAccount1.
	aPortfolio2 add: anAccount2.
	aPortfolio1 add: aPortfolio2.
	self assert: (50*peso) equals: aPortfolio1 balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'PTP 11/10/2022 14:55:59'!
test05aPortfolioHasATransaction
	| aPortfolio1 anAccount1 aTransaction |
	
	aPortfolio1 := Portfolio new.
	anAccount1 := ReceptiveAccount new.

	aTransaction := Deposit register: (100*peso) on: anAccount1.
	aPortfolio1 add: anAccount1.

	self assert: (aPortfolio1 hasRegistered: aTransaction)! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'PTP 11/10/2022 14:57:22'!
test06aPortfolioCanDifferenciateTwoTransactions
	| aPortfolio1 anAccount1 aTransaction1 aTransaction2 |
	
	aPortfolio1 := Portfolio new.
	anAccount1 := ReceptiveAccount new.

	aTransaction1 := Deposit register: (100*peso) on: anAccount1.
	aTransaction2 := Deposit for:(100*peso).
	aPortfolio1 add: anAccount1.

	self deny: (aPortfolio1 hasRegistered: aTransaction2)! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'PTP 11/10/2022 14:58:27'!
test07aPortfolioReturnsAllTransactions
	| aPortfolio1 anAccount1 anAccount2 aTransaction1 aTransaction2 |
	
	aPortfolio1 := Portfolio new.
	anAccount1 := ReceptiveAccount new.
	anAccount2 := ReceptiveAccount new.


	aTransaction1 := Deposit register: (100*peso) on: anAccount1.
	aTransaction2 := Deposit register:(100*peso) on: anAccount2.
	aPortfolio1 add: anAccount1.
	aPortfolio1 add: anAccount2.

	self assert: 2 equals: (aPortfolio1 transactions) size.
	self assert: (aPortfolio1 transactions) includes: aTransaction1.
	self assert: (aPortfolio1 transactions) includes: aTransaction2.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferenceTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'PTP 11/10/2022 15:00:54'!
test01aTransferenceMoves100PesosCorrectly

	| reciverAccount senderAccount |
	
	reciverAccount := ReceptiveAccount new.
	senderAccount := ReceptiveAccount new.
	
	Transference from: senderAccount to: reciverAccount  of: (100*peso). 
		
	self assert: 1 equals: reciverAccount transactions size.
	self assert: 1 equals: senderAccount transactions size.
	self assert: (100*peso) equals: reciverAccount balance.
	self assert: (-100*peso) equals: senderAccount balance.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'PTP 11/10/2022 15:01:06'!
test02aTransferenceMoves200PesosCorrectly

	| reciverAccount senderAccount |
	
	reciverAccount := ReceptiveAccount new.
	senderAccount := ReceptiveAccount new.
	
	Transference from: senderAccount to: reciverAccount  of: (200*peso). 

	self assert: 1 equals: reciverAccount transactions size.
	self assert: 1 equals: senderAccount transactions size.
	self assert: (200*peso) equals: reciverAccount balance.
	self assert: (-200*peso) equals: senderAccount balance.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'PTP 11/10/2022 15:02:25'!
test03aTransferenceOf100PesosKnowsItsValue

	| reciverAccount senderAccount aTransference|
	
	reciverAccount := ReceptiveAccount new.
	senderAccount := ReceptiveAccount new.
	
	aTransference := Transference from: senderAccount to: reciverAccount  of: (100*peso). 
		
	self assert: (100 * peso) equals: aTransference value.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'PTP 11/10/2022 15:02:37'!
test04aTransferenceOf200PesosKnowsItsValue

	| reciverAccount senderAccount aTransference|
	
	reciverAccount := ReceptiveAccount new.
	senderAccount := ReceptiveAccount new.

	aTransference := Transference from: senderAccount to: reciverAccount  of: (200*peso). 
			
	self assert: (200 * peso) equals: aTransference value.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'PTP 11/10/2022 15:03:21'!
test05eachTransactionKnowsItsCounterpart

	| reciverAccount senderAccount aTransference aDeposit aWithdraw |
	
	reciverAccount := ReceptiveAccount new.
	senderAccount := ReceptiveAccount new.

	aTransference := Transference from: senderAccount to: reciverAccount  of: (100*peso). 
	
	aDeposit := reciverAccount transactions anyOne.
	aWithdraw := senderAccount transactions anyOne.
	
	self assert: aDeposit linkedTransaction == aWithdraw.
	self assert: aWithdraw linkedTransaction == aDeposit .
	! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'linkedTransaction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'PT 11/8/2022 19:58:29'!
contabilizeTo: aBalance

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'PT 11/8/2022 20:53:39'!
linkedTransaction
	^linkedTransaction.! !

!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'PT 11/8/2022 20:57:10'!
linkedTransaction: aTransaction

	linkedTransaction := aTransaction.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'PTP 11/10/2022 14:45:45'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account add: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'PT 11/8/2022 19:58:26'!
contabilizeTo: aBalance

	^aBalance + self value. ! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'PT 11/8/2022 19:58:34'!
contabilizeTo: aBalance

	^aBalance - self value. ! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransactionHolder category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransactionHolder
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransactionHolder methodsFor: 'main protocol' stamp: 'PTP 11/10/2022 14:47:22'!
balance

	self subclassResponsibility! !

!TransactionHolder methodsFor: 'main protocol' stamp: 'PTP 11/10/2022 14:47:19'!
hasRegistered: aTransaction

	self subclassResponsibility! !

!TransactionHolder methodsFor: 'main protocol' stamp: 'PTP 11/10/2022 14:47:15'!
transactions

	self subclassResponsibility! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
TransactionHolder subclass: #Portfolio
	instanceVariableNames: 'transactionHolders'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'main protocol' stamp: 'PTP 11/10/2022 14:44:52'!
add: aTransactionHolder

	transactionHolders add: aTransactionHolder. 
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'PTP 11/10/2022 14:46:48'!
balance

	^transactionHolders sum: [:anAccount| anAccount balance] ifEmpty: [0].! !

!Portfolio methodsFor: 'main protocol' stamp: 'PTP 11/10/2022 14:46:57'!
hasRegistered: aTransaction

	^transactionHolders anySatisfy:[:aTransactionHolder| aTransactionHolder hasRegistered: aTransaction]
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'PTP 11/10/2022 14:44:52'!
transactions
	
	|transactions|
	
	transactions := OrderedCollection new.
	transactionHolders do: [:aTransactionHolder | transactions addAll: (aTransactionHolder transactions) ] .
	^transactions.! !


!Portfolio methodsFor: 'initialization' stamp: 'PTP 11/10/2022 14:44:52'!
initialize
	transactionHolders := OrderedCollection new.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
TransactionHolder subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'PTP 11/10/2022 14:45:45'!
add: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'PT 11/8/2022 19:59:17'!
balance

	| balance |
	
	balance := 0.
	
	transactions do: [ :aTransaction | balance := ( aTransaction contabilizeTo: balance ) ] .
	
	^balance.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'as yet unclassified' stamp: 'PT 11/8/2022 20:29:58'!
value
	^value! !

!Transference methodsFor: 'as yet unclassified' stamp: 'PT 11/8/2022 20:28:57'!
value: aValue
	
	value := aValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'as yet unclassified' stamp: 'PT 11/8/2022 20:28:22'!
from: aValue

	^self new value: aValue.! !

!Transference class methodsFor: 'as yet unclassified' stamp: 'PT 11/8/2022 20:56:26'!
from: senderAccount to: recieverAccount of: anAmount

	| aDeposit aWithdraw |
	aDeposit := Deposit register: anAmount on: recieverAccount.
	aWithdraw := Withdraw register: anAmount on: senderAccount . 
	aDeposit linkedTransaction: aWithdraw .
	aWithdraw linkedTransaction: aDeposit.
	^Transference from: anAmount! !
