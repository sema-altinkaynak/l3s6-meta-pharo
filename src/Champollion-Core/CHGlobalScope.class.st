Class {
	#name : #CHGlobalScope,
	#superclass : #Object,
	#instVars : [
		'globalDictionary'
	],
	#category : #'Champollion-Core'
}

{ #category : #accessing }
CHGlobalScope >> at: aKey put: aValue [

	globalDictionary at: aKey put: aValue
]

{ #category : #accessing }
CHGlobalScope >> globalDictionary: anObject [

	globalDictionary := anObject
]

{ #category : #accessing }
CHGlobalScope >> initialize [

	super initialize.
	globalDictionary := Dictionary new
]

{ #category : #accessing }
CHGlobalScope >> read: aString [

	^ globalDictionary at: aString
]

{ #category : #accessing }
CHGlobalScope >> scopeDefining: aString [

	^ self
]
