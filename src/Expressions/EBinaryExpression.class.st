Class {
	#name : #EBinaryExpression,
	#superclass : #EExpression,
	#instVars : [
		'left',
		'right'
	],
	#category : #Expressions
}

{ #category : #'as yet unclassified' }
EBinaryExpression >> evaluateWith: anObject [

	^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
EBinaryExpression >> left: anExpression [ 
	left := anExpression 
]

{ #category : #'as yet unclassified' }
EBinaryExpression >> operatorString [

	^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
EBinaryExpression >> printOn: aStream [
	
	aStream nextPutAll: '( '.
	left printOn: aStream.
	aStream nextPutAll: self operatorString.
	right printOn: aStream.
	aStream nextPutAll: ' )'
]

{ #category : #accessing }
EBinaryExpression >> right: anExpression [ 
	right := anExpression 
]
