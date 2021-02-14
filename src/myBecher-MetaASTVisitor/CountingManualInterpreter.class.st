Class {
	#name : #CountingManualInterpreter,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#category : #'myBecher-MetaASTVisitor'
}

{ #category : #initialization }
CountingManualInterpreter >> initialize [	
	 super	 initialize.	
	 count	:=	0.
]

{ #category : #'as yet unclassified' }
CountingManualInterpreter >> numberOfArrayGlobal [

	^ count
]

{ #category : #visiting }
CountingManualInterpreter >> visitArrayNode:	aRBArrayNode [	
		
	count	:=	count	+	1.
	 ^	self	




]

{ #category : #visiting }
CountingManualInterpreter >> visitAssignmentNode:	anAssignmentNode [		
	 anAssignmentNode	value	acceptVisitor:	self	

]

{ #category : #visiting }
CountingManualInterpreter >> visitLiteralValueNode:	aRBLiteralValueNode [		
		 
		
	 	 ^	self




]

{ #category : #visiting }
CountingManualInterpreter >> visitMessageNode:	aRBMessageNode [	
			
	 	 	
	 	 aRBMessageNode	receiver	acceptVisitor:	self.	
	 	 aRBMessageNode	arguments	do:	[	:each	|	each	acceptVisitor:	self	]
]

{ #category : #visiting }
CountingManualInterpreter >> visitMethodNode:	aMethodNode [		
	
	 aMethodNode	statements	do:	[	:each	|	each	acceptVisitor:	self	]
]

{ #category : #visiting }
CountingManualInterpreter >> visitReturnNode: aRBReturnNode [
 
	
	^ self
]

{ #category : #visiting }
CountingManualInterpreter >> visitSelfNode:	aRBMethodNode [	
				
	 ^	self	




]

{ #category : #visiting }
CountingManualInterpreter >> visitVariableNode:	aRBVariableNode [		
			
	 ^	self	


]
