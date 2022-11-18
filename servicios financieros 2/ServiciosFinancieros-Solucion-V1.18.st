!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'PT 11/18/2022 16:18:36'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) output
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


!classDefinition: #ReportTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReportTest methodsFor: 'tests - AccountSummary' stamp: 'PT 11/18/2022 17:01:24'!
test01ASEmptyRecetiveAccount

	| anAccount anAccountSummaryReport expectedReportOutputLines |
	
	anAccount := ReceptiveAccount new.
	anAccountSummaryReport := AccountSummaryReport for: anAccount.
	expectedReportOutputLines := OrderedCollection new.
	expectedReportOutputLines 
		add: 'Balance = 0 * pesos'.
	
	self assert: expectedReportOutputLines equals: anAccountSummaryReport output.! !

!ReportTest methodsFor: 'tests - AccountSummary' stamp: 'PT 11/18/2022 17:02:00'!
test02ASRecetiveAccountWithOneDeposit

	| anAccount anAccountSummaryReport expectedReportOutputLines |
	
	anAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: anAccount.
	
	anAccountSummaryReport := AccountSummaryReport for: anAccount.
	expectedReportOutputLines := OrderedCollection new.
	expectedReportOutputLines 
		add: 'Depósito por 100 * pesos';
		add: 'Balance = 100 * pesos'.

	self assert: expectedReportOutputLines equals: anAccountSummaryReport output.! !

!ReportTest methodsFor: 'tests - AccountSummary' stamp: 'PT 11/18/2022 17:02:17'!
test03ASRecetiveAccountWithTwoDeposit

	| anAccount anAccountSummaryReport expectedReportOutputLines |
	
	anAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: anAccount.
	Deposit register: 200 * peso on: anAccount.
	
	anAccountSummaryReport := AccountSummaryReport for: anAccount.
	
	
	expectedReportOutputLines := OrderedCollection new.
	expectedReportOutputLines 
		add: 'Depósito por 100 * pesos';
		add: 'Depósito por 200 * pesos';
		add: 'Balance = 300 * pesos'.
	
	self assert: expectedReportOutputLines equals: anAccountSummaryReport output.! !

!ReportTest methodsFor: 'tests - AccountSummary' stamp: 'PT 11/18/2022 17:02:36'!
test04ASRecetiveAccountWithDepositAndWithdraw

	| anAccount anAccountSummaryReport expectedReportOutputLines |
	
	anAccount := ReceptiveAccount new.
	Deposit register: 200 * peso on: anAccount.
	Withdraw register: 100 * peso on: anAccount.
	
	anAccountSummaryReport := AccountSummaryReport for: anAccount.
	
	
	expectedReportOutputLines := OrderedCollection new.
	expectedReportOutputLines 
		add: 'Depósito por 200 * pesos';
		add: 'Extracción por 100 * pesos';
		add: 'Balance = 100 * pesos'.
		
	self assert: expectedReportOutputLines equals: anAccountSummaryReport output.! !

!ReportTest methodsFor: 'tests - AccountSummary' stamp: 'PT 11/18/2022 17:03:28'!
test05ASRecetiveAccountWithNegativeBalance

	| anAccount anAccountSummaryReport expectedReportOutputLines |
	
	anAccount := ReceptiveAccount new.
	Withdraw register: 100 * peso on: anAccount.
	
	anAccountSummaryReport := AccountSummaryReport for: anAccount.
	
	expectedReportOutputLines := OrderedCollection new.
	expectedReportOutputLines 
		add: 'Extracción por 100 * pesos';
		add: 'Balance = -100 * pesos'.
		
	self assert: expectedReportOutputLines equals: anAccountSummaryReport output.! !

!ReportTest methodsFor: 'tests - AccountSummary' stamp: 'PT 11/18/2022 17:04:47'!
test06ASPorfolio

	| aPortfolio aReceptiveAccount anAccountSummaryReport expectedReportOutputLines |
	
	aReceptiveAccount := ReceptiveAccount new.
	aPortfolio := Portfolio with: aReceptiveAccount.
	Withdraw register: 100 * peso on: aReceptiveAccount.
	
	anAccountSummaryReport := AccountSummaryReport for: aPortfolio.
	
	expectedReportOutputLines := OrderedCollection new.
	expectedReportOutputLines 
		add: 'Extracción por 100 * pesos';
		add: 'Balance = -100 * pesos'.
		
	self assert: expectedReportOutputLines equals: anAccountSummaryReport output.! !


!ReportTest methodsFor: 'tests - TransferNet' stamp: 'PT 11/18/2022 17:18:40'!
test07TNReceptiveAccount

	| anAccount anAccountTransferNet |
	
	anAccount := ReceptiveAccount new.
	anAccountTransferNet := AccountTransferNetReport for: anAccount.
	
	self assert: 0 * peso equals: anAccountTransferNet output.! !

!ReportTest methodsFor: 'tests - TransferNet' stamp: 'PT 11/18/2022 17:08:20'!
test08TNReceptiveAccountWithDepositAndWithdraw

	| anAccount anAccountTransferNet |
	
	anAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: anAccount.
	Withdraw register: 50 * peso on: anAccount.
	
	anAccountTransferNet := AccountTransferNetReport for: anAccount.
	
	
	self assert: 0 * peso equals: anAccountTransferNet output.! !

!ReportTest methodsFor: 'tests - TransferNet' stamp: 'PT 11/18/2022 17:08:36'!
test09TNReceptiveAccountWithTransaction

	| anAccount anAuxiliaryAccount anAccountTransferNet |
	
	anAccount := ReceptiveAccount new.
	anAuxiliaryAccount := ReceptiveAccount new.
	
	Transfer amount: 100 * peso from: anAuxiliaryAccount to: anAccount.
	
	anAccountTransferNet := AccountTransferNetReport for: anAccount.
	
	
	self assert: 100 * peso equals: anAccountTransferNet output.! !

