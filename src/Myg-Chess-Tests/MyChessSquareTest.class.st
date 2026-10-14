Class {
	#name : 'MyChessSquareTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyChessSquareTest >> testRenderBlackKingOnWhiteSquare [

	| board |
	board := MyChessBoard empty.

	self assert: ((board at: 'e4') renderPiece: MyKing black) equals: 'L'
]

{ #category : 'tests' }
MyChessSquareTest >> testRenderBlackPawnOnBlackSquare [

	| board |
	board := MyChessBoard empty.

	self assert: ((board at: 'd4') renderPiece: MyPawn black) equals: 'o'
]

{ #category : 'tests' }
MyChessSquareTest >> testRenderBlackQueenOnWhiteSquare [

	| board |
	board := MyChessBoard empty.

	self assert: ((board at: 'e4') renderPiece: MyQueen black) equals: 'W'
]

{ #category : 'tests' }
MyChessSquareTest >> testRenderWhiteKnightOnBlackSquare [

	| board |
	board := MyChessBoard empty.

	self assert: ((board at: 'd4') renderPiece: MyKnight white) equals: 'n'
]

{ #category : 'tests' }
MyChessSquareTest >> testRenderWhitePawnOnWhiteSquare [

	| board |
	board := MyChessBoard empty.

	self assert: ((board at: 'e4') renderPiece: MyPawn white) equals: 'P'
]
