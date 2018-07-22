//-------------------------------------------------------------------------------------------------------------//
//                                      Start of the variable list                                             //
//-------------------------------------------------------------------------------------------------------------//

    //TRUE LETS: these are lets. Let let let let let let let let
        //This defines the garbage icon.
        let garbage = texture(named: "Garbageicon")
        //This is the amount of rows that are hidden from the player. It is a float value.
        let hiddenMatrixRows = 3.8

    //SEMI LETS: these should never be changed while the game is playing, but they can be changed in menus.
        // Size of the grid in cells.
        var gridSizeX = 10
        var gridSizeY = 24
        // The amount of frames that the player has before the piece locks down.
        var stickdelay = 30
        // Allows the player to use special keys to make tetrominos and debug pieces.
        var debugTools = 1
        // The amount of refreshes the player gets upon piece spawning. When a player rotates or moves a piece, the piece will set the slide timer to stickdelay.
        var stMaxRefreshes = 15
        //If the piece instantly locks down when hard dropped.
        var hardDropInstantLock = 1
        //SPINS:
            //If the player gets rewarded for doing spin moves for certain blocks.
            var tSpinsRewarded = true
            var sSpinsRewarded = false
            var zSpinsRewarded = false
            var lSpinsRewarded = false
            var jSpinsRewarded = false
            var iSpinsRewarded = false
            var oSpinsRewarded = false
        /*The rotation system the game uses.
        SRS == The super rotation system. The standard RS that the tetris guideline uses.
        OSSRS == The O-spin super rotation system. Like SRS, but it allows for O-spins.
        Simple == The simple rotation system. Uses no wall kicks. */
        var rotationSystem = "OSSRS"
        /*The visual style the game uses.
        default == The default visual style. Based off of the default style in Tetris Friends.
        solid == Solid colors. Based off of... solid colors. Not implemented yet.
        nes == The style of the tetris game on the NES.
        nblox == The style used in N-blox. It even comes with matching colors! Not implemented yet.
        GB == The style used in the game boy tetris.
        shiny == It's shiny!
        effect == Based off of Tetris Effect. All blocks use the same texture.
        garbage == Everything is a garbage tile. Not implemented yet.
        rune == Everything looks like ancient runes.
        craft == It looks like minecraft!
        puyo == Based on the puyos in the puyo puyo games.
        invisible == You can't see anything... it will work when background texture is implemented.*/
        var textureStyle = "default"
        //How fast holding left/right autorepeats.
        var autoRepeatSpeed = 2
    //VARS: True variables that will change outside of menus.
        // How fast naturally falling and softdropping will be. They will change as the player progresses.
        var fallspeed = 30
        var softdropfallspeed = 2
        // These variables are used to drop the piece. The counters count down from their fallspeeds to 0. When they reach zero, the piece will move downwards and will be reset back to their fallspeeds.
        var softdropcounter = 0
        var fallCounter = 0
        // This variable is used to check if a player performs an amount of wallkicks when the piece drops.
        var wallKicks = 0
        // This variable is used to take in how many lines were cleared.
        var lineScore = 0
        // This variable is used to count the amount of frames left for the player to move. When the piece touches the ground, the slidetimer starts counting down from stickdelay to 0. When it reaches zero, the piece will lock.
        var slidetimer = 0
        // This variable is used to check if a line should be cleared or not. If the tilesinline variable is equal to gridsizeX, the line will clear.
        var tilesinline = 0
        // This variable is used to delay the autorepeat of the piece shifting.
        var shiftAutoRepeatCounter = 0
        // This variable is used to count if the piece should autorepeat. This acts similarly to the slidetimer and fallconter variables.
        var shiftAutoRepeatCounter2 = 0
        // This variable sets which piece will come next. Changes upon piece generation.
        var nextItem: Tetromino = createOTetromino()
        // This variable is purely debug, but it is used to print the nextItem.
        var nextSayer = "0"
        // The current amount of refreshes the player has left. Upon piece generation, it will be set to stmaxrefreshes. If it reaches zero, the piece will instantly lock down.
        var stRefreshes = 0
        // RNG VALUES
            // This value is used to define the nextItem variable.
            var rngPieceGen = 0
        //If the game is over, in a menu, or in play. (over, menu, play)
        var gameState = "play"
        // This variable is used to sense if the game should end.
        /* When the piece is spawned, this variable is set to 1.
        if the mino moves, the variable is set to 0.
        if the piece lands when the variable is 1, the game will end. */
        var gameOverCheck = 1

//-------------------------------------------------------------------------------------------------------------//
//                                        End of the variable list                                             //
//-------------------------------------------------------------------------------------------------------------//
createStyleColors()

