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
        let tetris: Tetris = TetrisManager.shared.tetris

        self.rows = tetris.matrixRows
        self.columns = tetris.matrixColumns

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

    private func cellAt(row: Int, column: Int) -> Cell {
        return cells[row][column]
    }

    private func foreach(_ closure: ((Int, Int, Cell) -> ())) {
        for row in 0..<rows {
            for column in 0..<columns {
                closure(row, column, cellAt(row: row, column: column))
            }
        }
    }

    /// Returns the SceneKit scene location of a cell, given integer coordinates.
    /// (0, 0) is in the lower left.
    public func locationOfCellAt(row: Int, column: Int) -> CGPoint {
        return CGPoint(x: (CGFloat(column) + 0.5)*Cell.size.width,
                       y: (CGFloat(row) + 0.5)*Cell.size.height)
    }

    public func layoutCells() {
        foreach { (row, column, cell) in
            cell.layout(row: row, column: column)
        }
    }

}
