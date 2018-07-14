//
//  Tetris.swift
//  Tetris
//
//  Created by Drew Olbrich on 7/14/18.
//  Copyright © 2018 Retroactive Fiasco. All rights reserved.
//

class Tetris {

    // Based on 2009 Tetris Design Guidelines.

    // Size of the matrix in cells.
    let matrixColumns = 10
    let matrixRows = 24

    // The number of rows that are hidden off the top of the scren.
    let hiddenMatrixRows = 3.8

    let pikachu = texture(named: "Pikachu")
    let pants = texture(named: "Pants")

    var counter = 0
    var x = 0
    var y = 0

    // This is called once, before the game starts.
    func start() {
        // The lower left corner of the grid is row 0, column 0.

        setTexture(pants, row: 3, column: 0)
        setTexture(pants, row: 4, column: 0)
        setTexture(pants, row: 4, column: 1)
        setTexture(pikachu, row: 5, column: 2)
        clearTexture(row: 3, column: 0)

        x = matrixRows - 1
        y = 0
    }

    // This function is called 60 times per second.
    func update() {
        counter -= 1
        if counter < 0 {
            counter = 10
            clearTexture(row: x, column: y)
            x -= 1
            setTexture(pants, row: x, column: y)
        }
    }

}
