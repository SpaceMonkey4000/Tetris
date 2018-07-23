//
//  Matrix.swift
//  Tetris
//
//  Created by Drew Olbrich on 7/14/18.
//  Copyright © 2018 Retroactive Fiasco. All rights reserved.
//

import SpriteKit

class Matrix {

    private let columns: Int
    private let rows: Int

    // Center of the matrix, in normalized window coordinates, 
    // with the origin at the center of the window.
    // The bottom of the window is -1.0 and the top is 1.0.
    // The horizontal position of the center are defined in terms of
    // the same scale as the vertical position.
    private let center: CGPoint
    
    // Scale of the matrix, relative to the size of the scene as defined in grid cells.
    // If scale is 1, the size of the grid's cells will match those of the scene.
    public let scale: CGFloat
    
    private typealias Row = [Cell]
    private var cells: [Row] = []

    init(cellsX: Int, cellsY: Int, center: CGPoint, scale: CGFloat) {
        self.columns = cellsX
        self.rows = cellsY
        self.center = center
        self.scale = scale

        initCells()
    }

    private func initCells() {
        cells = []
        for _ in 0..<rows {
            var row = Row()
            for _ in 0..<columns {
                let cell = Cell()
                row.append(cell)
            }
            cells.append(row)
        }
    }

    public func cellAt(x: Int, y: Int) -> Cell? {
        guard y >= 0 && y < rows && x >= 0 && x < columns else {
            return nil
        }
        return cells[y][x]
    }

    private func foreach(_ closure: ((Int, Int, Cell) -> ())) {
        for y in 0..<rows {
            for x in 0..<columns {
                if let cell = cellAt(x: x, y: y) {
                    closure(x, y, cell)
                }
            }
        }
    }

    /// Returns the SceneKit scene location of a cell, given integer coordinates.
    /// (0, 0) is in the lower left.
    public func locationOfCellAt(x: Int, y: Int) -> CGPoint {
        // x, y are the coordinates of the cell within the matrix,
        // with 0, 0 at the lower left.
        //
        // We want to return a CGPoint representing the position
        // of the center of the cell in the coordinate system of the scene,
        // measured in points, with 0.0, 0.0 at the lower left.
        //
        // center.x, center.y represents the normalized position of the center of the
        // matrix of cells within the scene, relative to the scene's center.
        // center.y ranges from -1 to 1 vertically across the height of the screen.
        // center.x has the same scale as center.y, with 0 at the screen center.
        
        let sceneSize = TetrisManager.shared.scene.size

        // The center of the matrix of cells in the scene, measured in points.
        // We intentionally multiply center.y by screenSizeInPoints.height,
        // not width, to achieve the same relative scale for center.y as for center.x.
        let matrixCenter = CGPoint(
            x: center.x*sceneSize.height/2.0 + sceneSize.width*0.5,
            y: center.y*sceneSize.height/2.0 + sceneSize.height*0.5)

        // scale represents the size of the cells of the matrix, relative to the size 
        // of the scene as defined in grid cells.
        // If scale is 1, the size of the grid's cells will be Cell.size,
        // which is measured in scene points.
        
        // The size of the matrix cells in the scene, measured in points.
        let cellSize = CGSize(width: Cell.size.width*scale, height: Cell.size.height*scale)

        // columns, rows represents the number of cells in the matrix.
        
        // The position of the lower left corner of the matrix within the scene, 
        // measured in points.
        let matrixOrigin = CGPoint(
            x: matrixCenter.x - CGFloat(columns)/2.0*cellSize.width,
            y: matrixCenter.y - CGFloat(rows)/2.0*cellSize.height)            
        
        // The location of the center of the cell in the scene.
        return CGPoint(
            x: matrixOrigin.x + (CGFloat(x) + 0.5)*cellSize.width,
            y: matrixOrigin.y + (CGFloat(y) + 0.5)*cellSize.height)        
    }
    
    public func layoutCells() {
        foreach { (x, y, cell) in
            cell.layoutAt(x: x, y: y, inMatrix: self)
        }
    }
    
    // When a cell's textureIndex is nil, this texture is assigned to its sprite.
    public var defaultTextureIndex: Int? = nil {
        didSet {
            foreach { _, _, cell in
                cell.defaultTextureIndex = defaultTextureIndex
            }
        }
    }

}
