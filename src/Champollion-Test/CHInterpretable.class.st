Class {
	#name : #CHInterpretable,
	#superclass : #Object,
	#instVars : [
		'x',
		'collaborator',
		'current',
		'evaluationOrder'
	],
	#category : #'Champollion-Test'
}

{ #category : #'as yet unclassified' }
CHInterpretable >> changeCollaboratorWithArgument [ 
	
	collaborator x: 500
]

{ #category : #'as yet unclassified' }
CHInterpretable >> changeCollaboratorX [ 

	collaborator store100IntoX
]

{ #category : #accessing }
CHInterpretable >> collaborator [ 

	^ collaborator 
]

{ #category : #accessing }
CHInterpretable >> collaborator: anObject [ 

	collaborator := anObject 
]

{ #category : #'as yet unclassified' }
CHInterpretable >> evaluateReceiver [ 

	evaluationOrder := self next.
	^ self
]

{ #category : #accessing }
CHInterpretable >> evaluationOrder [ 

	^ evaluationOrder 
]

{ #category : #'as yet unclassified' }
CHInterpretable >> initialize [ 

	super initialize.
	current := { "empty" }.
]

{ #category : #'as yet unclassified' }
CHInterpretable >> messageArg1: arg1 arg2: arg2 arg3: arg3 [ 

	^ { arg1 . arg2 . arg3 }
]

{ #category : #accessing }
CHInterpretable >> next [ 

	| result |
	result := current.
	current := { current }.
	^ result
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnBoolean [ 

	^ false
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnEmptyLiteralArray [ 

	^ #()
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnEvaluationOrder [ 

	^ self evaluateReceiver messageArg1: self next arg2: self next arg3: self next

]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnFloat [ 

	^ 3.14

]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnGlobal [ 

	| Global |
	Global := Object new.
	^ Global

]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnInteger [ 

	^ 5

]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnRecursiveLiteralArray [ 

	^ #(true 1 #('ahah'))

]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnSelf [ 

	^ self

]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnSuper [ 

	^ super

]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnX [ 

	^ x

]

{ #category : #'as yet unclassified' }
CHInterpretable >> sendMessageReturnX [ 

	^ self returnX

]

{ #category : #initialization }
CHInterpretable >> setXAndMessage [ 

	x := 1000.
	collaborator returnX.
	^ x
]

{ #category : #'as yet unclassified' }
CHInterpretable >> store100IntoX [ 

	^ x := 100
]

{ #category : #writing }
CHInterpretable >> writeTemporaryVariable [ 

	| temp |
	temp := 100.
	^ temp
]

{ #category : #accessing }
CHInterpretable >> x [ 

	^ x
]

{ #category : #accessing }
CHInterpretable >> x: anInteger [ 

	x := anInteger 
]
