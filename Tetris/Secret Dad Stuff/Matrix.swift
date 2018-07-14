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
        let tetris = TetrisManager.shared.tetris

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

}
