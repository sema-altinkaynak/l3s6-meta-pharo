Class {
	#name : #EVariable,
	#superclass : #EExpression,
	#instVars : [
		'id'
	],
	#category : #Expressions
}

{ #category : #'as yet unclassified' }
EVariable >> evaluateWith: aBindingDictionnary [

	^ aBindingDictionnary at: id
]

{ #category : #'as yet unclassified' }
EVariable >> id: aSymbol [ 
	id := aSymbol 
]

{ #category : #'as yet unclassified' }
EVariable >> printOn: aStream [

	aStream nextPutAll: id asString 
]
