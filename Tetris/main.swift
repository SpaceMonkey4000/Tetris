
// Size of the matrix in cells.
let matrixColumns = 10
let matrixRows = 24

// The number of rows that are hidden off the top of the scren.
let hiddenMatrixRows = 3.8

let pikachu = texture(named: "Pikachu")
let pants = texture(named: "Pants")

var counter = 0
var column = 0
var row = matrixRows - 1

// This is called once, before the game starts.
func first() {
    // The lower left corner of the grid is row 0, column 0.

    setTexture(pants, row: 3, column: 0)
    setTexture(pants, row: 4, column: 0)
    setTexture(pants, row: 4, column: 1)
    setTexture(pikachu, row: 5, column: 2)
    clearTexture(row: 3, column: 0)
}

// This function is called 60 times per second.
func update() {
    counter -= 1
    if counter < 0 {
        counter = 10
        clearTexture(row: row, column: column)
        row -= 1
        setTexture(pants, row: row, column: column)
    }
}

// This function starts the game and must be called at the end of the file.
start()
