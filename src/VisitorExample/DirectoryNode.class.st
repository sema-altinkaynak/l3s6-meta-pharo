Class {
	#name : #DirectoryNode,
	#superclass : #Object,
	#classVars : [
		'children'
	],
	#category : #VisitorExample
}

{ #category : #visiting }
DirectoryNode >> acceptVisitor: aVisitor [

	^ aVisitor visitDirectoryNode: self
]

{ #category : #visiting }
DirectoryNode >> size [

	^ children sum: [ :each | each size ]
]
