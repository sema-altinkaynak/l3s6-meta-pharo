Class {
	#name : #CHMethodScope,
	#superclass : #Object,
	#instVars : [
		'receiver',
		'variables'
	],
	#category : #'Champollion-Core'
}

{ #category : #'meta-object-protocol' }
CHMethodScope >> read: aString [

	^ variables at: aString
]

{ #category : #'meta-object-protocol' }
CHMethodScope >> receiver [

	^ receiver 
]

{ #category : #'meta-object-protocol' }
CHMethodScope >> receiver: aCHInterpretable [

	receiver := aCHInterpretable 
]

{ #category : #'meta-object-protocol' }
CHMethodScope >> scopeDefining: aString [

	(variables includesKey: aString ) ifTrue: [ ^ self ].
	^ self parentScope scopeDefining: aString
]

{ #category : #'meta-object-protocol' }
CHMethodScope >> write: aString withValue: aValue [

	variables at: aString put: aValue

]
