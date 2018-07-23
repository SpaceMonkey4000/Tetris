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
        return
    } else if lineScore == 2 {
        print("Double")
        return
    } else if lineScore == 3 {
        print("Triple")
        return
    } else if lineScore == 4 {
        print("Tetris")
        return
    }
}

//Handles scoring if spins other than T have been performed.
func spinScore() {
    switch tetromino.name {
    case "L":
        noSpinScore()
    case "J":
        noSpinScore()
    case "S":
        noSpinScore()
    case "Z":
        noSpinScore()
    case "I":
        noSpinScore()
    case "O":
        if tetromino.blocked() {
            if lineScore == 0 {
                print("O-spin")
            } else if lineScore == 1 {
                print("O-spin single")
            } else if lineScore == 2 {
                print("O-spin double")
            }
        } else {
            noSpinScore()
        }
    default:
        noSpinScore()
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
