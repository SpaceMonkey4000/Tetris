
// Size of the grid in cells.
let gridSizeX = 10
let gridSizeY = 24

// The number of rows that are hidden beyond the top of the scren.
let hiddenMatrixRows = 3.8

let garbage = texture(named: "Garbageicon")
var fallspeed = 30
var softdropfallspeed = 1

var fallCounter = 0
var pantsX = 0
var pantsY = 0
var slidetimer = 0
var stickdelay = 30
var tilesinline = 0

// This function is called once, before the game starts.
func first() {
    spawnMino()
    // The lower left corner of the grid is coordinate 0, 0.
    // This makes a row of tiles appear at the bottom of the screen.
    for a in 0..<5 {
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
    if hasTextureAt(x: pantsX, y: pantsY - 1) || pantsY == 0{
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
        
        if hasTextureAt(x: pantsX, y: pantsY - 1) || pantsY == 0{
            if slidetimer == 1 {
                linecheck()
            }
            return
        }
        
        clearTexture(x: pantsX, y: pantsY)
        pantsY -= 1
        setTexture(garbage, x: pantsX, y: pantsY)
    }
}

//line clear
func clearline(y: Int) {
    for ye in y..<gridSizeY {
        for x in 0..<gridSizeX {
            let texture = textureAt(x: x, y: ye + 1)
            setTexture(texture, x: x, y: ye)
            
        }
    }
}

// check for line
func linecheck() {
    for y in 0..<gridSizeY {
        tilesinline = 0
        for x in 0..<gridSizeX {
            if hasTextureAt (x: x, y: y) {
                tilesinline += 1
            }
            
        }
        if tilesinline == gridSizeX {
            clearline(y: y)
        }
    }
    spawnMino()
}

// This function is called whenever the user presses a key.
func keyPress(key: Int) {
    print("key =", key)
}


// This function starts the game and must be called at the end of the file.
start()

