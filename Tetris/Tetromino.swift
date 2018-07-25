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
    
    public let name: String
    
    // The position of the Tetromino. We'll used this instead of tX and tY
    // from now on.
    private var x: Int = 0
    private var y: Int = 0

    public var lastXmovement: Int = 0
    public var lastYmovement: Int = 0
    public var lastDirMovement: Int = 0
    
    // An array of 4 shapes.
    private var shapes: [Shape] = []

    // A number between 0 and 3, corresponding to north, east, south, west.
    public var direction: Int = 0

    // Creates an empty tetromino with no shapes.
    init() {
        self.shapes = []
        self.name = ""
    }

    // Creates a tetromino with an array of shapes.
    init(name: String, shapes: [Shape]) {
        assert(shapes.count == 4)
        self.shapes = shapes
        self.name = name
    }

    // The next four functions should call the function
    // of the same name on the shape in the shapes array
    // corresponding to the value of direction.

    let ghostPiece = GhostPiece()
    
    private func draw(x: Int, y: Int, direction: Int) {
        let shape = shapes[direction]
        ghostPiece.draw(shape: shape, x: x, y: y)
        shape.draw(x: x, y: y)
    }
    
    public func drawOnGrid(x: Int, y: Int, direction: Int, grid: Grid) {
        let shape = shapes[direction]
        shape.drawOnGrid(x: x, y: y, grid: grid)
    }

    private func erase(x: Int, y: Int, direction: Int) {
        let shape = shapes[direction]
        shape.erase(x: x, y: y)
        ghostPiece.erase()
    }

    private func collidesWithMinos(x: Int, y: Int, direction: Int) -> Bool {
        let shape = shapes[direction]
        return shape.collidesWithMinos(x: x, y: y)
    }

    private func collidesWithEdgeOfGrid(x: Int, y: Int, direction: Int) -> Bool {
        let shape = shapes[direction]
        return shape.collidesWithEdgeOfGrid(x: x, y: y)
    }
    
    private func collides(x: Int, y: Int, direction: Int) -> Bool {
        return collidesWithMinos(x: x, y: y, direction: direction) || collidesWithEdgeOfGrid(x: x, y: y, direction: direction)
    }

    // Returns the tetromino's direction, rotated clockwise one direction.
    // If the direction is 3, the function should return 0.
    func getClockwiseDirection() -> Int {
        return (self.direction + 1) % 4
    }

    // Returns the tetromino's direction, rotated counterclockwise one direction.
    // If the direction is 0, the function should return 3.
    func getCounterclockwiseDirection() -> Int {
        return (self.direction + 3) % 4
    }

    // Adds the tetromino to the grid at a location.
    // We'll call this once when the tetromino is created, and then never again.
    func addToGridAt(x: Int, y: Int, direction: Int) {
        self.x = x
        self.y = y
        self.direction = direction
        draw(x: x, y: y, direction: direction)
    }

    // Removes the tetromino from the grid. We'll call this if we want to
    // remove the tetromino from the grid and replace it with a new one,
    // for testing. We do not expect to call this during regular game play.
    func removeFromGrid() {
        erase(x: x, y: y, direction: direction)
    }

    // Returns true if the tetromino can be moved by an offset
    // without colliding with other minos or with the edge of the grid.
    func canMoveBy(dx: Int, dy: Int, ddirection: Int) -> Bool {
        defer {
            self.draw(x: self.x, y: self.y, direction: self.direction)
        }
        var newDirection = 0
        if ddirection == 1 {
            newDirection = getClockwiseDirection()
        }
        if ddirection == -1 {
            newDirection = getCounterclockwiseDirection()
        }
        if ddirection == 0 {
            newDirection = self.direction
        }
        self.erase(x: self.x, y: self.y, direction: self.direction)
        return !collides(x: self.x + dx, y: self.y + dy, direction: newDirection)
    }

    // Move the tetromino.
    func moveBy(dx: Int, dy: Int, ddirection: Int) {
        if canMoveBy(dx: dx, dy: dy, ddirection: ddirection) {
            self.erase(x: self.x, y: self.y, direction: self.direction)
            
            if ddirection == 1 {
                direction = getClockwiseDirection()
            }
            if ddirection == -1 {
                direction = getCounterclockwiseDirection()
            }

            self.x += dx
            self.y += dy
            lastXmovement = dx
            lastYmovement = dy
            lastDirMovement = ddirection
            self.draw(x: self.x, y: self.y, direction: self.direction)
        }
    }

    // Checks if the tetromino is colliding with the ground.
    func onGround() -> Bool {
        return !canMoveBy(dx: 0, dy: -1, ddirection: 0)
    }
    // Checks if the tetromino is colliding to the left.
    func blockLeft() -> Bool {
        return !canMoveBy(dx: -1, dy: 0, ddirection: 0)
    }
    // Checks if the tetromino is colliding to the right.
    func blockRight() -> Bool {
        return !canMoveBy(dx: 1, dy: 0, ddirection: 0)
    }
    // Checks if the tetromino is just below a ceiling.
    func blockUp() -> Bool {
        return !canMoveBy(dx: 0, dy: 1, ddirection: 0)
    }
    func blocked() -> Bool {
        if blockUp() && blockLeft() && blockRight() && onGround() {
            return true
        } else {
            return false
        }
    }
    
    
    // Checks if there is a block in a specified location relative to the center of the tetromino.
    func relativeBlockAt(dx: Int, dy: Int) -> Bool {
        defer {
            tetromino.draw(x: self.x, y: self.y, direction: self.direction)
        }
        tetromino.erase(x: self.x, y: self.y, direction: self.direction)
        if hasTextureAt(x: self.x + 1 + dx, y: self.y + 1 + dy) || self.x + 1 + dx > gridSizeX || self.x + 1 + dx < 0 || self.y + 1 + dy < 0 {
            return true
        } else {
            return false
        }
    }
}

extension Tetromino: CustomStringConvertible {

    var description: String {
        return "Tetromino(name: \(name))"
    }
    
}
