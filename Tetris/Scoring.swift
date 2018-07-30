import Foundation

var backToBackBonus = 0

func scoreLines(){
    landSound.play()
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
        changeMoveLabel(name: "Single", color: "FFFFFF")
        scorePoints(amount: 100, strong: false)
        lineSound.play()
        return
    } else if lineScore == 2 {
        changeMoveLabel(name: "Double", color: "FFFFFF")
        scorePoints(amount: 300, strong: false)
        lineSound.play()
        return
    } else if lineScore == 3 {
        changeMoveLabel(name: "Triple", color: "FFFFFF")
        scorePoints(amount: 500, strong: false)
        lineSound.play()
        return
    } else if lineScore == 4 {
        if backToBackBonus == 1 {
            changeMoveLabel(name: "Back to back tetris", color: "FFFFFF")
        } else {
            changeMoveLabel(name: "Tetris", color: "FFFFFF")
        }
        scorePoints(amount: 800, strong: true)
        tetrisSound.play()
        return
    } else if lineScore == 0 {
        comboCount = 0
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
                if backToBackBonus == 1 {
                    changeMoveLabel(name: "Back to back O-spin", color: "FFFFFF")
                } else {
                    changeMoveLabel(name: "O-spin", color: "FFFFFF")
                }
                    landSound.play()
                scorePoints(amount: 400, strong: true)
            } else if lineScore == 1 {
                print("O-spin single")
                if backToBackBonus == 1 {
                    changeMoveLabel(name: "Back to back O-spin single", color: "FFFFFF")
                } else {
                    changeMoveLabel(name: "O-spin single", color: "FFFFFF")
                }
                    tetrisSound.play()
                scorePoints(amount: 800, strong: true)
            } else if lineScore == 2 {
                print("O-spin double")
                if backToBackBonus == 1 {
                    changeMoveLabel(name: "Back to back O-spin double", color: "FFFFFF")
                } else {
                    changeMoveLabel(name: "O-spin double", color: "FFFFFF")
                }
                    tetrisSound.play()
                scorePoints(amount: 1200, strong: true)
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
                    if backToBackBonus == 1 {
                        changeMoveLabel(name: "Back to back T-spin mini", color: "FFFFFF")
                    } else {
                        changeMoveLabel(name: "T-spin mini", color: "FFFFFF")
                    }
                    scorePoints(amount: 100, strong: true)
                       landSound.play()
                } else {
                    print("T-spin")
                    if backToBackBonus == 1 {
                        changeMoveLabel(name: "Back to back T-spin", color: "FFFFFF")
                    } else {
                        changeMoveLabel(name: "T-spin", color: "FFFFFF")
                    }
                    scorePoints(amount: 400, strong: true)
                        landSound.play()
                }
            }
            if lineScore == 1 {
                if miniTspin() {
                    print ("T-spin mini single")
                    if backToBackBonus == 1 {
                        changeMoveLabel(name: "Back to back T-spin mini sing;e", color: "FFFFFF")
                    } else {
                        changeMoveLabel(name: "T-spin mini single", color: "FFFFFF")
                    }
                    scorePoints(amount: 200, strong: true)
                        tetrisSound.play()
                } else {
                    changeMoveLabel(name: "T-spin single", color: "FFFFFF")
                    print ("T-spin single")
                    scorePoints(amount: 800, strong: true)
                        tetrisSound.play()
                }
            }
            if lineScore == 2 {
                if backToBackBonus == 1 {
                    changeMoveLabel(name: "Back to back T-spin double", color: "FFFFFF")
                } else {
                    changeMoveLabel(name: "T-spin double", color: "FFFFFF")
                }
                scorePoints(amount: 1200, strong: true)
                    tetrisSound.play()
            }
            if lineScore == 3 {
                if backToBackBonus == 1 {
                    changeMoveLabel(name: "Back to back T-spin triple", color: "FFFFFF")
                } else {
                    changeMoveLabel(name: "T-spin triple", color: "FFFFFF")
                }
                scorePoints(amount: 1600, strong: true)
                    tetrisSound.play()
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

// Add a color parameter to this function. Use the color for the movelabeling.
func basicSpinScore(message: String) {
    if tetromino.blocked() {
        if lineScore == 0 {
            comboCount = 0
                landSound.play()
            if backToBackBonus == 1 {
                changeMoveLabel(name: "back to back " + message, color: "FFFFFF")
            } else {
                changeMoveLabel(name: message, color: "FFFFFF")
            }
            scorePoints(amount: 400, strong: true)
        } else if lineScore == 1 {
                tetrisSound.play()
            print(message,"single")
            if backToBackBonus == 1 {
                changeMoveLabel(name: "Back to back " + message + " single", color: "FFFFFF")
            } else {
                changeMoveLabel(name: message + " single", color: "FFFFFF")
            }
            scorePoints(amount: 800, strong: true)
        } else if lineScore == 2 {
                tetrisSound.play()
            print(message,"double")
            if backToBackBonus == 1 {
                changeMoveLabel(name: "Back to back " + message + " double", color: "FFFFFF")
            } else {
                changeMoveLabel(name: message + " double", color: "FFFFFF")
            }
            scorePoints(amount: 1200, strong: true)
        } else if lineScore == 3 {
                tetrisSound.play()
            print(message,"triple")
            if backToBackBonus == 1 {
                changeMoveLabel(name: "Back to back " + message + " triple", color: "FFFFFF")
            } else {
                changeMoveLabel(name: message + " triple", color: "FFFFFF")
            }
            scorePoints(amount: 1800, strong: true)
        } else if lineScore == 4 {
                tetrisSound.play()
            print(message,"quadruple")
            if backToBackBonus == 1 {
                changeMoveLabel(name: "Back to back " + message + " quadruple", color: "FFFFFF")
            } else {
                changeMoveLabel(name: message + " quadruple", color: "FFFFFF")
            }
            scorePoints(amount: 1800, strong: true)
        }
    } else {
        noSpinScore()
    }
}
func scorePoints(amount: Int, strong: Bool) {
    if comboCount == 4 {
        comboLow.play()
        changeMoveLabel(name: "Combo  x4", color: "FFFFEE")
    }
    if comboCount == 5 {
        comboMedium.play()
        changeMoveLabel(name: "Combo  x5", color: "FFFFDD")
    }
    if comboCount == 6 {
        comboHigh.play()
        changeMoveLabel(name: "Combo  x6", color: "FFFFCC")
    }
    if comboCount == 7 {
        comboVeryHigh.play()
        changeMoveLabel(name: "Combo  x7", color: "FFFFBB")
    }
    if comboCount == 8 {
        comboMax.play()
        changeMoveLabel(name: "Combo  x8", color: "FFFF88")
    }
    if comboCount == 9 {
        comboMax.play()
        changeMoveLabel(name: "Combo  x9", color: "FFFF66")
    }
    if comboCount == 10 {
        comboMax.play()
        changeMoveLabel(name: "Combo  x10", color: "FFFF33")
    }
    if comboCount > 10 {
        comboMax.play()
        perfectClearSound.play()
        changeMoveLabel(name: "Combo  10+", color: "FFFF00")
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
