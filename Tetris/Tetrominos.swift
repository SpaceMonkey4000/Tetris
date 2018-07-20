
import Foundation

func createJTetromino() -> Tetromino {
    return Tetromino(name: "J", shapes: [jNorth, jEast, jSouth, jWest])
}
func createLTetromino() -> Tetromino {
    return Tetromino(name: "L", shapes: [lNorth, lEast, lSouth, lWest])
}
func createTTetromino() -> Tetromino {
    return Tetromino(name: "T", shapes: [tNorth, tEast, tSouth, tWest])
}
func createITetromino() -> Tetromino {
    return Tetromino(name: "I", shapes: [iNorth, iEast, iSouth, iWest])
}
func createOTetromino() -> Tetromino {
    return Tetromino(name: "O", shapes: [oNorth, oEast, oSouth, oWest])
}
func createSTetromino() -> Tetromino {
    return Tetromino(name: "S", shapes: [sNorth, sEast, sSouth, sWest])
}
func createZTetromino() -> Tetromino {
    return Tetromino(name: "Z", shapes: [zNorth, zEast, zSouth, zWest])
}
func createMonominoTetromino() -> Tetromino {
    return Tetromino(name: "MM", shapes: [monomino, monomino, monomino, monomino])
}
func createInstaclearTetromino() -> Tetromino {
    return Tetromino(name: "IC", shapes: [instaClear, instaClear, instaClear, instaClear])
}
func createTetrisplusTetromino() -> Tetromino {
    return Tetromino(name: "TP", shapes: [tetrisplus, tetrisplus, tetrisplus, tetrisplus])
}
func createXtetromino() -> Tetromino {
    return Tetromino(name: "X", shapes: [xPiece, xPiece, xPiece, xPiece])
}
func createOwoTetromino() -> Tetromino {
    return Tetromino(name: "OWO", shapes: [owoPiece, owoPiece, owoPiece, owoPiece])
}



