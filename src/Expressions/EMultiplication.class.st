Class {
	#name : #EMultiplication,
	#superclass : #EBinaryExpression,
	#category : #Expressions
}

{ #category : #'as yet unclassified' }
EMultiplication class >> fivesTimeThree [

	<sampleInstance>
	| ep1 ep2 |
	ep1 := EConstant constant5.
	ep2 := EConstant constant3.
	^ 	EMultiplication new left: ep1 ; right: ep2
]

{ #category : #'as yet unclassified' }
EMultiplication class >> left: anExp right: anExp2 [
	^ self new left: anExp; right: anExp2 
]

{ #category : #'as yet unclassified' }
EMultiplication >> evaluateWith: anObject [
	^ (right evaluateWith: anObject )
		* (left evaluateWith: anObject )
]

{ #category : #'as yet unclassified' }
EMultiplication >> operatorString [ 

	^ ' * '
]
