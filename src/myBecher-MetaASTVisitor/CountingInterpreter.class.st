Class {
	#name : #CountingInterpreter,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'count'
	],
	#category : #'myBecher-MetaASTVisitor'
}

{ #category : #initialization }
CountingInterpreter >> initialize [	
	 super	initialize.	
	 count	:=	0
]

{ #category : #'as yet unclassified' }
CountingInterpreter >> numberOfMessages [

	^ count
]

{ #category : #visiting }
CountingInterpreter >> visitMessageNode:	aMessageNode [		
	 super	visitMessageNode:	aMessageNode.	
	 count	:=	count	+	1.
]
