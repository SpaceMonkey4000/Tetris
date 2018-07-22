import Foundation

class GhostPiece {
    
    private var x = 0
    private var y = 0
    private var shape: Shape = Shape()
    
    func draw(shape: Shape, x: Int, y: Int) {
        if ghostStyle != "off" {
            var y = y
            while !shape.collidesWithAnything(x: x, y: y - 1) {
                y -= 1
            }
            self.x = x
            self.y = y
            self.shape = shape
            makeGhostColor()
        }
    }
    
    func erase() {
        if ghostStyle != "off" {
            shape.erase(x: x, y: y)
        }
    }
    
    func makeGhostColor() {
        if ghostStyle == "bright" {
            shape.drawWithTexture(ghostwhite, x: x, y: y)
        } else if ghostStyle == "color" {
            if tetromino.name == "O" {
                shape.drawWithTexture(ghostyellow, x: x, y: y)
            } else if tetromino.name == "I" {
                shape.drawWithTexture(ghostcyan, x: x, y: y)
            } else if tetromino.name == "T" {
                shape.drawWithTexture(ghostpurple, x: x, y: y)
            } else if tetromino.name == "S" {
                shape.drawWithTexture(ghostgreen, x: x, y: y)
            } else if tetromino.name == "Z" {
                shape.drawWithTexture(ghostred, x: x, y: y)
            } else if tetromino.name == "J" {
                shape.drawWithTexture(ghostblue, x: x, y: y)
            } else if tetromino.name == "L" {
                shape.drawWithTexture(ghostorange, x: x, y: y)
            } else {
                shape.drawWithTexture(ghostgray, x: x, y: y)
            }
        } else {
            shape.drawWithTexture(ghostgray, x: x, y: y)
        }
    }
    
}
