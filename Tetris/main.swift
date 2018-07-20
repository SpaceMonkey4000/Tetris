
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

var hardDropInstantLock = 1

var rotationSystem = "SRS"

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
    for a in 0..<0 {
        setTexture(garbage, x: a, y: 0)
    }

//    lNorth.draw(x: 0, y: 10)
//    lNorth.draw(x: 1, y: 14)
}

func refreshSlideTimer() {
    if tetromino.onGround(){
        print(stRefreshes)
        stRefreshes -= 1
        if stRefreshes < 1 {
            slidetimer = 1
        } else {
            slidetimer = stickdelay
        }
    }
}

// This function is called 60 times per second.
func update() {
    fallMino()
    softFall()
    //leftarrow
    if keyIsPressed(123) {
        if !keyIsPressed(124) {
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
    }
    //rightarrow
    if keyIsPressed(124) {
        if !keyIsPressed(123) {
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

        if lineScore == 1 {
            print("Single")
        } else if lineScore == 2 {
            print("Double")
        } else if lineScore == 3 {
            print("Triple")
        } else if lineScore == 4 {
            print("Tetris!")
        } else if lineScore == 5 {
            print("Tetris plus!")
        }
    }
}

// This function is called whenever the user presses a key.
func keyPress(key: Int) {
    //rotateright   UP                   X
    if key == (126) || key == (7){
        if tetromino.onGround() {
             refreshSlideTimer()
        }
        if rotationSystem == "SRS" {
            superRotationSystemRightRot()
        } else if rotationSystem == "broken" {
            brokenRotationSystemRightRot()
        } else {
            simpleRotationSystemRightRot()
        }
        return
    }
    
    
    //rotateleft    Z
    if key == (6){
        if tetromino.onGround() {
            refreshSlideTimer()
        }
        if rotationSystem == "SRS" {
            superRotationSystemLeftRot()
        } else if rotationSystem == "broken" {
            brokenRotationSystemLeftRot()
        } else {
            simpleRotationSystemRightRot()
        }
        return
    }

    //leftarrow
    if key == (123) {
        dirCounter = 0
        if !tetromino.blockLeft(){
            tetromino.moveBy(dx: -1, dy: 0, ddirection: 0)
            refreshSlideTimer()
        }

    }
    //rightarrow
    if key == (124) {
        dirCounter = 0
        if !tetromino.blockRight(){
            tetromino.moveBy(dx: 1, dy: 0, ddirection: 0)
            refreshSlideTimer()
        }

    }
    
    //harddrop
    if key == (49) {
        while !tetromino.onGround() {
            tetromino.moveBy(dx: 0, dy: -1, ddirection: 0)
        }
        if hardDropInstantLock == 1{
            slidetimer = 0
            stRefreshes = 0
            fallCounter = -1
        }
    }
    
    
    //debug
    if keyIsPressed(12) {
        tetromino.removeFromGrid()
        tetromino = createLTetromino()
        tetromino.addToGridAt(x: 3, y: gridSizeY - 5, direction: 0)
    }
    if keyIsPressed(13) {
        tetromino.removeFromGrid()
        tetromino = createJTetromino()
        tetromino.addToGridAt(x: 3, y: gridSizeY - 5, direction: 0)
    }
    if keyIsPressed(14) {
        tetromino.removeFromGrid()
        tetromino = createITetromino()
        tetromino.addToGridAt(x: 3, y: gridSizeY - 5, direction: 0)
    }
    if keyIsPressed(15) {
        tetromino.removeFromGrid()
        tetromino = createOTetromino()
        tetromino.addToGridAt(x: 3, y: gridSizeY - 5, direction: 0)
    }
    if keyIsPressed(17) {
        tetromino.removeFromGrid()
        tetromino = createTTetromino()
        tetromino.addToGridAt(x: 3, y: gridSizeY - 5, direction: 0)
    }
    if keyIsPressed(16) {
        tetromino.removeFromGrid()
        tetromino = createZTetromino()
        tetromino.addToGridAt(x: 3, y: gridSizeY - 5, direction: 0)
    }
    if keyIsPressed(32) {
        tetromino.removeFromGrid()
        tetromino = createSTetromino()
        tetromino.addToGridAt(x: 3, y: gridSizeY - 5, direction: 0)
    }
    if keyIsPressed(0) {
        tetromino.removeFromGrid()
        tetromino = createMonominoTetromino()
        tetromino.addToGridAt(x: 3, y: gridSizeY - 5, direction: 0)
    }
    if keyIsPressed(1) {
        tetromino.removeFromGrid()
        tetromino = createTetrisplusTetromino()
        tetromino.addToGridAt(x: 3, y: gridSizeY - 5, direction: 0)
    }
    if keyIsPressed(2) {
        tetromino.removeFromGrid()
        tetromino = createInstaclearTetromino()
        tetromino.addToGridAt(x: 3, y: gridSizeY - 5, direction: 0)
    }
    if keyIsPressed(3) {
        tetromino.removeFromGrid()
        tetromino = createXtetromino()
        tetromino.addToGridAt(x: 3, y: gridSizeY - 5, direction: 0)
    }
    
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

