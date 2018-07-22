
import Foundation

class Grid {

    // Size of the grid, in cells. 
    private let cellsX: Int
    private let cellsY: Int
    
    // Center of the grid, in normalized window coordinates, with the origin at the center of the window.
    private let center: CGPoint
    
    // Size of the grid, in normalized window coordinates.
    private let size: CGPoint
        
    init(cellsX: Int, cellsY: Int, center: CGPoint, height: GGFloat) {
        self.cellsX = cellsX
        self.cellsY = cellsY
        self.center = center
        self.size = size
    }

}
