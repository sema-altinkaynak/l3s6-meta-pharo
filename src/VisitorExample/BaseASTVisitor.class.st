Class {
	#name : #BaseASTVisitor,
	#superclass : #Object,
	#category : #VisitorExample
}

{ #category : #visiting }
BaseASTVisitor >> visitLiteralValueNode: aRBLiteralValueNode [

	^ self visitNode: aRBLiteralValueNode 

]

{ #category : #visiting }
BaseASTVisitor >> visitMessageNode: aRBMessageNode [

	^ self visitNode: aRBMessageNode

]

{ #category : #visiting }
BaseASTVisitor >> visitMethodNode: aRBMethodNode [
	
	^ self visitNode: aRBMethodNode
]

{ #category : #visiting }
BaseASTVisitor >> visitSelfNode: aSelfNode [

	^ self visitNode: aSelfNode
]

{ #category : #visiting }
BaseASTVisitor >> visitSequenceNode: aRBSequenceNode [

	^ self visitNode: aRBSequenceNode
]
