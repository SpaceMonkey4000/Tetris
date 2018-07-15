
// Size of the grid in cells.
let gridSizeX = 10
let gridSizeY = 24

// The number of rows that are hidden beyond the top of the screen.
let hiddenMatrixRows = 3.8
var softfallcounter = 0

var fallspeed = 30
var softdropfallspeed = 2

let garbage = texture(named: "Garbageicon")

var shape: Shape = iEast

var fallCounter = 0
var tX = 0
var tY = 0
var slidetimer = 0
var stickdelay = 30
var tilesinline = 0

var dirCounter = 0
var softdropCounter = 0

var autoRepeatSpeed = 2
var dirCounter2 = 0
var nextItem: Shape = monomino

var stRefreshes = 0
let stMaxRefreshes = 99999

let debugTools = 1

var rng1 = 0


createAllPieces()

// This function is called once, before the game starts.
func first() {
    generateNextItem()
    print("Next mino is: ",nextItem)
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
    if hasTextureAt(x: tX, y: tY - 1) || tY == 0{
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
        shape.erase(x: tX, y: tY)
        
        if !shape.collides(x: tX - 1, y: tY) && !shape.collidesWithEdgeOfGrid(x: tX - 1, y: tY){
            tX = tX - 1
            refreshSlideTimer()
            }
            shape.draw(x: tX, y: tY)
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
                shape.erase(x: tX, y: tY)
                
                if !shape.collides(x: tX + 1, y: tY) && !shape.collidesWithEdgeOfGrid(x: tX + 1, y: tY){
                    tX = tX + 1
                    refreshSlideTimer()
                }
                
                shape.draw(x: tX, y: tY)
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
    shape = nextItem
    generateNextItem()
    print("Next mino is: ",nextItem)
    

    slidetimer = stickdelay
    tX = 3
    tY = gridSizeY - 4
    stRefreshes = stMaxRefreshes
}

func fallMino() {
    shape.erase(x: tX, y: tY)

    if shape.collides(x: tX, y: tY - 1) || shape.collidesWithEdgeOfGrid(x: tX, y: tY - 1){
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

        if shape.collides(x: tX, y: tY - 1) || shape.collidesWithEdgeOfGrid(x: tX, y: tY - 1){
            shape.draw(x: tX, y: tY)
            
            if slidetimer < 2 {
                linecheck()
                spawnMino()
            }
            return
        }
        
        tY -= 1
    }
    
    shape.draw(x: tX, y: tY)
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
    }
}

// This function is called whenever the user presses a key.
func keyPress(key: Int) {
    //leftarrow
    if keyIsPressed(123) {
        dirCounter = 0
        shape.erase(x: tX, y: tY)
        
        if !shape.collides(x: tX - 1, y: tY) && !shape.collidesWithEdgeOfGrid(x: tX - 1, y: tY){
            tX = tX - 1
            refreshSlideTimer()
        }
        shape.draw(x: tX, y: tY)
    }
    //rightarrow
    if keyIsPressed(124) {
        dirCounter = 0
        shape.erase(x: tX, y: tY)
        
        if !shape.collides(x: tX + 1, y: tY) && !shape.collidesWithEdgeOfGrid(x: tX + 1, y: tY){
            tX = tX + 1
            refreshSlideTimer()
        }
        
        shape.draw(x: tX, y: tY)
        
    }
    //spacebar (harddrop)
    if keyIsPressed(49) {
        shape.erase(x: tX, y: tY)
        while !shape.collides(x: tX, y: tY - 1) && !shape.collidesWithEdgeOfGrid(x: tX, y: tY - 1){
            tY = tY - 1
        }
        shape.draw(x: tX, y: tY)
        slidetimer = 0
        stRefreshes = 0
    }
    if debugTools == 1 {
        if keyIsPressed(0) {
            shape.erase(x: tX, y: tY)
                spawnMino()
        }
        if keyIsPressed(1) {
            shape.erase(x: tX, y: tY)
            shape = monomino
            shape.draw (x: tX, y: tY)
        }
        if keyIsPressed(2) {
            shape.erase(x: tX, y: tY)
            shape = instaClear
            shape.draw (x: tX, y: tY)
        }
        if keyIsPressed(3) {
            shape.erase(x: tX, y: tY)
            shape = tetrisplus
            shape.draw (x: tX, y: tY)
        }
    }
}
func generateNextItem() {
    rng1 = random(min: 0, max: 6)
        switch rng1 {
        case 0:
            nextItem = iNorth
        case 1:
            nextItem = tNorth
        case 2:
            nextItem = oNorth
        case 3:
            nextItem = lNorth
        case 4:
            nextItem = jNorth
        case 5:
            nextItem = sNorth
        case 6:
            nextItem = zNorth
        default:
            nextItem = monomino
    }

    
}

// This function starts the game and must be called at the end of the file.
start()





















//hello
