
import Foundation

class Grid {

    // Size of the grid, in cells. 
    private let cellsX: Int
    private let cellsY: Int
    
    // Center of the grid, in normalized window coordinates, with the origin at the center of the window.
    // The bottom of the window is -1 and the top is 1.
    private let center: CGPoint
    
    // Scale of the grid, relative to the size of the scene as defined in grid cells.
    // If scale is 1, the size of the grid's cells will match those of the scene.
    private let scale: CGPoint
        
    init(cellsX: Int, cellsY: Int, center: CGPoint, scale: GGFloat) {
        self.cellsX = cellsX
        self.cellsY = cellsY
        self.center = center
        self.scale = scale
    }

}
