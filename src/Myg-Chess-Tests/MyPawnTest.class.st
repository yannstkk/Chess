Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testBlackPawnMovesDown [

	| pawn board |
	board := MyChessBoard empty.
	board at: 'e7' put: (pawn := MyPawn black).

	self
		assertCollection: pawn targetSquares
		hasSameElements: { board at: 'e6'. board at: 'e5' }
]

{ #category : 'tests' }
MyPawnTest >> testCaptureDiagonale [

	| pawn board |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).
	board at: 'd5' put: MyRook black.

	self assert: (pawn targetSquares includes: (board at: 'd5'))
]

{ #category : 'tests' }
MyPawnTest >> testIsBlocked [

	| pawn board |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).
	board at: 'e5' put: MyRook black.

	self assert: pawn targetSquares isEmpty
]

{ #category : 'tests' }
MyPawnTest >> testMovesOneSquare [

	| pawn board |

	board := MyChessBoard empty.
	
	board at: 'e3' put: (pawn := MyPawn white).

	self
		assertCollection: pawn targetSquares
		hasSameElements: { board at: 'e4' }
]

{ #category : 'tests' }
MyPawnTest >> testMovesTwoSquaresFromStart [

	| pawn board |

	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).

	self
		assertCollection: pawn targetSquares
		hasSameElements: { board at: 'e3'. board at: 'e4' }
]
