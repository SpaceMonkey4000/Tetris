import Foundation

func scoreLines(){
    print("wallkicks:",wallKicks)
    if wallKicks < 2 {
        if tetromino.name == "T" {
            tSpinScore()
            return
        } else {
            noSpinScore()
            return
        }
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
        
    }
    if zSpinsRewarded{
        
    }
    if lSpinsRewarded{
        
    }
    if jSpinsRewarded{
        
    }
    if iSpinsRewarded{
        
    }
    if oSpinsRewarded{
        if tetromino.name == "O"{
            if lineScore == 0 {
                print("O-spin")
            } else if lineScore == 1 {
                print("O-spin single")
            } else if lineScore == 2 {
                print("O-spin double")
            }
        }
    }
    
}

func tSpinScore () {
    
}