!ReportTest methodsFor: 'tests - TransferNet' stamp: 'PT 11/18/2022 17:08:58'!
test10TNReceptiveAccountWithTransactionAndDeposit

	| anAccount anAuxiliaryAccount anAccountTransferNet |
	
	anAccount := ReceptiveAccount new.
	anAuxiliaryAccount := ReceptiveAccount new.
	
	Transfer amount: 100 * peso from: anAuxiliaryAccount to: anAccount.
	Deposit register: 50 * peso on: anAccount.
	
	anAccountTransferNet := AccountTransferNetReport for: anAccount.
	
	
	self assert: 100 * peso equals: anAccountTransferNet output.! !

!ReportTest methodsFor: 'tests - TransferNet' stamp: 'PT 11/18/2022 17:10:06'!
test11TNReceptiveAccountWithMultipleDepositTransactions

	| anAccount anAuxiliaryAccount anAccountTransferNet |
	
	anAccount := ReceptiveAccount new.
	anAuxiliaryAccount := ReceptiveAccount new.
	
	Transfer amount: 100 * peso from: anAuxiliaryAccount to: anAccount.
	Transfer amount: 50 * peso from: anAuxiliaryAccount to: anAccount.
	
	anAccountTransferNet := AccountTransferNetReport for: anAccount.
	
	
	self assert: 150 * peso equals: anAccountTransferNet output.! !

!ReportTest methodsFor: 'tests - TransferNet' stamp: 'PT 11/18/2022 17:10:30'!
test12TNReceptiveAccountWithDepositAndWithdrawTransactions

	| anAccount anAuxiliaryAccount anAccountTransferNet |
	
	anAccount := ReceptiveAccount new.
	anAuxiliaryAccount := ReceptiveAccount new.
	
	Transfer amount: 100 * peso from: anAuxiliaryAccount to: anAccount.
	Transfer amount: 50 * peso from: anAccount to: anAuxiliaryAccount.
	
	anAccountTransferNet := AccountTransferNetReport for: anAccount.
	
	
	self assert: 50 * peso equals: anAccountTransferNet output.! !

!ReportTest methodsFor: 'tests - TransferNet' stamp: 'PT 11/18/2022 17:11:00'!
test13TNEmtpyPortfolio

	| aPortfolio anAccountTransferNet |
	
	aPortfolio := Portfolio new.
	anAccountTransferNet := AccountTransferNetReport for: aPortfolio .
	
	self assert: 0 * peso equals: anAccountTransferNet output.! !

!ReportTest methodsFor: 'tests - TransferNet' stamp: 'PT 11/18/2022 17:11:27'!
test14TNPortfolioWithEmptyReceptiveAccount

	| aPortfolio aReceptiveAccount anAccountTransferNet |
	
	aReceptiveAccount := ReceptiveAccount new.
	aPortfolio := Portfolio with: aReceptiveAccount.
	anAccountTransferNet := AccountTransferNetReport for: aPortfolio .
	
	self assert: 0 * peso equals: anAccountTransferNet output.! !

!ReportTest methodsFor: 'tests - TransferNet' stamp: 'PT 11/18/2022 17:11:48'!
test15TNPortfolioWithNotEmptyReceptiveAccount

	| aPortfolio aReceptiveAccount anAuxiliaryAccount anAccountTransferNet |
	
	aReceptiveAccount := ReceptiveAccount new.
	anAuxiliaryAccount := ReceptiveAccount new.
	Transfer amount: 100 * peso from: anAuxiliaryAccount to: aReceptiveAccount.
	aPortfolio := Portfolio with: aReceptiveAccount.
	anAccountTransferNet := AccountTransferNetReport for: aPortfolio .
	
	self assert: 100 * peso equals: anAccountTransferNet output.! !

!ReportTest methodsFor: 'tests - TransferNet' stamp: 'PT 11/18/2022 17:12:10'!
test16TNPortfolioWithPortfolioWithEmtpyReceptiveAccount

	| parentPortfolio childPortfolio anAccountTransferNet |
	
	childPortfolio := Portfolio new.
	parentPortfolio := Portfolio with: childPortfolio .
	anAccountTransferNet := AccountTransferNetReport for: parentPortfolio .
	
	self assert: 0 * peso equals: anAccountTransferNet output.! !

!ReportTest methodsFor: 'tests - TransferNet' stamp: 'PT 11/18/2022 17:12:22'!
test17TNPortfolioWithPortfolioWithNotEmtpyReceptiveAccount

	| parentPortfolio childPortfolio aReceptiveAccount anAuxiliaryAccount anAccountTransferNet |
	
	aReceptiveAccount := ReceptiveAccount new.
	anAuxiliaryAccount := ReceptiveAccount new.
	Transfer amount: 100 * peso from: anAuxiliaryAccount to: aReceptiveAccount.
	childPortfolio := Portfolio with: aReceptiveAccount.
	parentPortfolio := Portfolio with: childPortfolio.
	anAccountTransferNet := AccountTransferNetReport for: parentPortfolio .
	
	self assert: 100 * peso equals: anAccountTransferNet output.! !


!ReportTest methodsFor: 'tests - PortfolioTreePrinter' stamp: 'PT 11/18/2022 17:14:07'!
test18PTPCannotInstantiateWithReceptiveAccount

	| aReceptiveAccount |

	aReceptiveAccount := ReceptiveAccount named: 'Account'.
	
	self
		should: [ PortfolioTreePrinter for: aReceptiveAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: PortfolioTreePrinter cannotInstantiateWithReceptiveAccountErrorDescription equals: anError messageText.
		]! !

!ReportTest methodsFor: 'tests - PortfolioTreePrinter' stamp: 'PT 11/18/2022 17:18:55'!
test19PTPPortfolio

	| expectedOutputLines aPortfolio aPortfolioTreePrinter |
	
	aPortfolio := Portfolio named: 'Portafolio'.
	aPortfolioTreePrinter := PortfolioTreePrinter for: aPortfolio.
	expectedOutputLines := OrderedCollection new.
	expectedOutputLines
		add: 'Portafolio'.
		
	self assert: expectedOutputLines equals: aPortfolioTreePrinter output.! !

