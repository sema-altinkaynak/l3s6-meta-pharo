Class {
	#name : #CountingManualInterpreterTestMethod,
	#superclass : #TestCase,
	#category : #'myBecher-MetaASTVisitor'
}

{ #category : #tests }
CountingManualInterpreterTestMethod >> testMessageCount2 [	
	 "Point	>>	sideOf:	otherPoint		
	 |	side	|	
	 side	:=	(self	crossProduct:	otherPoint)	sign.	
	 ^	{	#right	.	#center	.	#left	}	at:	side	+	2			"	
	 	
	 |	ast	counting	|		
	 ast	:=	RBParser	parseMethod:	(Point	>>	#sideOf:)	sourceCode.	
	 counting	:=	CountingManualInterpreterMethod new.	
	 ast	acceptVisitor:	counting.	
	 self	assert:	counting	numberOfMethodGlobal	equals:	1.
]
