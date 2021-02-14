Class {
	#name : #CountingManualInterpreterTest,
	#superclass : #TestCase,
	#category : #'myBecher-MetaASTVisitor'
}

{ #category : #tests }
CountingManualInterpreterTest >> testMessageCount2 [	
	 "Point	>>	sideOf:	otherPoint		
	 |	side	|	
	 side	:=	(self	crossProduct:	otherPoint)	sign.	
	 ^	{	#right	.	#center	.	#left	}	at:	side	+	2			"	
	 	
	 |	ast	counting	|		
	 ast	:=	RBParser	parseMethod:	(Point	>>	#sideOf:)	sourceCode.	
	 counting	:=	CountingManualInterpreter	new.	
	 ast	acceptVisitor:	counting.	
	 self	assert:	counting	numberOfArrayGlobal	equals:	0.
]