!ReportTest methodsFor: 'tests - PortfolioTreePrinter' stamp: 'PT 11/18/2022 17:18:58'!
test20PTPPortfolioWithPortfolio

	| expectedOutputLines parentPortfolio sonPortfolio aPortfolioTreePrinter |
	
	sonPortfolio := Portfolio named: 'Portafolio Hijo'.
	parentPortfolio := Portfolio named: 'Portafolio Padre' with: sonPortfolio .
	aPortfolioTreePrinter := PortfolioTreePrinter for: parentPortfolio.
	expectedOutputLines := OrderedCollection new.
	expectedOutputLines
		add: 'Portafolio Padre';
		add: '   Portafolio Hijo'.
	
	self assert: expectedOutputLines equals: aPortfolioTreePrinter output.! !

!ReportTest methodsFor: 'tests - PortfolioTreePrinter' stamp: 'PT 11/18/2022 17:19:06'!
test21PTPPortfolioWithPortfolioWithPortFolio

	| expectedOutputLines parentPortfolio sonPortfolio greatsonPortfolio aPortfolioTreePrinter |
	
	greatsonPortfolio := Portfolio named: 'Portafolio Nieto'.
	sonPortfolio := Portfolio named: 'Portafolio Hijo' with: greatsonPortfolio.
	parentPortfolio := Portfolio named: 'Portafolio Padre' with: sonPortfolio .
	aPortfolioTreePrinter := PortfolioTreePrinter for: parentPortfolio.
	expectedOutputLines := OrderedCollection new.
	expectedOutputLines
		add: 'Portafolio Padre';
		add: '   Portafolio Hijo';
		add: '      Portafolio Nieto'.
	
	self assert: expectedOutputLines equals: aPortfolioTreePrinter output.! !

!ReportTest methodsFor: 'tests - PortfolioTreePrinter' stamp: 'PT 11/18/2022 17:19:11'!
test22PTPPortfolioWithTwoPortfolios

	| expectedOutputLines parentPortfolio sonPortfolio1 sonPortfolio2 aPortfolioTreePrinter |
	
	sonPortfolio1 := Portfolio named: 'Portafolio Hijo 1'.
	sonPortfolio2 := Portfolio named: 'Portafolio Hijo 2'.
	parentPortfolio := Portfolio named: 'Portafolio Padre' with: sonPortfolio1 with: sonPortfolio2.
	aPortfolioTreePrinter := PortfolioTreePrinter for: parentPortfolio.
	expectedOutputLines := OrderedCollection new.
	expectedOutputLines
		add: 'Portafolio Padre';
		add: '   Portafolio Hijo 1';
		add: '   Portafolio Hijo 2'.
	
	self assert: expectedOutputLines equals: aPortfolioTreePrinter output.! !

!ReportTest methodsFor: 'tests - PortfolioTreePrinter' stamp: 'PT 11/18/2022 17:19:16'!
test23PTPPortfolioWithReceptiveAccount

	| expectedOutputLines aPortfolio aReceptiveAccount aPortfolioTreePrinter |
	
	aReceptiveAccount := ReceptiveAccount named: 'Cuenta Corriente'.
	aPortfolio := Portfolio named: 'Portafolio' with: aReceptiveAccount.
	aPortfolioTreePrinter := PortfolioTreePrinter for: aPortfolio.
	expectedOutputLines := OrderedCollection new.
	expectedOutputLines
		add: 'Portafolio';
		add: '   Cuenta Corriente'.
	
	self assert: expectedOutputLines equals: aPortfolioTreePrinter output.! !

!ReportTest methodsFor: 'tests - PortfolioTreePrinter' stamp: 'PT 11/18/2022 17:19:22'!
test24PTPPortfolioWithTwoReceptiveAccounts

	| expectedOutputLines aPortfolio aReceptiveAccount1 aReceptiveAccount2 aPortfolioTreePrinter |
	
	aReceptiveAccount1 := ReceptiveAccount named: 'Cuenta Corriente 1'.
	aReceptiveAccount2 := ReceptiveAccount named: 'Cuenta Corriente 2'.
	aPortfolio := Portfolio named: 'Portafolio' with: aReceptiveAccount1 with: aReceptiveAccount2.
	aPortfolioTreePrinter := PortfolioTreePrinter for: aPortfolio.
	expectedOutputLines := OrderedCollection new.
	expectedOutputLines
		add: 'Portafolio';
		add: '   Cuenta Corriente 1';
		add: '   Cuenta Corriente 2'.
	
	self assert: expectedOutputLines equals: aPortfolioTreePrinter output.! !

!ReportTest methodsFor: 'tests - PortfolioTreePrinter' stamp: 'PT 11/18/2022 17:19:30'!
test25PTPortfolioWithReceptiveAccountAndAnotherPortfolioWithAnotherReceptiveAccount

	| expectedOutputLines parentPortfolio childPortafolio aReceptiveAccount1 aReceptiveAccount2 aPortfolioTreePrinter |
	
	aReceptiveAccount1 := ReceptiveAccount named: 'Cuenta Corriente 1'.
	aReceptiveAccount2 := ReceptiveAccount named: 'Cuenta Corriente 2'.
	childPortafolio := Portfolio named: 'Portafolio hijo' with: aReceptiveAccount2.
	parentPortfolio := Portfolio named: 'Portafolio padre' with: aReceptiveAccount1 with: childPortafolio.
	aPortfolioTreePrinter := PortfolioTreePrinter for: parentPortfolio.
	expectedOutputLines := OrderedCollection new.
	expectedOutputLines
		add: 'Portafolio padre';
		add: '   Cuenta Corriente 1';
		add: '   Portafolio hijo';
		add: '      Cuenta Corriente 2'.
	
	self assert: expectedOutputLines equals: aPortfolioTreePrinter output.! !

