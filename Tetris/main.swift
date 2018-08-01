import AppKit

//TRUE LETS: these are lets. Let let let let let let let let
//This defines the garbage icon.
let garbage = texture(named: "Garbageicon")
let charged = texture(named: "ChargedMino")
let charged2 = texture(named: "ChargedMino2")
let charged3 = texture(named: "ChargedMino3")

// Sound effects.
// Play sounds like this: rotateSound.play()
let rotateSound = Sound(named: "Rotate8bit")
let shiftSound = Sound(named: "Shift8bit")
let landSound = Sound(named: "Land8bit")
let lineSound = Sound(named: "Lineclear8bit")
let tetrisSound = Sound(named: "Tetris8bit")
let perfectClearSound = Sound(named: "PerfectClear")

let comboLow = Sound(named: "Combolow")
let comboMedium = Sound(named: "Combomed")
let comboHigh = Sound(named: "Combohigh")
let comboVeryHigh = Sound(named: "Comboveryhigh")
let comboMax = Sound(named: "Combomax")
let comboOutbreak = Sound(named: "ComboOutbreak")

let holdSound = Sound(named: "Holdsound")
let holdFail = Sound(named: "Holdfail")

//This is the amount of rows that are hidden from the player. It is a float value.
let hiddenMatrixRows = 3.8

//SEMI LETS: these should never be changed while the game is playing, but they can be changed in menus.
// Size of the grid in cells.
var gridSizeX = 10
var gridSizeY = 24

// The amount of frames that the player has before the piece locks down.
var stickdelay = 30
// The amount of refreshes the player gets upon piece spawning. When a player rotates or moves a piece, the piece will set the slide timer to stickdelay.
var stMaxRefreshes = 15
//If the piece instantly locks down when hard dropped.
var hardDropInstantLock = 1
//SPINS: 
//If the player gets rewarded for doing spin moves for certain blocks.
var tSpinsRewarded = true
var sSpinsRewarded = true
var zSpinsRewarded = true
var lSpinsRewarded = true
var jSpinsRewarded = true
var iSpinsRewarded = true
var oSpinsRewarded = true
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
 garbage == Everything is a garbage tile.
 rune == Everything looks like ancient runes.
 craft == It looks like minecraft!
 puyo == Based on the puyos in the puyo puyo games.
 ghost == Looks like the colored ghost tiles.
 invisible == You can't see anything.*/
var textureStyle = "default"
//How fast holding left/right autorepeats.
var autoRepeatSpeed = 2
//The ghost style.
/* default == ghost is gray.
   off == No ghost.
   bright == ghost is white.
   color == the ghost uses the color of the current tetromino. */
var ghostStyle = "color"
//If DAS can be preserved.
var diagonalMove = true
// The amount of next items the player sees. 0-6.
var nextItems = 6
// The amount of frames it will take until auto repeat activates.
var framesUntilAutoRepeat = 12
//VARS: True variables that will change outside of menus.
//These variables are used to define textures.
var orangebasic = texture(named: "Orangebasic")
var redbasic = texture(named: "Redbasic")
var greenbasic = texture(named: "Greenbasic")
var bluebasic = texture(named: "Bluebasic")
var yellowbasic = texture(named: "Yellowbasic")
var cyanbasic = texture(named: "Cyanbasic")
var purplebasic = texture(named: "Purplebasic")

var bloodbasic = texture(named: "Bloodbasic")
var whitebasic = texture(named: "Whitebasic")
var brownbasic = texture(named: "Brownbasic")
var pinkbasic = texture(named: "Pinkbasic")
var blackbasic = texture(named: "Blackbasic")

var backgroundtexture = texture(named: "Backgroundtexture")

var ghostwhite = texture(named: "Ghostwhite")
var ghostgray = texture(named: "Ghostgray")
var ghostorange = texture(named: "Ghostorange")
var ghostblue = texture(named: "Ghostblue")
var ghostyellow = texture(named: "Ghostyellow")
var ghostcyan = texture(named: "Ghostcyan")
var ghostpurple = texture(named: "Ghostpurple")
var ghostred = texture(named: "Ghostred")
var ghostgreen = texture(named: "Ghostgreen")

