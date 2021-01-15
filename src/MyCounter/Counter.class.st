"
Counter is a simple concrete class which supports incrementing and decrementig and decreementig 

Its API is :
-decrement , increment 
-count 
Its creation API is message withValue 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	count:		<Object>


    Implementation Points
"
Class {
	#name : #Counter,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#classInstVars : [
		'count'
	],
	#category : #MyCounter
}

{ #category : #accessing }
Counter class >> startingAt: anInteger [

	^ self new count: anInteger
]

{ #category : #accessing }
Counter >> count [ 

	^ count
]

{ #category : #accessing }
Counter >> count: anInteger [

	count := anInteger 
]

{ #category : #API }
Counter >> decrement [ 

	count := count - 1
]

{ #category : #accessing }
Counter >> increment [ 

	count := count + 1
]

{ #category : #initialization }
Counter >> initialize [

	super initialize.
	count := 0
]

{ #category : #printing }
Counter >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: ' withValue ' , count printString.
	aStream cr
]
