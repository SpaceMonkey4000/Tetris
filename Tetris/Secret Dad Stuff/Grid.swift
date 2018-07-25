import Foundation

public class Grid {

    public let matrix: Matrix
    
    public var cellsX: Int {
        return matrix.columns
    }
    
    public var cellsY: Int {
        return matrix.rows
    }
    
    init() {
        matrix = Matrix(cellsX: 0, cellsY: 0, center: .zero, scale: 1.0)
    }
    
    init(cellsX: Int, cellsY: Int, center: CGPoint, scale: CGFloat) {
        matrix = Matrix(cellsX: cellsX, cellsY: cellsY, center: center, scale: scale)
        matrix.layoutCells()
    }
    
    deinit {
        matrix.removeCells()
    }
    
    /// Assigns a background texture that appears in each cell when it is cleared
    /// with clearTexture, or with setTexture with an argument of 0.
    public func setBackgroundTexture(_ backgroundTexture: Int) {
        createTextureAtlasControllerIfNecessary()
    
        matrix.defaultTextureIndex = backgroundTexture
    }

    /// Sets a texture at a grid cell. If 0 is specified for the texture,
    /// the cell's texture is cleared.
    public func setTexture(_ index: Int, x: Int, y: Int) {
        createTextureAtlasControllerIfNecessary()

        let cell = matrix.cellAt(x: x, y: y)
        if cell == nil {
            return
        }
        if index == 0 {
            // This matches the behavior of clearTexture.
            cell?.textureIndex = nil
        } else {
            cell?.textureIndex = index
        }
    }

    /// Clears the texture at a grid cell.
    public func clearTexture(x: Int, y: Int) {
        let cell = matrix.cellAt(x: x, y: y)
        if cell == nil {
            return
        }
        cell?.textureIndex = nil
    }

    /// Returns true if a texture exists at a grid cell.
    public func hasTextureAt(x: Int, y: Int) -> Bool {
        guard let cell = matrix.cellAt(x: x, y: y) else {
            return false
        }

        return cell.textureIndex != nil
    }

    /// Returns the texture at a grid cell. Returns 0 if the cell has no texture.
    public func textureAt(x: Int, y: Int) -> Int {
        guard let cell = matrix.cellAt(x: x, y: y) else {
            return 0
        }

        guard let textureIndex = cell.textureIndex else {
            return 0
        }

        return textureIndex
    }    

}