// How fast naturally falling and softdropping will be. They will change as the player progresses.
var fallspeed = 25
var softdropfallspeed = 1
// These variables are used to drop the piece. The counters count down from their fallspeeds to 0. When they reach zero, the piece will move downwards and will be reset back to their fallspeeds.
var softdropcounter = 0
var fallCounter = 0
// These variables define how many tiles the piece will fall per fall/softdrop.
var fallTiles = 1
var softDropTiles = 1
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
//If the game is over, in a menu, or in play. (over, menu, play)
var gameState = "play"
enum Gamestate {
    case play, over, menu
}
// This variable is used to sense if the game should end.
/* When the piece is spawned, this variable is set to 1.
 if the mino moves, the variable is set to 0.
 if the piece lands when the variable is 1, the game will end. */
var gameOverCheck = 1
// an array for the line check
var linesToClear: [Int] = []
// The first "bag".
var bag1: [Tetromino] = []
// The second "bag".
var bag2: [Tetromino] = []
// Score.
var points = 0
// This variable is used to check for perfect clears.
var minosOnScreen = 0
// This variable is also used to check for perfect clears.
var tetrominosPlaced = 0
// Level.
var level = 1
// This variable is used to check for T-spins.
var lastSuccessfulAction = "0"
// The item in the hold.
var holdItem: Tetromino = Tetromino()
// The combo counter. Whenever the player doesn't clear a line, combo count resets. Whenever the player doea clear a line, the combo goes up. Getting a higher combo count gives the player more points.
var comboCount = 0

// The amount of lines that the player has cleared.
var linesCleared = 0

// This variable dissalows the use of hold spamming.
var holdAllowed = 0

//This is used to count how long the moveLabel should be not hidden.
var moveHideDelay = 0

//This variable is used to count down every time a line is cleared. When it reaches zero, the level variable increases by one and this var gets reset.
var linesUntilLevelUp = 0

createStyleColors()

createAllPieces()

// The current tetromino that will appear in the grid.
var tetromino: Tetromino = Tetromino()
// Create a new J tetromino.
tetromino = createJTetromino()

// The amount of perfect clears the player gets.
var perfectClears = 0

// The next and hold queue grids.
var nextQueueGrid = Grid()
var holdQueueGrid = Grid()

// These labels will act like this:

// Part that says "Score:"
var scoreLabel = Label()
// Part that says the value of the points var.
var scoreLabel2 = Label()

// Part that says "Level:"
var levelLabel = Label()
// Part that says the value of the level var.
var levelLabel2 = Label()

// Part that says "Lines:"
var linesClearedLabel = Label()
// Part that says the value of the linesCleared var.
var linesClearedLabel2 = Label()

// Part that says "Combo:"
var comboLabel = Label()
// Part that says the value of the combocount var.
var comboLabel2 = Label()

// Part that says "Placed:"
var blocksPlacedLabel = Label()
// Part that says the value of the blocksPlaced var.
var blocksPlacedLabel2 = Label()

// Part that says "Perfect clears:"
var perfectClearLabel = Label()
// Part that says the value of the perfectclears var.
var perfectClearLabel2 = Label()

// Next label.
var nextLabel = Label()

// Hold label.
var holdLabel = Label()

//This label is near the bottom of the screen. If you get a single, it will say "single" for some time.
var moveLabel = Label()



// This function is called once, before the game starts.
func first() {
    linesUntilLevelUp = 10
    minosOnScreen = 0
    tetrominosPlaced = 0
    points = 0
    setBackgroundTexture(backgroundtexture)
    fillBag(bag: 1)
    fillBag(bag: 2)
    
    createNextQueueGrid()
    createHoldQueueGrid()
    
    generateNextItem()
    spawnMino(perfectClearCheck: true)

    scoreLabel = createLabel(x: -1.25, y: 0.4, text: "Score:")
    scoreLabel2 = createLabel(x: -0.97, y: 0.4, text: String(points))
    
    levelLabel = createLabel(x: -1.25, y: 0.3, text: "Level:")
    levelLabel2 = createLabel(x: -0.97, y: 0.3, text: String(level))
    
    linesClearedLabel = createLabel(x: -1.25, y: 0.2, text: "Lines:")
    linesClearedLabel2 = createLabel(x: -0.97, y: 0.2, text: String(linesCleared))
    
    comboLabel = createLabel(x: -1.25, y: 0.1, text: "Combo:")
    comboLabel2 = createLabel(x: -0.97, y: 0.1, text: String(comboCount))
    
    blocksPlacedLabel = createLabel(x: -1.25, y: -0.1, text: "Placed:")
    blocksPlacedLabel2 = createLabel(x: -0.97, y: -0.1, text: String(tetrominosPlaced))

    moveLabel = createLabel(x: -1.25, y: -0.6, text: "poopy")
    moveLabel.isHidden = true
    
    holdLabel = createLabel(x: -0.92, y: 0.77, text: "Hold")
    nextLabel = createLabel(x: 0.68, y: 0.84, text: "Next")
    
    perfectClearLabel = createLabel(x: -1.25, y: 0.0, text: "Perfect clears:")
    perfectClearLabel2 = createLabel(x: -0.57, y: 0.0, text: String(perfectClears))
//
//    label2.color = "#ff3333"
//    label2.text = "Poopy"
//    label2.isHidden = false
}



