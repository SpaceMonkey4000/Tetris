import Foundation

func scoreLines(){
    if tetromino.name == "T" {
        tSpinScore()
        return
    } else {
        spinScore()
        return
    }
}

//Handles scoring if no spins have been performed.
func noSpinScore() {
    if lineScore == 1 {
        print("Single")
    } else if lineScore == 2 {
        print("Double")
    } else if lineScore == 3 {
        print("Triple")
    } else if lineScore == 4 {
        print("Tetris")
    } else if lineScore == 5 {
        print("Tetris plus")
    } 
}

//Handles scoring if spins other than T have been performed.
func spinScore() {
    if sSpinsRewarded{
        if tetromino.name == "S" {
            noSpinScore()
        }
    }
    if zSpinsRewarded{
        if tetromino.name == "Z" {
            noSpinScore()
        }
    }
    if lSpinsRewarded{
        if tetromino.name == "L" {
            noSpinScore()
        }
    }
    if jSpinsRewarded{
        if tetromino.name == "J" {
            noSpinScore()
        }
    }
    if iSpinsRewarded{
        if tetromino.name == "I" {
            noSpinScore()
        }
    }
    if oSpinsRewarded{
        if tetromino.blocked() {
            if tetromino.name == "O"{
                if lineScore == 0 {
                    print("O-spin")
                } else if lineScore == 1 {
                    print("O-spin single")
                } else if lineScore == 2 {
                    print("O-spin double")
                }
            } else {
                noSpinScore()
                return
            }
        } else {
            noSpinScore()
        }
    }
    
}

func tSpinScore () {
    threeCornerTest()
}
//3corner test
func threeCornerTest() {
    var cornersFull = 0
    cornersFull = 0
    if tetromino.relativeBlockAt(dx: 1, dy: 1) {
        cornersFull += 1
    }
    if tetromino.relativeBlockAt(dx: -1, dy: 1) {
        cornersFull += 1
    }
    if tetromino.relativeBlockAt(dx: -1, dy: -1) {
        cornersFull += 1
    }
    if tetromino.relativeBlockAt(dx: 1, dy: -1) {
        cornersFull += 1
    }
    if cornersFull > 2 {
        if tetromino.blocked() {
            if lineScore == 0 {
                print ("T spin")
            }
            if lineScore == 1 {
                print ("T spin single")
            }
            if lineScore == 2 {
                print ("T spin double")
            }
            if lineScore == 3 {
                print ("T spin triple")
            }
        } else {
            noSpinScore()
            return
        }
    } else {
        noSpinScore()
    }
}
