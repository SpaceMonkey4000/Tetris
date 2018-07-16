
// Size of the grid in cells.
let gridSizeX = 10
let gridSizeY = 24

// The number of rows that are hidden beyond the top of the screen.
let hiddenMatrixRows = 3.8
var softfallcounter = 0

var fallspeed = 30
var softdropfallspeed = 2

let garbage = texture(named: "Garbageicon")




var fallCounter = 0

var slidetimer = 0
var stickdelay = 30
var tilesinline = 0

var dirCounter = 0
var softdropCounter = 0

var autoRepeatSpeed = 2
var dirCounter2 = 0
var nextItem: Tetromino = createOTetromino()
var nextSayer = "0"

var stRefreshes = 0
let stMaxRefreshes = 15

let debugTools = 1

var rng1 = 0

createAllPieces()

// The current tetromino that will appear in the grid.
var tetromino: Tetromino = Tetromino()
// Create a new J tetromino.
tetromino = createJTetromino()


// This function is called once, before the game starts.
func first() {
    generateNextItem()
    print("Next mino is: ",nextSayer)
    spawnMino()
    // The lower left corner of the grid is coordinate 0, 0.
    // This makes a row of tiles appear at the bottom of the screen.
    for a in 0..<10 {
        setTexture(garbage, x: a, y: 0)
    }

//    lNorth.draw(x: 0, y: 10)
//    lNorth.draw(x: 1, y: 14)
}

func refreshSlideTimer() {
    if tetromino.onGround(){
        stRefreshes -= 1
        slidetimer = stickdelay
        if stRefreshes < 1 {
            slidetimer = 1
        }
    }
}

// This function is called 60 times per second.
func update() {
    fallMino()
    softFall()
//leftarrow
    if keyIsPressed(123) {
        dirCounter += 1
        if dirCounter > 14 {
            dirCounter2 += 1
            if dirCounter2 > autoRepeatSpeed {
                tetromino.moveBy(dx: -1, dy: 0, ddirection: 0)
                refreshSlideTimer()
                dirCounter2 = 0
            }
        }
    }
    //rightarrow
    if keyIsPressed(124) {
        dirCounter += 1
        if dirCounter > 14 {
            dirCounter2 += 1
            if dirCounter2 > autoRepeatSpeed {
                tetromino.moveBy(dx: 1, dy: 0, ddirection: 0)
                dirCounter2 = 0
            }
        }
    }
    
}
func softFall(){
    softfallcounter -= 1
    if softfallcounter < 0 {
        if keyIsPressed(125){
            fallCounter = softdropfallspeed
            softfallcounter = softdropfallspeed
        }
    }
}
func spawnMino(){
    tetromino = nextItem
    generateNextItem()
    print("Next mino is: ",nextSayer)
    

    slidetimer = stickdelay
    tetromino.addToGridAt(x: 3, y: gridSizeY - 5, direction: 0)
    stRefreshes = stMaxRefreshes
}

func fallMino() {
    if tetromino.onGround(){
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

        if tetromino.onGround(){
            if slidetimer < 2 {
                linecheck()
                spawnMino()
            }
            return
        }
        
        tetromino.moveBy(dx: 0, dy: -1, ddirection: 0)
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

// check for lines
func linecheck() {
    var y = 0
    var lineScore = 0
    while y < gridSizeY {
        tilesinline = 0
        for x in 0..<gridSizeX {
            if hasTextureAt (x: x, y: y) {
                tilesinline += 1
            }
        }
        if tilesinline == gridSizeX {
            clearline(y: y)
            lineScore += 1
        } else {
            y += 1
        }
    }
    if lineScore > 0 {
        print("you cleared ",lineScore," lines!")
        if lineScore == 4 {
            print("Tetris!")
        }
        if lineScore == 5 {
            print("Tetris plus!")
        }
    }
}

// This function is called whenever the user presses a key.
func keyPress(key: Int) {
    //leftarrow
    if keyIsPressed(123) {
        dirCounter = 0
        if !tetromino.blockLeft(){
            tetromino.moveBy(dx: -1, dy: 0, ddirection: 0)
            refreshSlideTimer()
        }

    }
    //rightarrow
    if keyIsPressed(124) {
        dirCounter = 0
        if !tetromino.blockRight(){
            tetromino.moveBy(dx: 1, dy: 0, ddirection: 0)
            refreshSlideTimer()
        }

    }
    
    //rotateright   UP                   X
    if keyIsPressed(126) || keyIsPressed(7){
        tetromino.moveBy(dx: 0, dy: 0, ddirection: 1)
    }
    //rotateleft    Z
    if keyIsPressed(6){
        tetromino.moveBy(dx: 0, dy: 0, ddirection: -1)
    }
    
//    if debugTools == 1 {
//        if keyIsPressed(0) {
//            shape.erase(x: tX, y: tY)
//            spawnMino()
//        }
//        if keyIsPressed(1) {
//            shape.erase(x: tX, y: tY)
//            shape = monomino
//            shape.draw (x: tX, y: tY)
//        }
//        if keyIsPressed(2) {
//            shape.erase(x: tX, y: tY)
//            shape = instaClear
//            shape.draw (x: tX, y: tY)
//        }
//        if keyIsPressed(3) {
//            shape.erase(x: tX, y: tY)
//            shape = tetrisplus
//            shape.draw (x: tX, y: tY)
//        }
//        if keyIsPressed(4) {
//            shape.erase(x: tX, y: tY)
//            shape = xPiece
//            shape.draw (x: tX, y: tY)
//        }
//    }
}
func generateNextItem() {
    rng1 = random(min: 0, max: 6)
        switch rng1 {
        case 0:
            nextItem = createOTetromino()
            nextSayer = "O"
        case 1:
            nextItem = createTTetromino()
            nextSayer = "T"
        case 2:
            nextItem = createITetromino()
            nextSayer = "I"
        case 3:
            nextItem = createSTetromino()
            nextSayer = "S"
        case 4:
            nextItem = createZTetromino()
            nextSayer = "Z"
        case 5:
            nextItem = createJTetromino()
            nextSayer = "J"
        case 6:
            nextItem = createLTetromino()
            nextSayer = "L"
        default:
            nextItem = createOTetromino()
            nextSayer = "O is for oops!"
    }



}
// This function starts the game and must be called at the end of the file.
start()