func createNextQueueGrid() {
    // Create the next queue grid. The createGrid function must be called in the first function.
    // Parameters:
    //     cellsX, cellsY: The width and height of the grid, measured in cells.
    //     centerX, centerY: The position of the grid relative to the main grid.
    //         0.0, 0.0 is the center of the window.
    //         0.0, 1.0 is the top of the window.
    //         0.0, -1.0 is the bottom of the window.
    //         1.0, 0.0 is to the right of the center of the window.
    //     scale: The size of the cells.
    //         1.0 is the same size cells as in the main grid.
    nextQueueGrid = createGrid(cellsX: 4, cellsY: 22, centerX: 0.8, centerY: 0.05, scale: 2.0/3.0)
    
    // Some example code to show how to update the next queue grid.
    // We would not really execute this code here in the real implementation
    // of the next queue.

    // Set the next queue grid's background texture. We could leave this out
    // to make it blank, but it is useful to show how big the next queue grid is
    // during development.
//    nextQueueGrid.setBackgroundTexture(backgroundtexture)

    // Clear a cell in the next queue grid.
    nextQueueGrid.clearTexture(x: 0, y: 0)

    // Set some cells in the next queue grid.
    // nextQueueGrid.setTexture(redbasic, x: 0, y: 21)
    
    // Clears all next queueueue grid cells.
}
// Clears the ENTIRE next queueueue.
func clearNextQueue() {
    for y in 0..<nextQueueGrid.cellsY {
        for x in 0..<nextQueueGrid.cellsX {
            nextQueueGrid.clearTexture(x: x, y: y)
        }
    }
}
// Creates a next item at a specific item position with a specific shape and texture.
func drawTetrominoInNextQueue(pos: Int, tetromino: Tetromino) {
    tetromino.drawOnGrid(x: 0, y: 19 - (pos * 3), direction: 0, grid: nextQueueGrid)
}