!ReportTest methodsFor: 'tests - PortfolioTreePrinter' stamp: 'PT 11/18/2022 17:18:32'!
test26PTPPortfolioWithPortfolioWithReceptiveAccountAndAnotherReceptiveAccountInParent

	| expectedOutputLines parentPortfolio childPortafolio aReceptiveAccount1 aReceptiveAccount2 aPortfolioTreePrinter |
	
	aReceptiveAccount1 := ReceptiveAccount named: 'Cuenta Corriente 1'.
	aReceptiveAccount2 := ReceptiveAccount named: 'Cuenta Corriente 2'.
	childPortafolio := Portfolio named: 'Portafolio hijo' with: aReceptiveAccount2.
	parentPortfolio := Portfolio named: 'Portafolio padre' with: childPortafolio with: aReceptiveAccount1.
	aPortfolioTreePrinter := PortfolioTreePrinter for: parentPortfolio.
	expectedOutputLines := OrderedCollection new.
	expectedOutputLines
		add: 'Portafolio padre';
		add: '   Portafolio hijo';
		add: '      Cuenta Corriente 2';
		add: '   Cuenta Corriente 1'.
	
	self assert: expectedOutputLines equals: aPortfolioTreePrinter output.! !


!ReportTest methodsFor: 'tests - PortfolioDetailedTreePrinter' stamp: 'PT 11/18/2022 17:19:55'!
test27PDTPCannotInstantiateWithReceptiveAccount

	| aReceptiveAccount |

	aReceptiveAccount := ReceptiveAccount named: 'Account'.
	
	self
		should: [ PortfolioDetailedTreePrinter for: aReceptiveAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: PortfolioDetailedTreePrinter cannotInstantiateWithReceptiveAccountErrorDescription equals: anError messageText.
		]! !

!ReportTest methodsFor: 'tests - PortfolioDetailedTreePrinter' stamp: 'PT 11/18/2022 17:20:09'!
test28PDTPEmtpyPortfolio

	| expectedOutputLines aPortfolio aPortfolioDetailedTreePrinter |
	
	aPortfolio := Portfolio named: 'Portafolio'.
	aPortfolioDetailedTreePrinter := PortfolioDetailedTreePrinter for: aPortfolio.
	expectedOutputLines := OrderedCollection new.
	expectedOutputLines
		add: 'Portafolio';
		add: '   Balance = 0 * pesos'.
	
	self assert: expectedOutputLines equals: aPortfolioDetailedTreePrinter output.! !

!ReportTest methodsFor: 'tests - PortfolioDetailedTreePrinter' stamp: 'PT 11/18/2022 17:20:24'!
test29PDTPortfolioWithEmptyPortfolio

	| expectedOutputLines parentPortfolio sonPortfolio aPortfolioDetailedTreePrinter |
	
	sonPortfolio := Portfolio named: 'Portafolio Hijo'.
	parentPortfolio := Portfolio named: 'Portafolio Padre' with: sonPortfolio .
	aPortfolioDetailedTreePrinter := PortfolioDetailedTreePrinter for: parentPortfolio.
	expectedOutputLines := OrderedCollection new.
	expectedOutputLines
		add: 'Portafolio Padre';
		add: '   Portafolio Hijo';
		add: '      Balance = 0 * pesos';
		add: '   Balance = 0 * pesos'.	
	
	self assert: expectedOutputLines equals: aPortfolioDetailedTreePrinter output.! !

!ReportTest methodsFor: 'tests - PortfolioDetailedTreePrinter' stamp: 'PT 11/18/2022 17:20:42'!
test30PDTPPortfolioWithPortfolioWithEmptyPorftolio

	| expectedOutputLines parentPortfolio sonPortfolio greatsonPortfolio aPortfolioDetailedTreePrinter |
	
	greatsonPortfolio := Portfolio named: 'Portafolio Nieto'.
	sonPortfolio := Portfolio named: 'Portafolio Hijo' with: greatsonPortfolio.
	parentPortfolio := Portfolio named: 'Portafolio Padre' with: sonPortfolio .
	aPortfolioDetailedTreePrinter := PortfolioDetailedTreePrinter for: parentPortfolio.
	expectedOutputLines := OrderedCollection new.
	expectedOutputLines
		add: 'Portafolio Padre';
		add: '   Portafolio Hijo';
		add: '      Portafolio Nieto';
		add: '         Balance = 0 * pesos';
		add: '      Balance = 0 * pesos';
		add: '   Balance = 0 * pesos'.
	
	self assert: expectedOutputLines equals: aPortfolioDetailedTreePrinter output.! !

!ReportTest methodsFor: 'tests - PortfolioDetailedTreePrinter' stamp: 'PT 11/18/2022 17:20:58'!
test31PDTPPortfolioWithTwoEmtpyPortfolios

	| expectedOutputLines parentPortfolio sonPortfolio1 sonPortfolio2 aPortfolioDetailedTreePrinter |
	
	sonPortfolio1 := Portfolio named: 'Portafolio Hijo 1'.
	sonPortfolio2 := Portfolio named: 'Portafolio Hijo 2'.
	parentPortfolio := Portfolio named: 'Portafolio Padre' with: sonPortfolio1 with: sonPortfolio2.
	aPortfolioDetailedTreePrinter := PortfolioDetailedTreePrinter for: parentPortfolio.
	expectedOutputLines := OrderedCollection new.
	expectedOutputLines
		add: 'Portafolio Padre';
		add: '   Portafolio Hijo 1';
		add: '      Balance = 0 * pesos';
		add: '   Portafolio Hijo 2';
		add: '      Balance = 0 * pesos';
		add: '   Balance = 0 * pesos'.
	
	self assert: expectedOutputLines equals: aPortfolioDetailedTreePrinter output.! !

