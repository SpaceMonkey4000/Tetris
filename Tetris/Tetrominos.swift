
import Foundation

func createJTetromino() -> Tetromino {
    return Tetromino(shapes: [jNorth, jEast, jSouth, jWest])
}
func createLTetromino() -> Tetromino {
    return Tetromino(shapes: [lNorth, lEast, lSouth, lWest])
}
func createTTetromino() -> Tetromino {
    return Tetromino(shapes: [tNorth, tEast, tSouth, tWest])
}
func createITetromino() -> Tetromino {
    return Tetromino(shapes: [iNorth, iEast, iSouth, iWest])
}
func createOTetromino() -> Tetromino {
    return Tetromino(shapes: [oNorth, oEast, oSouth, oWest])
}
func createSTetromino() -> Tetromino {
    return Tetromino(shapes: [sNorth, sEast, sSouth, sWest])
}
func createZTetromino() -> Tetromino {
    return Tetromino(shapes: [zNorth, zEast, zSouth, zWest])
}