createAllPieces()

// The current tetromino that will appear in the grid.
var tetromino: Tetromino = Tetromino()
// Create a new J tetromino.
tetromino = createJTetromino()


// This function is called once, before the game starts.
func first() {
    generateNextItem()
    spawnMino()
    // The lower left corner of the grid is coordinate 0, 0.

}

func refreshSlideTimer() {
    if tetromino.onGround(){
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
    if gameState == "play" {
        fallMino()
        softFall()
        checkForGameOver()
        //leftarrow
        if keyIsPressed(123) {
            if !keyIsPressed(124) {
                shiftAutoRepeatCounter += 1
                if shiftAutoRepeatCounter > 14 {
                    shiftAutoRepeatCounter2 += 1
                    if shiftAutoRepeatCounter2 > autoRepeatSpeed {
                        tetromino.moveBy(dx: -1, dy: 0, ddirection: 0)
                        refreshSlideTimer()
                        shiftAutoRepeatCounter2 = 0
                    }
                }
            }
        }
        //rightarrow
        if keyIsPressed(124) {
            if !keyIsPressed(123) {
                shiftAutoRepeatCounter += 1
                if shiftAutoRepeatCounter > 14 {
                    shiftAutoRepeatCounter2 += 1
                    if shiftAutoRepeatCounter2 > autoRepeatSpeed {
                        tetromino.moveBy(dx: 1, dy: 0, ddirection: 0)
                        shiftAutoRepeatCounter2 = 0
                    }
                }
            }
        }
    }
    
}
func softFall(){
    softdropcounter -= 1
    if softdropcounter < 0 {
        if keyIsPressed(125){
            fallCounter = softdropfallspeed
            softdropcounter = softdropfallspeed
        }
    }
}
func spawnMino(){
    if gameState == "play" {
        fallCounter = 0
        tetromino = nextItem
        generateNextItem()
        slidetimer = stickdelay
        gameOverCheck = 1
        if tetromino.name == "I" {
            tetromino.addToGridAt(x: (gridSizeX / 2) - 2, y: gridSizeY - 5, direction: 0)
        } else {
            tetromino.addToGridAt(x: (gridSizeX / 2) - 2, y: gridSizeY - 4, direction: 0)
        }
        stRefreshes = stMaxRefreshes
        wallKicks = 0
    }
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
        if !tetromino.onGround() {
            gameOverCheck = 0
            tetromino.moveBy(dx: 0, dy: -1, ddirection: 0)
        }
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
    lineScore = 0
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
        scoreLines()
}

func checkForGameOver() {
    if gameOverCheck == 1 && tetromino.onGround() {
        gameState = "over"
        tetromino.removeFromGrid()
        tetromino = createInstaclearTetromino()
        tetromino.addToGridAt(x: 3, y: gridSizeY - 5, direction: 0)
        print("Game over!")
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
        } else if rotationSystem == "OSSRS"{
            oSpinSuperRotationSystemRightRot()
        } else {
            simpleRotationSystemRot()
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
        } else if rotationSystem == "OSSRS"{
            oSpinSuperRotationSystemLeftRot()
        } else {
            simpleRotationSystemRot()
        }
        return
    }

    //leftarrow
    if key == (123) {
        shiftAutoRepeatCounter = 0
        if !tetromino.blockLeft(){
            tetromino.moveBy(dx: -1, dy: 0, ddirection: 0)
            refreshSlideTimer()
        }

    }
    //rightarrow
    if key == (124) {
        shiftAutoRepeatCounter = 0
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
    if keyIsPressed(51) {
        tetromino.removeFromGrid()
        tetromino = createInstaclearTetromino()
        tetromino.addToGridAt(x: 3, y: gridSizeY - 5, direction: 0)
    }
    if keyIsPressed(3) {
        tetromino.removeFromGrid()
        tetromino = createXtetromino()
        tetromino.addToGridAt(x: 3, y: gridSizeY - 5, direction: 0)
    }
    if keyIsPressed(2) {
        tetromino.removeFromGrid()
        tetromino = createEDifTetromino()
        tetromino.addToGridAt(x: 3, y: gridSizeY - 5, direction: 0)
    }
    if keyIsPressed(4) {
        tetromino.removeFromGrid()
        tetromino = createDomino()
        tetromino.addToGridAt(x: 3, y: gridSizeY - 5, direction: 0)
    }
    if keyIsPressed(5) {
        print("gamestate:",gameState)
        print("gameovercheck:",gameOverCheck)
        print("tetrominoonground:",tetromino.onGround())
        
}

}


func generateNextItem() {
rngPieceGen = random(min: 0, max: 6)
    switch rngPieceGen {
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