!ReportTest methodsFor: 'tests - PortfolioDetailedTreePrinter' stamp: 'PT 11/18/2022 17:21:19'!
test32PDTPPortfolioWithReceptiveAccount

	| expectedOutputLines aPortfolio aReceptiveAccount aPortfolioDetailedTreePrinter |
	
	aReceptiveAccount := ReceptiveAccount named: 'Cuenta Corriente'.
	aPortfolio := Portfolio named: 'Portafolio' with: aReceptiveAccount.
	aPortfolioDetailedTreePrinter := PortfolioDetailedTreePrinter for: aPortfolio.
	expectedOutputLines := OrderedCollection new.
	expectedOutputLines
		add: 'Portafolio';
		add: '   Cuenta Corriente';
		add: '      Balance = 0 * pesos';
		add: '   Balance = 0 * pesos'.
	
	self assert: expectedOutputLines equals: aPortfolioDetailedTreePrinter output.! !

!ReportTest methodsFor: 'tests - PortfolioDetailedTreePrinter' stamp: 'PT 11/18/2022 17:21:39'!
test33PDTPPrtfolioWithReceptiveAccountWithTwoTransactions

	| expectedOutputLines aPortfolio aReceptiveAccount aPortfolioDetailedTreePrinter |
	
	aReceptiveAccount := ReceptiveAccount named: 'Cuenta Corriente'.
	aPortfolio := Portfolio named: 'Portafolio' with: aReceptiveAccount.
	Deposit register: 100 * peso on: aReceptiveAccount.
	aPortfolioDetailedTreePrinter := PortfolioDetailedTreePrinter for: aPortfolio.
	expectedOutputLines := OrderedCollection new.
	expectedOutputLines
		add: 'Portafolio';
		add: '   Cuenta Corriente';
		add: '      Depósito por 100 * pesos';
		add: '      Balance = 100 * pesos';
		add: '   Balance = 100 * pesos'.
	
	self assert: expectedOutputLines equals: aPortfolioDetailedTreePrinter output.! !

!ReportTest methodsFor: 'tests - PortfolioDetailedTreePrinter' stamp: 'PT 11/18/2022 17:22:07'!
test34PDTPPrtfolioWithReceptiveAccountWithTwoTransactionsAndNegativeBalance

	| expectedOutputLines aPortfolio aReceptiveAccount aPortfolioDetailedTreePrinter |
	
	aReceptiveAccount := ReceptiveAccount named: 'Cuenta Corriente'.
	aPortfolio := Portfolio named: 'Portafolio' with: aReceptiveAccount.
	Withdraw register: 100 * peso on: aReceptiveAccount.
	aPortfolioDetailedTreePrinter := PortfolioDetailedTreePrinter for: aPortfolio.
	expectedOutputLines := OrderedCollection new.
	expectedOutputLines
		add: 'Portafolio';
		add: '   Cuenta Corriente';
		add: '      Extracción por 100 * pesos';
		add: '      Balance = -100 * pesos';
		add: '   Balance = -100 * pesos'.
	
	self assert: expectedOutputLines equals: aPortfolioDetailedTreePrinter output.! !

!ReportTest methodsFor: 'tests - PortfolioDetailedTreePrinter' stamp: 'PT 11/18/2022 17:22:46'!
test35PDTPPortfolioWithReceptiveAccountWithTransactionsAndDepositLeg

	| expectedOutputLines aPortfolio aReceptiveAccount anAuxiliaryReceptiveAccount aPortfolioDetailedTreePrinter |
	
	aReceptiveAccount := ReceptiveAccount named: 'Cuenta Corriente'.
	anAuxiliaryReceptiveAccount := ReceptiveAccount new.
	aPortfolio := Portfolio named: 'Portafolio' with: aReceptiveAccount.
	Transfer amount: 100 * peso from: anAuxiliaryReceptiveAccount to: aReceptiveAccount.
	aPortfolioDetailedTreePrinter := PortfolioDetailedTreePrinter for: aPortfolio.
	expectedOutputLines := OrderedCollection new.
	expectedOutputLines
		add: 'Portafolio';
		add: '   Cuenta Corriente';
		add: '      Entrada por transferencia de 100 * pesos';
		add: '      Balance = 100 * pesos';
		add: '   Balance = 100 * pesos'.
	
	self assert: expectedOutputLines equals: aPortfolioDetailedTreePrinter output.! !

!ReportTest methodsFor: 'tests - PortfolioDetailedTreePrinter' stamp: 'PT 11/18/2022 17:23:00'!
test36PDTPPortfolioWithReceptiveAccountWithTransactionsAndWithdrawLeg

	| expectedOutputLines aPortfolio aReceptiveAccount anAuxiliaryReceptiveAccount aPortfolioDetailedTreePrinter |
	
	aReceptiveAccount := ReceptiveAccount named: 'Cuenta Corriente'.
	anAuxiliaryReceptiveAccount := ReceptiveAccount new.
	aPortfolio := Portfolio named: 'Portafolio' with: aReceptiveAccount.
	Transfer amount: 100 * peso from: aReceptiveAccount to: anAuxiliaryReceptiveAccount.
	aPortfolioDetailedTreePrinter := PortfolioDetailedTreePrinter for: aPortfolio.
	expectedOutputLines := OrderedCollection new.
	expectedOutputLines
		add: 'Portafolio';
		add: '   Cuenta Corriente';
		add: '      Salida por transferencia de 100 * pesos';
		add: '      Balance = -100 * pesos';
		add: '   Balance = -100 * pesos'.
	
	self assert: expectedOutputLines equals: aPortfolioDetailedTreePrinter output.! !

