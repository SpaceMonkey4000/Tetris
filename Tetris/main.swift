
// Size of the grid in cells.
let gridSizeX = 10
let gridSizeY = 24

// The number of rows that are hidden beyond the top of the scren.
let hiddenMatrixRows = 3.8

let pikachu = texture(named: "Pikachu")
let pants = texture(named: "Pants")

var pantsCounter = 0
var pantsX = 2
var pantsY = gridSizeY - 1

// This function is called once, before the game starts.
func first() {
    // The lower left corner of the grid is coordinate 0, 0.

    setTexture(pants, x: 0, y: 3)
    setTexture(pants, x: 0, y: 4)
    setTexture(pants, x: 1, y: 4)
    setTexture(pikachu, x: 2, y: 5)
    clearTexture(x: 0, y: 3)
}

// This function is called 60 times per second.
func update() {
    fallPants()
}

func fallPants() {
    pantsCounter -= 1
    if pantsCounter < 0 {
        pantsCounter = 10

        if hasTextureAt(x: pantsX, y: pantsY - 1) {
            return
        }

        clearTexture(x: pantsX, y: pantsY)
        pantsY -= 1
        setTexture(pants, x: pantsX, y: pantsY)
    }
}

// This function is called whenever the user presses a key.
func keyPress(key: Int) {
    print("key =", key)
}

// This function starts the game and must be called at the end of the file.
start()
