import Foundation

func setFallSpeeds() {
    if level == 1 {
        fallspeed = 50
        softdropfallspeed = 3
        fallTiles = 1
        softDropTiles = 1
    } else if level == 2 {
        fallspeed = 45
        softdropfallspeed = 3
        fallTiles = 1
        softDropTiles = 1
    } else if level == 3 {
        fallspeed = 40
        softdropfallspeed = 3
        fallTiles = 1
        softDropTiles = 1
    } else if level == 4 {
        fallspeed = 35
        softdropfallspeed = 2
        fallTiles = 1
        softDropTiles = 1
    } else if level == 5 {
        fallspeed = 30
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 1
    } else if level == 6 {
        fallspeed = 25
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 1
    } else if level == 7 {
        fallspeed = 20
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 2
    } else if level == 8 {
        fallspeed = 17
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 2
    } else if level == 9 {
        fallspeed = 14
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 2
    } else if level == 10 {
        fallspeed = 11
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 3
    } else if level == 11 {
        fallspeed = 8
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 3
    } else if level == 12 {
        fallspeed = 6
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 3
    } else if level == 13 {
        fallspeed = 3
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 4
    } else if level == 14 {
        fallspeed = 2
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 4
    } else if level == 15 {
        fallspeed = 1
        softdropfallspeed = 1
        fallTiles = 1
        softDropTiles = 5
    } else if level == 16 {
        fallspeed = 1
        softdropfallspeed = 1
        fallTiles = 2
        softDropTiles = 5
    } else if level == 17 {
        fallspeed = 1
        softdropfallspeed = 1
        fallTiles = 3
        softDropTiles = 5
    } else if level == 18 {
        fallspeed = 1
        softdropfallspeed = 1
        fallTiles = 4
        softDropTiles = 5
    } else if level == 19 {
        fallspeed = 1
        softdropfallspeed = 1
        fallTiles = 5
        softDropTiles = 5
    } else if level == 20 {
        fallspeed = 1
        softdropfallspeed = 1
        fallTiles = 20
        softDropTiles = 5
    } else {
        assertionFailure("Level value expected to be in a normal range.")
    }
}
