import Foundation

var backToBackBonus = 0

func scoreLines(){
    if comboCount > 0 {
        points += 50 * comboCount * level
    }
    comboCount += 1
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
        scorePoints(amount: 100, strong: false)
        if perfectClearing == 0 {
            lineSound.play()
        }
        perfectClearing = 0
        return
    } else if lineScore == 2 {
        print("Double")
        scorePoints(amount: 300, strong: false)
        if perfectClearing == 0 {
            lineSound.play()
        }
        perfectClearing = 0
        return
    } else if lineScore == 3 {
        print("Triple")
        scorePoints(amount: 500, strong: false)
        if perfectClearing == 0 {
            lineSound.play()
        }
        perfectClearing = 0
        return
    } else if lineScore == 4 {
        scorePoints(amount: 800, strong: true)
        print("Tetris")
        if perfectClearing == 0 {
            tetrisSound.play()
        }
        perfectClearing = 0
        return
    } else if lineScore == 0 {
        comboCount = 0
        if perfectClearing == 0 {
            landSound.play()
        }
        perfectClearing = 0
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
                comboCount = 0
                print("O-spin")
                scorePoints(amount: 400, strong: true)
                if perfectClearing == 0 {
                    landSound.play()
                }
                perfectClearing = 0
            } else if lineScore == 1 {
                scorePoints(amount: 800, strong: true)
                print("O-spin single")
                if perfectClearing == 0 {
                    tetrisSound.play()
                }
                perfectClearing = 0
            } else if lineScore == 2 {
                scorePoints(amount: 1200, strong: true)
                print("O-spin double")
                if perfectClearing == 0 {
                    tetrisSound.play()
                }
                perfectClearing = 0
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
                comboCount = 0
                if miniTspin() {
                    print ("T-spin mini")
                    scorePoints(amount: 100, strong: true)
                    if perfectClearing == 0 {
                       landSound.play()
                    }
                    perfectClearing = 0
                } else {
                    print ("T-spin")
                    scorePoints(amount: 400, strong: true)
                    if perfectClearing == 0 {
                        landSound.play()
                    }
                    perfectClearing = 0
                }
            }
            if lineScore == 1 {
                if miniTspin() {
                    print ("T-spin mini single")
                    scorePoints(amount: 200, strong: true)
                    if perfectClearing == 0 {
                        tetrisSound.play()
                    }
                    perfectClearing = 0
                } else {
                    print ("T-spin single")
                    scorePoints(amount: 800, strong: true)
                    if perfectClearing == 0 {
                        tetrisSound.play()
                    }
                    perfectClearing = 0
                }
            }
            if lineScore == 2 {
                print ("T-spin double")
                scorePoints(amount: 1200, strong: true)
                if perfectClearing == 0 {
                    tetrisSound.play()
                }
                perfectClearing = 0
            }
            if lineScore == 3 {
                print ("T-spin triple")
                scorePoints(amount: 1600, strong: true)
                if perfectClearing == 0 {
                    tetrisSound.play()
                }
                perfectClearing = 0
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
            comboCount = 0
            scorePoints(amount: 400, strong: true)
            if perfectClearing == 0 {
                landSound.play()
            }
            perfectClearing = 0
            print(message)
        } else if lineScore == 1 {
            scorePoints(amount: 800, strong: true)
            if perfectClearing == 0 {
                tetrisSound.play()
            }
            perfectClearing = 0
            print(message,"single")
        } else if lineScore == 2 {
            scorePoints(amount: 1200, strong: true)
            if perfectClearing == 0 {
                tetrisSound.play()
            }
            perfectClearing = 0
            print(message,"double")
        } else if lineScore == 3 {
            scorePoints(amount: 1600, strong: true)
            if perfectClearing == 0 {
                tetrisSound.play()
            }
            perfectClearing = 0
            print(message,"triple")
        } else if lineScore == 4 {
            scorePoints(amount: 1800, strong: true)
            if perfectClearing == 0 {
                tetrisSound.play()
            }
            perfectClearing = 0
            print(message,"quadruple")
        }
    } else {
        noSpinScore()
    }
}
func scorePoints(amount: Int, strong: Bool) {
    if comboCount > 4 {
        perfectClearSound.play()
    }
    if strong {
        if backToBackBonus == 1 {
            points += ((amount * level) / 2)
        }
            backToBackBonus = 1
    } else {
        backToBackBonus = 0
    }
    points += (amount * level)
}
