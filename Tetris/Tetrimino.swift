//
//  Example:
//
//  // The current tetrimino that will appear in the grid.
//  var tetrimino: Tetrimino = Tetrimino()
//
//  // Create a new J tetrimino.
//  func createJTetrimino() -> Tetrimino {
//      return Tetrimino(shapes: [jNorth, jEast, jSouth, jWest])
//  }
//
//  tetrimino = createJTetrimino()
//
//  // Place the tetrimino in the grid.
//  tetrimino.addToGridAt(x: 3, y: gridSizeY - 4)
//
//  // Move the tetrimino one cell to the right.
//  if tetrimino.canMoveBy(dx: 1, dy: 0) {
//      tetrimino.moveBy(dx: 1, dy: 0)
//  }
//
//  // Rotate the tetrimino clockwise.
//  if tetrimino.canRotateClockwise() {
//      tetrimino.rotateClockwise()
//  }
//

import Foundation

class Tetrimino {

    // The position of the Tetrimino. We'll used this instead of tX and tY
    // from now on.
    private var x: Int = 0
    private var y: Int = 0

    // An array of 4 shapes.
    private var shapes: [Shape] = []

    // A number between 0 and 3, corresponding to north, east, south, west.
    private var direction: Int = 0

    // Creates an empty tetrimino with no shapes.
    init() {
        self.shapes = []
    }

    // Creates a tetrimino with an array of shapes.
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

    // Returns the tetrimino's direction, rotated clockwise one direction.
    // If the direction is 3, the function should return 0.
    func getClockwiseDirection() -> Int {
        // TODO
        return 0
    }

    // Returns the tetrimino's direction, rotated counterclockwise one direction.
    // If the direction is 0, the function should return 3.
    func getCounterclockwiseDirection() -> Int {
        // TODO
        return 0
    }

    // Adds the tetrimino to the grid at a location.
    // We'll call this once when the tetrimino is created, and then never again.
    func addToGridAt(x: Int, y: Int) {
        // TODO
    }

    // Removes the tetrimino from the grid. We'll call this if we want to
    // remove the tetrimino from the grid and replace it with a new one,
    // for testing. We do not expect to call this during regular game play.
    func removeFromGrid() {
        // TODO
    }

    // Returns true if the tetrimino can be moved by an offset
    // without colliding with other minos or with the edge of the grid.
    func canMoveBy(dx: Int, dy: Int) -> Bool {
        // TODO: This function should first erase the tetrimino, then test
        // if the tetrimino can be moved, then draw the tetrimino,
        // then return the result.
        return false
    }

    // Move the tetrimino.
    func moveBy(dx: Int, dy: Int) {
        // TODO: This function should first erase the tetrimino, then
        // then move the tetrimino, then draw the tetrimino in its new location.
    }

    // Returns true if the tetrimino can be rotated clockwise
    // without colliding with other minos or with the edge of the grid.
    func canRotateClockwise() -> Bool {
        let newDirection = getClockwiseDirection()
        // TODO: This function should first erase the tetrimino,
        // then test if it collides with anything when rotated to
        // its new direction, then draw the tetrimino with its original direction.
        return false
    }

    // Returns true if the tetrimino can be rotated counterclockwise
    // without colliding with other minos or with the edge of the grid.
    func canRotateCounterclockwise() -> Bool {
        // TODO
        return false
    }

    // Rotate the tetrimino clockwise.
    func rotateClockwise() {
        // TODO: Erase the tetrimino, rotate it clockwise, then draw it.
    }

    // Rotate the tetrimino counterclockwise.
    func rotateCounterclockwise() {
        // TODO
    }

}
