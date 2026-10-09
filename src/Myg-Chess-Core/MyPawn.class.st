Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPawn >> attackingSquares [

	^ self diagonalSquares
]

{ #category : 'rendering' }
MyPawn >> captureSquares [

	^ self diagonalSquares select: [ :s | s hasPiece and: [ s contents color ~= color ] ]
]

{ #category : 'rendering' }
MyPawn >> diagonalSquares [

	| ahead |

	ahead := self forwardOf: square.
	ahead ifNil: [ ^ #(  ) ].
	^ { ahead left. ahead right } select: [ :s | s notNil ]
]

{ #category : 'rendering' }
MyPawn >> forwardOf: aSquare [

	^ self isWhite
		  ifTrue: [ aSquare up ]
		  ifFalse: [ aSquare down ]
]

{ #category : 'rendering' }
MyPawn >> forwardSquares [ 

	| one two |

	one := self forwardOf: square.

	(one isNil or: [ one hasPiece ]) ifTrue: [ ^ #(  ) ].
	(square name endsWith: self startingFile) ifFalse: [ ^ { one } ].

	two := self forwardOf: one.
	^ (two notNil and: [ two hasPiece not ])
		  ifTrue: [ { one. two } ]
		  ifFalse: [ { one } ]
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [

	^ aSquare renderPawn: self
]

{ #category : 'accessing' }
MyPawn >> startingFile [

	^ self isWhite ifTrue: [ '2' ] ifFalse: [ '7' ]
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	^ self forwardSquares , self captureSquares
]
