Class {
	#name : #CHInterpreter,
	#superclass : #Object,
	#instVars : [
		'stack',
		'globalScope'
	],
	#category : #'Champollion-Core'
}

{ #category : #private }
CHInterpreter >> currentScope [ 

	^ self topFrame
]

{ #category : #private }
CHInterpreter >> execute: anAST [

	^ self visitNode: anAST
]

{ #category : #private }
CHInterpreter >> execute: anAST withReceiver: anObject [

	| result |
	self pushNewFrame.
	self topFrame parentScope: (CHInstanceScope new receiver: anObject; parentScope: globalScope; yourself); yourself.
	self topFrame receiver: anObject.
	result := self visitNode: anAST.
	self popFrame.
	^ result
]

{ #category : #private }
CHInterpreter >> executeMethod: anAST withReceiver: anObject [

	^ self 
	  executeMethod: anAST 
	  withReceiver: anObject 
	  andArguments: #()
]

{ #category : #private }
CHInterpreter >> executeMethod: anAST withReceiver: anObject andArguments: aCollection [

	| result |
	self pushNewFrame.
	self topFrame parentScope: (CHInstanceScope new receiver: anObject; parentScope: globalScope; yourself); yourself.
	anAST arguments with: aCollection do: [ :arg :value | self topFrame at: arg name put: value ].
	result := self visitNode: anAST.
	self popFrame.
	^ result
]

{ #category : #private }
CHInterpreter >> globalEnvironmentAt: aSymbol put: anObject [

	globalScope at: aSymbol put: anObject
]

{ #category : #private }
CHInterpreter >> initialize [

	super initialize.
	globalScope := CHGlobalScope new.
	stack := CTStack new.
]

{ #category : #private }
CHInterpreter >> popFrame [

	stack pop
]

{ #category : #private }
CHInterpreter >> pushNewFrame [

	| newTop |
	newTop := CHMethodScope new.
	stack push: newTop.
	^ newTop
]

{ #category : #private }
CHInterpreter >> receiver [

	^ self topFrame receiver
]

{ #category : #private }
CHInterpreter >> scopeDefining: aName [

	^ self currentScope scopeDefining: aName
]

{ #category : #private }
CHInterpreter >> topFrame [ 

	^ stack top
]

{ #category : #private }
CHInterpreter >> visitArrayNode: aRBArrayNode [

	^ aRBArrayNode statements collect: [ :e | self visitNode: e ] as: Array
]

{ #category : #private }
CHInterpreter >> visitAssignmentNode: anAssignmentNode [

	| value |
	value := self visitNode: anAssignmentNode value.
	(self scopeDefining: anAssignmentNode variable name)
		write: anAssignmentNode variable name
		withValue: value.
	^ value
]

{ #category : #private }
CHInterpreter >> visitGlobalNode: aRBGlobalNode [

	^ globalScope at: aRBGlobalNode name ifAbsent: [ self error: aRBGlobalNode name, ' not found' ]
]

{ #category : #private }
CHInterpreter >> visitLiteralArrayNode: aLiteralArrayNode [

	^ aLiteralArrayNode contents collect: [ :literalNode | self visitNode: literalNode ] as: Array 
]

{ #category : #private }
CHInterpreter >> visitLiteralValueNode: aLiteralValueNode [ 

	^ aLiteralValueNode value

]

{ #category : #private }
CHInterpreter >> visitMessageNode: aMessageNode [
	
	| newReceiver method args |
	newReceiver := self visitNode: aMessageNode receiver.
	args := aMessageNode arguments collect: [ :each | self visitNode: each ].
	method := (newReceiver class compiledMethodAt: aMessageNode selector) ast.
	^ self executeMethod: method withReceiver: newReceiver andArguments: args

]

{ #category : #private }
CHInterpreter >> visitMethodNode: aMethodNode [

	^ self visitNode: aMethodNode body

]

{ #category : #private }
CHInterpreter >> visitNode: aNode [

	^ aNode acceptVisitor: self

]

{ #category : #private }
CHInterpreter >> visitReturnNode: aReturnNode [

	^ self visitNode: aReturnNode value

]

{ #category : #private }
CHInterpreter >> visitSelfNode: aNode [
	
	^ self receiver
]

{ #category : #private }
CHInterpreter >> visitSequenceNode: aSequenceNode [

	aSequenceNode statements allButLast
		do: [ :each | self visitNode: each ].
	^ self visitNode: aSequenceNode statements last
]

{ #category : #private }
CHInterpreter >> visitSuperNode: aNode [

	^ self receiver
]

{ #category : #private }
CHInterpreter >> visitVariableNode: aVariableNode [

	^ (self scopeDefining: aVariableNode name) read: aVariableNode name
]
