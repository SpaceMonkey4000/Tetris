import Foundation

class GhostPiece {
    
    private var x = 0
    private var y = 0
    private var shape: Shape = Shape()
    
    func draw(shape: Shape, x: Int, y: Int) {
        var y = y
        while !shape.collidesWithAnything(x: x, y: y - 1) {
            y -= 1
        }
        shape.draw(x: x, y: y)
        self.x = x
        self.y = y
        self.shape = shape
    }
    
    func erase() {
        shape.erase(x: x, y: y)
    }
    
    
}
