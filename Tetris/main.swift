
// Size of the grid in cells.
let gridSizeX = 10
let gridSizeY = 24

// The number of rows that are hidden beyond the top of the scren.
let hiddenMatrixRows = 3.8

let garbage = texture(named: "Garbageicon")
var fallspeed = 40
var softdropfallspeed = 2

var fallCounter = 0
var pantsX = 0
var pantsY = 0
var slidetimer = 0
var stickdelay = 60

// This function is called once, before the game starts.
func first() {
    spawnMino()
    // The lower left corner of the grid is coordinate 0, 0.
    // This makes a row of tiles appear at the bottom of the screen.
    for a in 0..<10 {
        setTexture(garbage, x: a, y: 0)
    }
    
    
}

// This function is called 60 times per second.
func update() {
    fallMino()
    print(slidetimer)
    
    if keyIsPressed(123) {
        if !hasTextureAt(x: pantsX - 1, y: pantsY){
            if pantsX > 0 {
                clearTexture(x: pantsX, y: pantsY)
                pantsX = pantsX - 1
                setTexture(garbage, x: pantsX, y: pantsY)
            }
        }
    }
    
    if keyIsPressed(124) {
        if !hasTextureAt(x: pantsX + 1, y: pantsY){
            if pantsX < 9 {
                clearTexture(x: pantsX, y: pantsY)
                pantsX = pantsX + 1
                setTexture(garbage, x: pantsX, y: pantsY)
            }
        }
    }
}

func spawnMino(){
    slidetimer = stickdelay
    pantsX = 5
    pantsY = gridSizeY - 3
}

func fallMino() {
    if hasTextureAt(x: pantsX, y: pantsY - 1) {
        if slidetimer>1 {
            slidetimer = slidetimer - 1
        }
    }
    fallCounter -= 1
    if fallCounter < 0 {
        if keyIsPressed(125){
        fallCounter = softdropfallspeed
        }
        if !keyIsPressed(125){
            fallCounter = fallspeed
        }
        
        if hasTextureAt(x: pantsX, y: pantsY - 1) {
            if slidetimer == 1 {
                spawnMino()
            }
            return
        }
        
        clearTexture(x: pantsX, y: pantsY)
        pantsY -= 1
        setTexture(garbage, x: pantsX, y: pantsY)
    }
}

// This function is called whenever the user presses a key.
func keyPress(key: Int) {
    print("key =", key)
}

// This function starts the game and must be called at the end of the file.
start()