!ReportTest methodsFor: 'tests - PortfolioDetailedTreePrinter' stamp: 'PT 11/18/2022 17:23:09'!
test37PDTPComplexExample

	| aPortfolioDetailedTreePrinter angiesAccount childrenPortfolio expectedOutputLines familyPortfolio johnsAccount myAccount |
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount. 
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	
	Deposit register: 2 * peso on: myAccount.
	Withdraw register: 3 * peso on: myAccount.
	Deposit register: 5 * peso on: johnsAccount.
	Withdraw register: 8 * peso on: johnsAccount.
	Transfer amount: 12 * peso from: angiesAccount to: johnsAccount.
	
	aPortfolioDetailedTreePrinter := PortfolioDetailedTreePrinter for: familyPortfolio.
	
	expectedOutputLines := OrderedCollection new.
	expectedOutputLines
		add: 'Portfolio de la familia';
		add: '   Cuenta mia';
		add: '      Depósito por 2 * pesos';
		add: '      Extracción por 3 * pesos';
		add: '      Balance = -1 * peso';
		add: '   Portfolio de hijos';
		add: '      Cuenta de Juan';
		add: '         Depósito por 5 * pesos';
		add: '         Extracción por 8 * pesos';
		add: '         Entrada por transferencia de 12 * pesos';
		add: '         Balance = 9 * pesos';
		add: '      Cuenta de Angeles';
		add: '         Salida por transferencia de 12 * pesos';
		add: '         Balance = -12 * pesos';
		add: '      Balance = -3 * pesos';
		add: '   Balance = -4 * pesos'.
	
	self assert: expectedOutputLines equals: aPortfolioDetailedTreePrinter output.! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'PT 11/18/2022 16:18:36'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer output.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!Account methodsFor: 'enumerating' stamp: 'PT 11/17/2022 16:18:03'!
contentDoOperationOfReport: aReport.

	self content do: [ :anAccountOrTransaction | anAccountOrTransaction runOperationOfReport: aReport ].! !


!Account methodsFor: 'initialize' stamp: 'PT 11/16/2022 15:12:18'!
initializeNamed: aName 
	
	name := aName.! !


!Account methodsFor: 'accessing' stamp: 'PT 11/17/2022 12:16:03'!
content

	self subclassResponsibility ! !

!Account methodsFor: 'accessing' stamp: 'PT 11/16/2022 16:03:47'!
name
	
	^name! !


!Account methodsFor: 'report operations	 DD' stamp: 'PT 11/17/2022 12:15:28'!
runOperationOfReport: aReport
	
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'ServiciosFinancieros-Solucion'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'instance creation' stamp: 'PT 11/16/2022 15:12:01'!
named: aName 
	
	^self new initializeNamed: aName! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'PT 11/15/2022 17:00:34'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 * peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'report operations	 DD' stamp: 'PT 11/17/2022 12:12:14'!
runOperationOfReport: aReport

	aReport runOperationForPorfolio: self.! !


!Portfolio methodsFor: 'accessing' stamp: 'PT 11/17/2022 11:54:04'!
content

	^accounts! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'instance creation' stamp: 'PT 11/16/2022 15:18:43'!
named: aString with: aReceptiveAccount 
	
	| aPortfolio |
	
	aPortfolio := 	self with: aReceptiveAccount.
	aPortfolio initializeNamed: aString.
	^aPortfolio.! !

!Portfolio class methodsFor: 'instance creation' stamp: 'PT 11/16/2022 16:11:42'!
named: aString with: anAccount with: anotherAccount
	
	| aPortfolio |
	
	aPortfolio := 	self with: anAccount with: anotherAccount.
	aPortfolio initializeNamed: aString.
	^aPortfolio. ! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'PT 11/15/2022 17:00:26'!
balance

	^transactions 
		inject: (0 * peso)
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'report operations DD' stamp: 'PT 11/17/2022 12:13:27'!
runOperationOfReport: aReport
	
	aReport runOperationForReceptiveAccount: self! !


!ReceptiveAccount methodsFor: 'accessing' stamp: 'PT 11/17/2022 12:02:23'!
content

	^transactions ! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'report operations	 DD' stamp: 'PT 11/17/2022 16:11:05'!
runOperationOfReport: aReport

	self subclassResponsibility.! !


!AccountTransaction methodsFor: 'value' stamp: 'PT 11/18/2022 16:18:36'!
output 

	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'report operations	 DD' stamp: 'PT 11/17/2022 12:10:59'!
runOperationOfReport: aReport

	^aReport runOperationForDeposit: self.! !


!Deposit methodsFor: 'value' stamp: 'PT 11/18/2022 16:18:36'!
output

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !


!TransferLeg methodsFor: 'report operations	 DD' stamp: 'PT 11/17/2022 12:11:12'!
runOperationOfReport: aReport

	self subclassResponsibility ! !


!TransferLeg methodsFor: 'value' stamp: 'PT 11/18/2022 16:18:36'!
output

	^transfer output! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'PT 11/18/2022 16:18:36'!
affectBalance: aBalance

	^aBalance + self output! !


!TransferDepositLeg methodsFor: 'report operations	 DD' stamp: 'PT 11/17/2022 12:11:17'!
runOperationOfReport: aReport

	^aReport runOperationForDepositLeg: self.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'PT 11/18/2022 16:18:36'!
affectBalance: aBalance

	^aBalance - self output! !


!TransferWithdrawLeg methodsFor: 'report operations	 DD' stamp: 'PT 11/17/2022 12:11:30'!
runOperationOfReport: aReport

	^aReport runOperationForWithdrawLeg: self.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'report operations	 DD' stamp: 'PT 11/17/2022 12:11:35'!
runOperationOfReport: aReport

	^aReport runOperationForWithdraw: self.! !


!Withdraw methodsFor: 'value' stamp: 'PT 11/18/2022 16:18:36'!
output

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Report category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Report
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Report methodsFor: 'initialization' stamp: 'PT 11/16/2022 15:03:16'!
initializeFor: anAccount 
	
	account := anAccount.! !


!Report methodsFor: 'report operations	 DD' stamp: 'PT 11/18/2022 16:43:44'!
runOperationForPorfolio: aPortfolio

	self subclassResponsibility ! !

