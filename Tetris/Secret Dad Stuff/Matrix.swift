//
//  Matrix.swift
//  Tetris
//
//  Created by Drew Olbrich on 7/14/18.
//  Copyright © 2018 Retroactive Fiasco. All rights reserved.
//

import SpriteKit

class Matrix {

    private let rows: Int
    private let columns: Int

    private typealias Row = [Cell]
    private var cells: [Row] = []

    init() {
        self.rows = gridSizeY
        self.columns = gridSizeX

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
        return CGPoint(x: (CGFloat(x) + 0.5)*Cell.size.width,
                       y: (CGFloat(y) + 0.5)*Cell.size.height)
    }

    public func layoutCells() {
        foreach { (x, y, cell) in
            cell.layout(x: x, y: y)
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
