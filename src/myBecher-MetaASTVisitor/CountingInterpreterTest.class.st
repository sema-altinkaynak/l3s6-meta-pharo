Class {
	#name : #CountingInterpreterTest,
	#superclass : #TestCase,
	#category : #'myBecher-MetaASTVisitor'
}

{ #category : #tests }
CountingInterpreterTest >> testMessageCount [	
	 "Point	>>	sideOf:	otherPoint		
	 |	side	|	
	 side	:=	(self	crossProduct:	otherPoint)	sign.	
	 ^	{	#right	.	#center	.	#left	}	at:	side	+	2"	
	 	
	 |	ast	counting	|		
	 ast	:=	RBParser	parseMethod:	(Point	>>	#sideOf:)	sourceCode.	
	 counting	:=	CountingInterpreter	new.	
	 ast	acceptVisitor:	counting.	
	 self	assert:	counting	numberOfMessages	equals:	4.
]
