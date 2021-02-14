Class {
	#name : #CountingManualInterpreterMethod,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#category : #'myBecher-MetaASTVisitor'
}

{ #category : #initialization }
CountingManualInterpreterMethod >> initialize [
	
	 super	 initialize.	
	 count	:=	0.
]

{ #category : #'as yet unclassified' }
CountingManualInterpreterMethod >> numberOfMethodGlobal [
	^ count
]

{ #category : #initialization }
CountingManualInterpreterMethod >> visitArrayNode:	aRBArrayNode [		
			
	 ^	self

]

{ #category : #initialization }
CountingManualInterpreterMethod >> visitAssignmentNode:	anAssignmentNode [		
			
	 anAssignmentNode	value	acceptVisitor:	self	
]

{ #category : #initialization }
CountingManualInterpreterMethod >> visitLiteralValueNode:	aRBLiteralValueNode [		
			
	 	 ^	self

]

{ #category : #initialization }
CountingManualInterpreterMethod >> visitMessageNode:	aRBMessageNode [	
			
	 	 
	 	 aRBMessageNode	receiver	acceptVisitor:	self.	
	 	 aRBMessageNode	arguments	do:	[	:each	|	each	acceptVisitor:	self	]	
]

{ #category : #initialization }
CountingManualInterpreterMethod >> visitMethodNode:	aMethodNode [		
	
	 count	:=	count	+	1.	
	 aMethodNode	statements	do:	[	:each	|	each	acceptVisitor:	self	]
]

{ #category : #visiting }
CountingManualInterpreterMethod >> visitReturnNode: aRBReturnNode [ 
	^ self
]

{ #category : #initialization }
CountingManualInterpreterMethod >> visitSelfNode:	aRBMethodNode [
				
	 ^	self

]

{ #category : #initialization }
CountingManualInterpreterMethod >> visitVariableNode:	aRBVariableNode [		
			
	 ^	self	

]
