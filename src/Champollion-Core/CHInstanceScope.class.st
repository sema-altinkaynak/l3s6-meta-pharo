Class {
	#name : #CHInstanceScope,
	#superclass : #Object,
	#instVars : [
		'receiver',
		'parentScope'
	],
	#category : #'Champollion-Core'
}

{ #category : #'as yet unclassified' }
CHInstanceScope >> definedVariables [

	^ receiver class allInstVarNames 
]

{ #category : #'as yet unclassified' }
CHInstanceScope >> parentScope [

	^ parentScope
]

{ #category : #'as yet unclassified' }
CHInstanceScope >> parentScope: anObject [

	parentScope := anObject
]

{ #category : #'as yet unclassified' }
CHInstanceScope >> read: aString [

	^ receiver instVarNamed: aString
]

{ #category : #'as yet unclassified' }
CHInstanceScope >> receiver: anObject [

	receiver := anObject
]

{ #category : #'as yet unclassified' }
CHInstanceScope >> scopeDefining: aString [

	(self definedVariables includes: aString)
		ifTrue: [ ^ self ].
	^ self parentScope scopeDefining: aString
]

{ #category : #'as yet unclassified' }
CHInstanceScope >> write: aString withValue: anInteger [

	receiver instVarNamed: aString put: anInteger 
]