!Report methodsFor: 'report operations	 DD' stamp: 'PT 11/18/2022 16:43:38'!
runOperationForReceptiveAccount: aReceptiveAccount

	self subclassResponsibility ! !


!Report methodsFor: 'output' stamp: 'PT 11/18/2022 16:33:33'!
output

	self setup.
	account runOperationOfReport: self.
	^self answerOutput.! !


!Report methodsFor: 'output - private' stamp: 'PT 11/18/2022 16:37:33'!
answerOutput

	self subclassResponsibility.! !

!Report methodsFor: 'output - private' stamp: 'PT 11/18/2022 16:37:38'!
setup

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Report class' category: 'ServiciosFinancieros-Solucion'!
Report class
	instanceVariableNames: ''!

!Report class methodsFor: 'instance creation' stamp: 'PT 11/16/2022 15:39:36'!
for: anAccount

	self subclassResponsibility! !


!classDefinition: #AccountSummaryReport category: 'ServiciosFinancieros-Solucion'!
Report subclass: #AccountSummaryReport
	instanceVariableNames: 'lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummaryReport methodsFor: 'output - private' stamp: 'PT 11/18/2022 17:06:46'!
answerOutput

	lines addLast: 'Balance = ' , account balance asString.
	^lines.! !

!AccountSummaryReport methodsFor: 'output - private' stamp: 'PT 11/18/2022 16:24:54'!
setup

	lines := OrderedCollection new.! !


!AccountSummaryReport methodsFor: 'report operations	 DD' stamp: 'PT 11/18/2022 16:18:36'!
runOperationForDeposit: aDeposit

	lines addLast: ( 'Depósito por ' , aDeposit output asString )! !

!AccountSummaryReport methodsFor: 'report operations	 DD' stamp: 'PT 11/18/2022 16:18:36'!
runOperationForDepositLeg: aDepositLeg

	lines addLast: ( 'Entrada por transferencia de ' , aDepositLeg output asString )! !

!AccountSummaryReport methodsFor: 'report operations	 DD' stamp: 'PT 11/18/2022 17:06:33'!
runOperationForPorfolio: aPortfolio

	aPortfolio contentDoOperationOfReport: self.! !

!AccountSummaryReport methodsFor: 'report operations	 DD' stamp: 'PT 11/18/2022 17:06:39'!
runOperationForReceptiveAccount: aReceptiveAccount

	aReceptiveAccount contentDoOperationOfReport: self.! !

!AccountSummaryReport methodsFor: 'report operations	 DD' stamp: 'PT 11/18/2022 16:18:36'!
runOperationForWithdraw: aWithdraw

	lines addLast: ( 'Extracción por ' , aWithdraw output asString )! !

!AccountSummaryReport methodsFor: 'report operations	 DD' stamp: 'PT 11/18/2022 16:18:36'!
runOperationForWithdrawLeg: aWithdrawLeg

	lines addLast: ( 'Salida por transferencia de ' , aWithdrawLeg output asString )! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummaryReport class' category: 'ServiciosFinancieros-Solucion'!
AccountSummaryReport class
	instanceVariableNames: ''!

!AccountSummaryReport class methodsFor: 'instance creation' stamp: 'PT 11/16/2022 15:39:23'!
for: anAccount 
	
	^self new initializeFor: anAccount ! !


!classDefinition: #AccountTransferNetReport category: 'ServiciosFinancieros-Solucion'!
Report subclass: #AccountTransferNetReport
	instanceVariableNames: 'balance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransferNetReport methodsFor: 'output - private' stamp: 'PT 11/18/2022 16:31:10'!
answerOutput

	^balance.! !

!AccountTransferNetReport methodsFor: 'output - private' stamp: 'PT 11/18/2022 16:22:16'!
setup

	balance := 0 * peso.! !


!AccountTransferNetReport methodsFor: 'report operations	 DD' stamp: 'PT 11/17/2022 11:47:44'!
runOperationForDeposit: aDeposit! !

!AccountTransferNetReport methodsFor: 'report operations	 DD' stamp: 'PT 11/17/2022 11:47:53'!
runOperationForDepositLeg: aDepositLeg

	balance := aDepositLeg affectBalance: balance! !

!AccountTransferNetReport methodsFor: 'report operations	 DD' stamp: 'PT 11/17/2022 16:18:03'!
runOperationForPorfolio: aPortfolio

	aPortfolio contentDoOperationOfReport: self.! !

!AccountTransferNetReport methodsFor: 'report operations	 DD' stamp: 'PT 11/17/2022 16:18:03'!
runOperationForReceptiveAccount: aReceptiveAccount

	aReceptiveAccount contentDoOperationOfReport: self.! !

!AccountTransferNetReport methodsFor: 'report operations	 DD' stamp: 'PT 11/17/2022 11:48:01'!
runOperationForWithdraw: aWithdraw! !

!AccountTransferNetReport methodsFor: 'report operations	 DD' stamp: 'PT 11/17/2022 11:48:08'!
runOperationForWithdrawLeg: aWithdrawLeg

	balance := aWithdrawLeg affectBalance: balance! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransferNetReport class' category: 'ServiciosFinancieros-Solucion'!
AccountTransferNetReport class
	instanceVariableNames: ''!

!AccountTransferNetReport class methodsFor: 'instance creation' stamp: 'PT 11/16/2022 15:39:23'!
for: anAccount 
	
	^self new initializeFor: anAccount ! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-Solucion'!
Report subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: 'lines depth'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinter methodsFor: 'output - private' stamp: 'PT 11/17/2022 11:11:58'!
addLine: aLine

	lines addLast: ( self indentation , aLine )! !

!PortfolioDetailedTreePrinter methodsFor: 'output - private' stamp: 'PT 11/18/2022 16:56:08'!
answerOutput

	^lines.! !

!PortfolioDetailedTreePrinter methodsFor: 'output - private' stamp: 'PT 11/17/2022 11:13:16'!
indentation
	
	| indentation spacing |
	
	spacing := '   '.
	indentation := ''.
	1 to: depth do: [ :i |
		indentation := indentation , spacing.
	].
	
	^indentation! !

