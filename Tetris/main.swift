
// Size of the grid in cells.
let gridSizeX = 10
let gridSizeY = 24

// The number of rows that are hidden beyond the top of the scren.
let hiddenMatrixRows = 3.8

let Garbage = texture(named: "Garbageicon")
var fallspeed = 20

var fallCounter = 0
var pantsX = 2
var pantsY = gridSizeY - 1

// This function is called once, before the game starts.
func first() {
    // The lower left corner of the grid is coordinate 0, 0.
    // This makes a row of tiles appear at the bottom of the screen.
    for a in 0..<10 {
        setTexture(Garbage, x: a, y: 0)
    }


}

// This function is called 60 times per second.
func update() {
    fallMino()
}

func fallMino() {
    fallCounter -= 1
    if fallCounter < 0 {
        fallCounter = fallspeed

        if hasTextureAt(x: pantsX, y: pantsY - 1) {
            return
        }

        clearTexture(x: pantsX, y: pantsY)
        pantsY -= 1
        setTexture(Garbage, x: pantsX, y: pantsY)
    }
}

// This function is called whenever the user presses a key.
func keyPress(key: Int) {
    print("key =", key)
}

// This function starts the game and must be called at the end of the file.
start()
