Class {
	#name : #FileNode,
	#superclass : #Object,
	#classVars : [
		'size'
	],
	#category : #VisitorExample
}

{ #category : #visiting }
FileNode >> acceptVisitor: aVisitor [

	^ aVisitor visitFileNode: self
]

{ #category : #visiting }
FileNode >> size [

	^ size
]
