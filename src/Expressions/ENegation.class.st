Class {
	#name : #ENegation,
	#superclass : #EExpression,
	#instVars : [
		'expression'
	],
	#category : #Expressions
}

{ #category : #'instance creation' }
ENegation class >> expression: anExpression [ 
	^ self new expression: anExpression 
]

{ #category : #'as yet unclassified' }
ENegation >> evaluateWith: anObject [
	^ (expression evaluateWith: anObject) negated
]

{ #category : #'as yet unclassified' }
ENegation >> expression: anExpression [ 
	expression := anExpression
]

{ #category : #'as yet unclassified' }
ENegation >> negated [

	^ expression 
]

{ #category : #'as yet unclassified' }
ENegation >> printOn: aStream [
	
	aStream
		nextPutAll: ' - ';
		nextPutAll: expression printString 
]