!PortfolioDetailedTreePrinter methodsFor: 'output - private' stamp: 'PT 11/18/2022 16:25:35'!
setup

	lines := OrderedCollection new.
	depth := 0.! !


!PortfolioDetailedTreePrinter methodsFor: 'report operations	 DD' stamp: 'PT 11/18/2022 16:18:36'!
runOperationForDeposit: aDeposit

	self addLine: ( 'Depósito por ' , aDeposit output asString )! !

!PortfolioDetailedTreePrinter methodsFor: 'report operations	 DD' stamp: 'PT 11/18/2022 16:18:36'!
runOperationForDepositLeg: aDepositLeg

	self addLine: ( 'Entrada por transferencia de ' , aDepositLeg output asString )! !

!PortfolioDetailedTreePrinter methodsFor: 'report operations	 DD' stamp: 'PT 11/17/2022 16:18:03'!
runOperationForPorfolio: aPortfolio

	self addLine: ( aPortfolio name ).
	depth := depth + 1.
	aPortfolio contentDoOperationOfReport: self.
	self addLine: 'Balance = ' , aPortfolio balance asString.
	depth := depth - 1.! !

!PortfolioDetailedTreePrinter methodsFor: 'report operations	 DD' stamp: 'PT 11/18/2022 15:41:22'!
runOperationForReceptiveAccount: aReceptiveAccount

	self addLine: ( aReceptiveAccount name ).
	depth := depth + 1.
	aReceptiveAccount contentDoOperationOfReport: self.
	self addLine: 'Balance = ' , aReceptiveAccount balance asString.
	depth := depth - 1.! !

!PortfolioDetailedTreePrinter methodsFor: 'report operations	 DD' stamp: 'PT 11/18/2022 16:18:36'!
runOperationForWithdraw: aWithdraw

	self addLine: ( 'Extracción por ' , aWithdraw output asString )! !

!PortfolioDetailedTreePrinter methodsFor: 'report operations	 DD' stamp: 'PT 11/18/2022 16:18:36'!
runOperationForWithdrawLeg: aWithdrawLeg

	self addLine: ( 'Salida por transferencia de ' , aWithdrawLeg output asString )! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioDetailedTreePrinter class' category: 'ServiciosFinancieros-Solucion'!
PortfolioDetailedTreePrinter class
	instanceVariableNames: ''!

!PortfolioDetailedTreePrinter class methodsFor: 'instance creation' stamp: 'PT 11/17/2022 11:01:16'!
for: anAccount 
	
	( anAccount isKindOf: ReceptiveAccount ) ifTrue: [ self signalCannotInstantiateWithReceptiveAccountError ].
	^self new initializeFor: anAccount ! !


!PortfolioDetailedTreePrinter class methodsFor: 'errors' stamp: 'PT 11/17/2022 11:01:26'!
signalCannotInstantiateWithReceptiveAccountError
	
	self error: self cannotInstantiateWithReceptiveAccountErrorDescription.! !


!PortfolioDetailedTreePrinter class methodsFor: 'error descriptions' stamp: 'PT 11/17/2022 11:01:46'!
cannotInstantiateWithReceptiveAccountErrorDescription

	^'PortfolioTreePrinter cannot be instantiated with a ReceptiveAccount' ! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Solucion'!
Report subclass: #PortfolioTreePrinter
	instanceVariableNames: 'lines depth'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'output - private' stamp: 'PT 11/18/2022 15:36:13'!
addLine: lineContent

	lines addLast: ( self indentation , lineContent )! !

!PortfolioTreePrinter methodsFor: 'output - private' stamp: 'PT 11/18/2022 16:53:59'!
answerOutput

	^lines.! !

!PortfolioTreePrinter methodsFor: 'output - private' stamp: 'PT 11/16/2022 15:58:23'!
indentation

	| indentation spacing |
	
	spacing := '   '.
	indentation := ''.
	1 to: depth do: [ :i |
		indentation := indentation , spacing.
	].
	
	^indentation! !

!PortfolioTreePrinter methodsFor: 'output - private' stamp: 'PT 11/18/2022 16:26:02'!
setup

	lines := OrderedCollection new.
	depth := 0.! !


!PortfolioTreePrinter methodsFor: 'report operations	 DD' stamp: 'PT 11/17/2022 16:18:03'!
runOperationForPorfolio: aPortfolio

	self addLine: ( aPortfolio name ).
	depth := depth + 1.
	aPortfolio contentDoOperationOfReport: self.
	depth := depth - 1.! !

!PortfolioTreePrinter methodsFor: 'report operations	 DD' stamp: 'PT 11/16/2022 16:23:32'!
runOperationForReceptiveAccount: aReceptiveAccount

	self addLine: ( aReceptiveAccount name ).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinter class' category: 'ServiciosFinancieros-Solucion'!
PortfolioTreePrinter class
	instanceVariableNames: ''!

!PortfolioTreePrinter class methodsFor: 'error descriptions' stamp: 'PT 11/16/2022 15:37:52'!
cannotInstantiateWithReceptiveAccountErrorDescription

	^'PortfolioTreePrinter cannot be instantiated with a ReceptiveAccount' ! !


!PortfolioTreePrinter class methodsFor: 'instance creation' stamp: 'PT 11/16/2022 15:42:00'!
for: anAccount 
	
	( anAccount isKindOf: ReceptiveAccount ) ifTrue: [ self signalCannotInstantiateWithReceptiveAccountError ].
	^self new initializeFor: anAccount ! !


!PortfolioTreePrinter class methodsFor: 'errors' stamp: 'PT 11/16/2022 15:41:29'!
signalCannotInstantiateWithReceptiveAccountError
	
	self error: self cannotInstantiateWithReceptiveAccountErrorDescription.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'PT 11/18/2022 16:18:36'!
output

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
