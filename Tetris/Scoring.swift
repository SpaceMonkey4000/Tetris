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
        basicSpinScore(message: "L-spin")
    case "J":
        basicSpinScore(message: "J-spin")
    case "S":
        basicSpinScore(message: "S-spin")
    case "Z":
        basicSpinScore(message: "Z-spin")
    case "I":
        basicSpinScore(message: "I-spin")
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
        if lastSuccessfulAction == "rotate" {
            if lineScore == 0 {
                if miniTspin() {
                    print ("T-spin mini")
                } else {
                    print ("T-spin")
                }
            }
            if lineScore == 1 {
                if miniTspin() {
                    print ("T-spin mini single")
                } else {
                    print ("T-spin single")
                }
            }
            if lineScore == 2 {
                print ("T-spin double")
            }
            if lineScore == 3 {
                print ("T-spin triple")
            }
        } else {
            noSpinScore()
            return
        }
    } else {
        noSpinScore()
    }
}

func miniTspin() -> Bool {
    if lastTranslationWas(dx: -1, dy: -1, ddirection: 1) || lastTranslationWas(dx: 1, dy: -1, ddirection: -1){
        return true
    } else if lastTranslationWas(dx: -1, dy: 0, ddirection: 1) || lastTranslationWas(dx: 1, dy: 0, ddirection: -1){
        return true
    } else {
        return false
    }
}

func lastTranslationWas(dx: Int, dy: Int, ddirection: Int) -> Bool {
    if tetromino.lastXmovement == dx && tetromino.lastYmovement == dy && tetromino.lastDirMovement == ddirection {
        return true
    } else {
        return false
    }
}

func basicSpinScore(message: String) {
    if tetromino.blocked() {
        if lineScore == 0 {
            print(message)
        } else if lineScore == 1 {
            print(message,"single")
        } else if lineScore == 2 {
            print(message,"double")
        } else if lineScore == 3 {
            print(message,"triple")
        } else if lineScore == 4 {
            print(message,"quadruple")
        }
    } else {
        noSpinScore()
    }
}
