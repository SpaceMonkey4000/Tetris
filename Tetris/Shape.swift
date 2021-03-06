
// A shape that represents a collection of minos.
class Shape {

    // The texture to draw for the shape.
    var texture: Int = 0

    // A type representing a mino that the shape is made out of.
    struct Mino {
        let mx: Int
        let my: Int
    }
    // The array of minos that make up the shape.
    var minos: [Mino] = []

    // Add a mino to the shape. mx and my are coordinates within the shape.
    // 0, 0 is at the lower left corner of the shape.
    func addMino(mx: Int, my: Int) {
        let mino = Mino(mx: mx, my: my)
        minos.append(mino)
    }

    // Draw the shape. x and y are the position of the lower left corner
    // of the shape in the grid.
    func draw(x: Int, y: Int) {
        // Loop over all the minos that make up the shape.
        for mino in minos {
            setTexture(texture, x: x + mino.mx, y: y + mino.my)
        }
    }
    
    func drawOnGrid(x: Int, y: Int, grid: Grid) {
        for mino in minos {
            grid.setTexture(texture, x: x + mino.mx, y: y + mino.my)
        }
    }
    
    // Draw a shape, using a different texture.
    func drawWithTexture(_ texture: Int, x: Int, y: Int) {
        for mino in minos {
            setTexture(texture, x: x + mino.mx, y: y + mino.my)
        }
    }

    // Erase the shape. x and y are the position of the lower left corner
    // of the shape in the grid.
    func erase(x: Int, y: Int) {
        for mino in minos {
            clearTexture(x: x + mino.mx, y: y + mino.my)
        }
    }

    // Returns true if the shape collides with any non-blank textures
    // that already exist in the grid. x and y are the position of the
    // lower left corner of the shape in the grid.
    func collidesWithMinos(x: Int, y: Int) -> Bool {
        for mino in minos {
            if hasTextureAt(x: mino.mx + x, y: mino.my + y) {
                return true
            }
        }
        return false
    }

    // Returns true if the shape collides with the edge of the grid.
    // x and y are the position of the
    // lower left corner of the shape in the grid.
    func collidesWithEdgeOfGrid(x: Int, y: Int) -> Bool {
        for mino in minos {
            if mino.mx + x > gridSizeX - 1 || mino.mx + x < 0 || mino.my + y < 0 {
                return true
            }
        }
        return false
    }
    func collidesWithAnything(x: Int, y: Int) -> Bool {
        return collidesWithMinos(x: x, y: y) || collidesWithEdgeOfGrid(x: x, y: y)
    }

}