func createHoldQueueGrid() {
    holdQueueGrid = createGrid(cellsX: 4, cellsY: 4, centerX: -0.8, centerY: 0.6, scale: 2.0/3.0)
}
// Clears the ENTIRE hold queue.
func clearHoldQueue() {
    for y in 0..<holdQueueGrid.cellsY {
        for x in 0..<holdQueueGrid.cellsX {
            holdQueueGrid.clearTexture(x: x, y: y)
        }
    }
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

func changeMoveLabel(name: String, color: String) {
    moveLabel.isHidden = false
    moveLabel.text = name
    moveLabel.color = color
    moveHideDelay = 180
}

func moveLabelUpdate() {
    moveHideDelay -= 1
    if moveHideDelay == 0 {
        moveLabel.isHidden = true
    }
}

// This function is called 60 times per second.
func update() {
    if gameState == "play" {
        levelLabel2 = createLabel(x: -0.97, y: 0.3, text: String(level))
        scoreLabel2 = createLabel(x: -0.97, y: 0.4, text: String(points))
            linesClearedLabel2 = createLabel(x: -0.97, y: 0.2, text: String(linesCleared))
        comboLabel2 = createLabel(x: -0.97, y: 0.1, text: String(comboCount))
        perfectClearLabel2 = createLabel(x: -0.57, y: 0.0, text: String(perfectClears))
        blocksPlacedLabel2 = createLabel(x: -0.9, y: -0.1, text: String(tetrominosPlaced))
        moveLabelUpdate()
        fallMino()
        softFall()
        checkForGameOver()
        //leftarrow
        if keyIsPressed(123) {
            if !keyIsPressed(124) {
                shiftAutoRepeatCounter += 1
                if shiftAutoRepeatCounter > framesUntilAutoRepeat {
                    shiftAutoRepeatCounter2 += 1
                    if shiftAutoRepeatCounter2 > autoRepeatSpeed {
                        if !tetromino.blockLeft() {
                            tetromino.moveBy(dx: -1, dy: 0, ddirection: 0)
                            lastSuccessfulAction = "move"
                            refreshSlideTimer()
                            shiftAutoRepeatCounter2 = 0
                        }
                    }
                }
            }
        }
        //rightarrow
        if keyIsPressed(124) {
            if !keyIsPressed(123) {
                shiftAutoRepeatCounter += 1
                if shiftAutoRepeatCounter > framesUntilAutoRepeat {
                    shiftAutoRepeatCounter2 += 1
                    if shiftAutoRepeatCounter2 > autoRepeatSpeed {
                        if !tetromino.blockRight() {
                            lastSuccessfulAction = "move"
                            tetromino.moveBy(dx: 1, dy: 0, ddirection: 0)
                            shiftAutoRepeatCounter2 = 0
                        }
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
func spawnMino(perfectClearCheck: Bool){
    if gameState == "play" {
        if perfectClearCheck {
            if minosOnScreen == 0 && tetrominosPlaced != 0 {
                perfectClearSound.play()
                print("Perfect clear")
                perfectClears += 1
                if perfectClears == 1 {
                    scorePoints(amount: 5000, strong: false)
                } else if perfectClears == 2 {
                    scorePoints(amount: 10000, strong: false)
                } else {
                    scorePoints(amount: 15000, strong: false)
                }
                
            }
        }
        setFallSpeeds()
        holdAllowed -= 1
        if !diagonalMove {
            shiftAutoRepeatCounter = 0
        }
        fallCounter = 0
        tetromino = nextItem
        showNextItems()
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
            if keyIsPressed(125) {
                if hardDropInstantLock == 0 {
                    slidetimer = 0
                    stRefreshes = 0
                    fallCounter = 0
                    softdropcounter = 0
                }
            }
            if slidetimer < 2 {
                minosOnScreen += 4
                tetrominosPlaced += 1
                linecheck()
                spawnMino(perfectClearCheck: true)
            }
            return
        }
        if !tetromino.onGround() {
            gameOverCheck = 0
            lastSuccessfulAction = "drop"
            if keyIsPressed(125) {
                for _ in 0..<softDropTiles {
                    tetromino.moveBy(dx: 0, dy: -1, ddirection: 0)
                    points += 1
                }
            } else {
                for _ in 0..<fallTiles {
                    tetromino.moveBy(dx: 0, dy: -1, ddirection: 0)
                }
            }
        }
    }
    
}

//line clear
func clearline(y: Int) {
    linesCleared += 1
    linesUntilLevelUp -= 1
    if linesUntilLevelUp < 1 {
        linesUntilLevelUp = 10
        if level != 20 {
            level += 1
        }
    }
    minosOnScreen -= gridSizeX
    for ye in y..<gridSizeY {
        for x in 0..<gridSizeX {
            let texture = textureAt(x: x, y: ye + 1)
            setTexture(texture, x: x, y: ye)

        }
    }
}

// check for lines
func linecheck() {
    linesToClear = []
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
            lineScore += 1
            linesToClear.append(y)
        }
        y += 1
    }
    scoreLines()
    clearLines()
}
func clearLines(){
    var linesErased = 0
    for y in linesToClear {
        clearline(y: y - linesErased)
        linesErased += 1
    }
    linesToClear = []
}

func checkForGameOver() {
    if gameOverCheck == 1 && tetromino.onGround() {
        gameState = "over"
        tetromino.removeFromGrid()
        tetromino = createInstaclearTetromino()
        tetromino.addToGridAt(x: 3, y: gridSizeY - 5, direction: 0)
        print("Game over!")
        changeMoveLabel(name: "Game over!", color: "FFAA22")
    }
}

func fillBag(bag: Int) {
    if bag == 1 {
        bag1.removeAll()
        bag1.append(createOTetromino())
        bag1.append(createITetromino())
        bag1.append(createTTetromino())
        bag1.append(createSTetromino())
        bag1.append(createZTetromino())
        bag1.append(createJTetromino())
        bag1.append(createLTetromino())
        bag1.shuffle()
    }
    if bag == 2 {
        bag2.removeAll()
        bag2.append(createOTetromino())
        bag2.append(createITetromino())
        bag2.append(createTTetromino())
        bag2.append(createSTetromino())
        bag2.append(createZTetromino())
        bag2.append(createJTetromino())
        bag2.append(createLTetromino())
        bag2.shuffle()
    }
}

//This moves the bags down one.
func swapBags() {
    bag1 = bag2
    fillBag(bag: 2)
}


// This function is called whenever the user presses a key.
func keyPress(key: Int) {
    if gameState == "play" {
        //rotateright   UP              X
        if key == (126) || key == (7){
            rotateSound.play()
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
            rotateSound.play()
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
            shiftSound.play()
            shiftAutoRepeatCounter = 0
            if !tetromino.blockLeft(){
                lastSuccessfulAction = "move"
                tetromino.moveBy(dx: -1, dy: 0, ddirection: 0)
                refreshSlideTimer()
            }
            
        }
        //rightarrow
        if key == (124) {
            shiftSound.play()
            shiftAutoRepeatCounter = 0
            if !tetromino.blockRight(){
                lastSuccessfulAction = "move"
                tetromino.moveBy(dx: 1, dy: 0, ddirection: 0)
                refreshSlideTimer()
            }
            
        }
        
        //harddrop
        if key == (49) {
            while !tetromino.onGround() {
                tetromino.moveBy(dx: 0, dy: -1, ddirection: 0)
                points += 2
            }
            lastSuccessfulAction = "harddrop"
            if hardDropInstantLock == 1{
                slidetimer = 0
                stRefreshes = 0
                fallCounter = -1
            }
        }
        
        //Hold
        if key == (8) {
            if holdItem.name != "" {
                if holdAllowed < 1 {
                    let holdTemp: Tetromino = tetromino
                    holdSound.play()
                    clearHoldQueue()
                    holdAllowed = 1
                    tetromino.removeFromGrid()
                    tetromino.drawOnGrid(x: 0, y: 0, direction: 0, grid: holdQueueGrid)
                    tetromino = holdItem
                    stRefreshes = stMaxRefreshes
                    slidetimer = stickdelay
                    if tetromino.name == "I" {
                        tetromino.addToGridAt(x: (gridSizeX / 2) - 2, y: gridSizeY - 5, direction: 0)
                    } else {
                        tetromino.addToGridAt(x: (gridSizeX / 2) - 2, y: gridSizeY - 4, direction: 0)
                    }
                    holdItem = holdTemp
                } else {
                    holdFail.play()
                    changeMoveLabel(name: "Can't hold!", color: "FF0000")
                }
            } else {
                holdSound.play()
                tetromino.removeFromGrid()
                tetromino.drawOnGrid(x: 0, y: 0, direction: 0, grid: holdQueueGrid)
                holdItem = tetromino
                holdAllowed = 2
                stRefreshes = stMaxRefreshes
                slidetimer = stickdelay
                print ("hold item:",holdItem.name)
                spawnMino(perfectClearCheck: false)
            }
            
        }
    }
}


func generateNextItem() {
    if bag1.count == 0 {
        swapBags()
    }
    nextItem = bag1[0]
    bag1.removeFirst()
}

func addNextItem(pos: Int) {
    var tetromino = Tetromino()
    
    if pos < bag1.count {
        tetromino = bag1[pos]
    } else {
        tetromino = bag2[pos - bag1.count]
    }
    drawTetrominoInNextQueue(pos: pos, tetromino: tetromino)
}

func showNextItems() {
    clearNextQueue()
    for item in 0..<nextItems {
        addNextItem(pos: item)
    }
}

func replaceAllTexturesWith(texture: Int) {
    var y = 0
    while y < gridSizeY {
        tilesinline = 0
        for x in 0..<gridSizeX {
            if hasTextureAt (x: x, y: y) {
                setTexture(texture, x: x, y: y)
            }
        }
        y += 1
    }

}

// This function starts the game and must be called at the end of the file.
start()

