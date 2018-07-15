//
//  Example:
//
//  // The current tetromino that will appear in the grid.
//  var tetromino: Tetromino = Tetromino()
//
//  // Create a new J tetromino.
//  func createJTetromino() -> Tetromino {
//      return Tetromino(shapes: [jNorth, jEast, jSouth, jWest])
//  }
//
//  tetromino = createJTetromino()
//
//  // Place the tetromino in the grid.
//  tetromino.addToGridAt(x: 3, y: gridSizeY - 4)
//
//  // Move the tetromino one cell to the right.
//  if tetromino.canMoveBy(dx: 1, dy: 0) {
//      tetromino.moveBy(dx: 1, dy: 0)
//  }
//
//  // Rotate the tetromino clockwise.
//  if tetromino.canRotateClockwise() {
//      tetromino.rotateClockwise()
//  }
//

import Foundation

class Tetromino {

    // The position of the Tetromino. We'll used this instead of tX and tY
    // from now on.
    private var x: Int = 0
    private var y: Int = 0

    // An array of 4 shapes.
    private var shapes: [Shape] = []

    // A number between 0 and 3, corresponding to north, east, south, west.
    private var direction: Int = 0

    // Creates an empty tetromino with no shapes.
    init() {
        self.shapes = []
    }

    // Creates a tetromino with an array of shapes.
    init(shapes: [Shape]) {
        assert(shapes.count == 4)
        self.shapes = shapes
    }

    // The next four functions should call the function
    // of the same name on the shape in the shapes array
    // corresponding to the value of direction.

    private func draw(x: Int, y: Int, direction: Int) {
        shapes[direction].draw(x: x, y: y)
    }

    private func erase(x: Int, y: Int, direction: Int) {
        // TODO
    }

    private func collides(x: Int, y: Int, direction: Int) -> Bool {
        // TODO
        return false
    }

    private func collidesWithEdgeOfGrid(x: Int, y: Int, direction: Int) -> Bool {
        // TODO
        return false
    }

    // Implement the following function in terms of the ones above:

    // Returns the tetromino's direction, rotated clockwise one direction.
    // If the direction is 3, the function should return 0.
    func getClockwiseDirection() -> Int {
        // TODO
        return 0
    }

    // Returns the tetromino's direction, rotated counterclockwise one direction.
    // If the direction is 0, the function should return 3.
    func getCounterclockwiseDirection() -> Int {
        // TODO
        return 0
    }

    // Adds the tetromino to the grid at a location.
    // We'll call this once when the tetromino is created, and then never again.
    func addToGridAt(x: Int, y: Int) {
        // TODO
    }

    // Removes the tetromino from the grid. We'll call this if we want to
    // remove the tetromino from the grid and replace it with a new one,
    // for testing. We do not expect to call this during regular game play.
    func removeFromGrid() {
        // TODO
    }

    // Returns true if the tetromino can be moved by an offset
    // without colliding with other minos or with the edge of the grid.
    func canMoveBy(dx: Int, dy: Int) -> Bool {
        // TODO: This function should first erase the tetromino, then test
        // if the tetromino can be moved, then draw the tetromino,
        // then return the result.
        return false
    }

    // Move the tetromino.
    func moveBy(dx: Int, dy: Int) {
        // TODO: This function should first erase the tetromino, then
        // then move the tetromino, then draw the tetromino in its new location.
    }

    // Returns true if the tetromino can be rotated clockwise
    // without colliding with other minos or with the edge of the grid.
    func canRotateClockwise() -> Bool {
        let newDirection = getClockwiseDirection()
        // TODO: This function should first erase the tetromino,
        // then test if it collides with anything when rotated to
        // its new direction, then draw the tetromino with its original direction.
        return false
    }

    // Returns true if the tetromino can be rotated counterclockwise
    // without colliding with other minos or with the edge of the grid.
    func canRotateCounterclockwise() -> Bool {
        // TODO
        return false
    }

    // Rotate the tetromino clockwise.
    func rotateClockwise() {
        // TODO: Erase the tetromino, rotate it clockwise, then draw it.
    }

    // Rotate the tetromino counterclockwise.
    func rotateCounterclockwise() {
        // TODO
    }

}
