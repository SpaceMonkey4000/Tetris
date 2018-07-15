
// Size of the grid in cells.
let gridSizeX = 10
let gridSizeY = 24

// The number of rows that are hidden beyond the top of the scren.
let hiddenMatrixRows = 3.8
var softfallcounter = 0
let garbage = texture(named: "Garbageicon")
let orangebasic = texture(named: "Orangebasic")
var fallspeed = 30
var softdropfallspeed = 1

let lNorth = Shape()
let lSouth = Shape()
let lEast = Shape()
let lWest = Shape()

var shape: Shape = lEast

var fallCounter = 0
var pantsX = 0
var pantsY = 0
var slidetimer = 0
var stickdelay = 30
var tilesinline = 0

var stRefreshes = 0
let stMaxRefreshes = 15

// This function is called once, before the game starts.
func first() {
    spawnMino()
    // The lower left corner of the grid is coordinate 0, 0.
    // This makes a row of tiles appear at the bottom of the screen.
    for a in 0..<7 {
        setTexture(garbage, x: a, y: 0)
    }

    createShapes()

//    lNorth.draw(x: 0, y: 10)
//    lNorth.draw(x: 1, y: 14)
}

func createShapes() {
    createLpieces()
}

func refreshSlideTimer() {
    if hasTextureAt(x: pantsX, y: pantsY - 1) || pantsY == 0{
        stRefreshes -= 1
        slidetimer = stickdelay
        if stRefreshes < 1 {
            slidetimer = 1
        }
    }
}

// This function is called 60 times per second.
func update() {
    print("slidetimer=",slidetimer)
    print("refreshes=",stRefreshes)
    fallMino()
    softFall()
//leftarrow
    if keyIsPressed(123) {
        shape.erase(x: pantsX, y: pantsY)
        
        if !shape.collides(x: pantsX - 1, y: pantsY) && !shape.collidesWithEdgeOfGrid(x: pantsX - 1, y: pantsY){
            pantsX = pantsX - 1
            refreshSlideTimer()
        }
        shape.draw(x: pantsX, y: pantsY)
    }
//rightarrow
    if keyIsPressed(124) {
        shape.erase(x: pantsX, y: pantsY)

        if !shape.collides(x: pantsX + 1, y: pantsY) && !shape.collidesWithEdgeOfGrid(x: pantsX + 1, y: pantsY){
            pantsX = pantsX + 1
            refreshSlideTimer()
        }

        shape.draw(x: pantsX, y: pantsY)

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
    slidetimer = stickdelay
    pantsX = 5
    pantsY = gridSizeY - 7
    stRefreshes = stMaxRefreshes
}

func fallMino() {
    shape.erase(x: pantsX, y: pantsY)

    if shape.collides(x: pantsX, y: pantsY - 1) || shape.collidesWithEdgeOfGrid(x: pantsX, y: pantsY - 1){
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

        if shape.collides(x: pantsX, y: pantsY - 1) || shape.collidesWithEdgeOfGrid(x: pantsX, y: pantsY - 1){
            shape.draw(x: pantsX, y: pantsY)
            
            if slidetimer < 2 {
                linecheck()
                spawnMino()
            }
            return
        }
        
        pantsY -= 1
    }
    
    shape.draw(x: pantsX, y: pantsY)
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
}

// This function is called whenever the user presses a key.
func keyPress(key: Int) {
    print("key =", key)
}
func createLpieces() {
    createLnorth()
    createLsouth()
    createLeast()
    createLwest()
}

func createLnorth() {
    lNorth.texture = orangebasic
    lNorth.addMino(mx: 0, my: 1)
    lNorth.addMino(mx: 1, my: 1)
    lNorth.addMino(mx: 2, my: 1)
    lNorth.addMino(mx: 2, my: 2)
}
func createLsouth() {
    lSouth.texture = orangebasic
    lSouth.addMino(mx: 0, my: 0)
    lSouth.addMino(mx: 0, my: 1)
    lSouth.addMino(mx: 1, my: 1)
    lSouth.addMino(mx: 2, my: 1)
}
func createLeast() {
    lEast.texture = orangebasic
    lEast.addMino(mx: 1, my: 1)
    lEast.addMino(mx: 1, my: 0)
    lEast.addMino(mx: 2, my: 0)
    lEast.addMino(mx: 1, my: 2)
}
func createLwest() {
    lWest.texture = orangebasic
    lWest.addMino(mx: 0, my: 2)
    lWest.addMino(mx: 1, my: 1)
    lWest.addMino(mx: 1, my: 0)
    lWest.addMino(mx: 1, my: 2)
}
// This function starts the game and must be called at the end of the file.
start()

