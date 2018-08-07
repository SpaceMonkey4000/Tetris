import Foundation

var levelThirtyMessagePlayed = false

func setFallSpeeds() {
    if gameMode == "basicShort" {
        if level == 16 {
            winGame()
        }
    }
    if gameMode == "basicMedium" {
        if level == 21 {
            winGame()
        }
    }
    if gameMode == "basicLong" {
        if level == 31 {
            winGame()
        }
    }
    
    if level == 1 {
        fallspeed = 60
        softdropfallspeed = 3
        fallTiles = 1
        softDropTiles = 1
    } else if level == 2 {
        fallspeed = 55
        softdropfallspeed = 3
        fallTiles = 1
        softDropTiles = 1
    } else if level == 3 {
        fallspeed = 50
        softdropfallspeed = 2
        fallTiles = 1
        softDropTiles = 1
    } else if level == 4 {
        fallspeed = 45
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 1
    } else if level == 5 {
        fallspeed = 40
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 1
    } else if level == 6 {
        fallspeed = 35
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 1
    } else if level == 7 {
        fallspeed = 30
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 1
    } else if level == 8 {
        fallspeed = 25
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 1
    } else if level == 9 {
        fallspeed = 20
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 1
    } else if level == 10 {
        fallspeed = 15
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 2
    } else if level == 11 {
        fallspeed = 10
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 2
    } else if level == 12 {
        fallspeed = 5
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 2
    } else if level == 13 {
        fallspeed = 4
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 2
    } else if level == 14 {
        fallspeed = 3
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 2
    } else if level == 15 {
        fallspeed = 2
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 3
    } else if level == 16 {
        fallspeed = 1
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 3
    } else if level == 17 {
        fallspeed = 1
        softdropfallspeed = 1
        fallTiles = 2
        softDropTiles = 4
    } else if level == 18 {
        fallspeed = 1
        softdropfallspeed = 1
        fallTiles = 3
        softDropTiles = 5
    } else if level == 19 {
        fallspeed = 1
        softdropfallspeed = 1
        fallTiles = 4
        softDropTiles = 7
    } else if level == 20 {
        fallspeed = 1
        softdropfallspeed = 1
        fallTiles = 20
        softDropTiles = 20
    } else if level == 21 {
        fallspeed = 1
        softdropfallspeed = 1
        fallTiles = 20
        softDropTiles = 20
        stickDelayReduction = 1
    } else if level == 22 {
        fallspeed = 1
        softdropfallspeed = 1
        fallTiles = 20
        softDropTiles = 20
        stickDelayReduction = 2
    } else if level == 23 {
        fallspeed = 1
        softdropfallspeed = 1
        fallTiles = 20
        softDropTiles = 20
        stickDelayReduction = 3
    } else if level == 24 {
        fallspeed = 1
        softdropfallspeed = 1
        fallTiles = 20
        softDropTiles = 20
        stickDelayReduction = 4
    } else if level == 25 {
        fallspeed = 1
        softdropfallspeed = 1
        fallTiles = 20
        softDropTiles = 20
        stickDelayReduction = 5
    } else if level == 26 {
        fallspeed = 1
        softdropfallspeed = 1
        fallTiles = 20
        softDropTiles = 20
        stickDelayReduction = 6
    } else if level == 27 {
        fallspeed = 1
        softdropfallspeed = 1
        fallTiles = 20
        softDropTiles = 20
        stickDelayReduction = 7
    } else if level == 28 {
        fallspeed = 1
        softdropfallspeed = 1
        fallTiles = 20
        softDropTiles = 20
        stickDelayReduction = 8
    } else if level == 29 {
        fallspeed = 1
        softdropfallspeed = 1
        fallTiles = 20
        softDropTiles = 20
        stickDelayReduction = 9
    } else if level == 30 {
        replaceAllTexturesWith(texture: bloodbasic)
        fallspeed = 1
        softdropfallspeed = 1
        fallTiles = 20
        softDropTiles = 20
        if levelThirtyMessagePlayed == false {
            levelThirtyMessagePlayed = true
            changeMoveLabel(name: "Good luck!", color: "FF0000")
            linesUntilLevelUp = 1
            maxLevelSound.play()
        }
        stickDelayReduction = 15
    } else {
        winGame()
    }
}
