import Foundation

//SRS
func superRotationSystemRightRot() {
    normalSrsRightRot()
}

func superRotationSystemLeftRot() {
    normalSrsLeftRot()
}
//SimpleRS
func simpleRotationSystemRot() {
    lastSuccessfulAction = "rotate"
    rotationSystem(ddirection: 1, offsets: [(0,0)])
    return
}
//OSSRS

func oSpinSuperRotationSystemRightRot(){
    if tetromino.name == "O" || tetromino.name == "MM"{
        if tetromino.blockUp() {
            rotationSystem(ddirection: 1, offsets: [(1,-1),(1,-2),(2,-1)])
        }
    } else {
        normalSrsRightRot()
    }
}

func oSpinSuperRotationSystemLeftRot(){
    if tetromino.name == "O" || tetromino.name == "MM"{
        if tetromino.blockUp() {
            rotationSystem(ddirection: 1, offsets: [(-1,-1),(-1,-2),(-2,-1)])
        }
    } else {
        normalSrsLeftRot()
    }
}

func normalSrsRightRot() {
    if tetromino.name == "I"{
        //SRS
        if tetromino.direction == 0 {
            // 0>1
            rotationSystem(ddirection: 1, offsets: [(0,0),(-2,0),(1,0),(-2,-1),(1,2)])
            return
        }
        if tetromino.direction == 1 {
            // 1>2
            rotationSystem(ddirection: 1, offsets: [(0,0),(-1,0),(2,0),(-1,2),(2,-1)])
            return
        }
        if tetromino.direction == 2 {
            // 2>3
            rotationSystem(ddirection: 1, offsets: [(0,0),(2,0),(-1,0),(2,-1),(-1,-2)])
            return
        }
        if tetromino.direction == 3 {
            // 3>0
            rotationSystem(ddirection: 1, offsets: [(0,0),(1,0),(-2,0),(1,-2),(-2,1)])
            return
        }
    } else {
        //SRS
        if tetromino.direction == 0 {
            // 0>1
            rotationSystem(ddirection: 1, offsets: [(0,0),(-1,0),(-1,1),(0,-2),(-1,-2)])
            return
        }
        if tetromino.direction == 1 {
            // 1>2
            rotationSystem(ddirection: 1, offsets: [(0,0),(1,0),(1,-1),(0,2),(1,2)])
            return
        }
        if tetromino.direction == 2 {
            // 2>3
            rotationSystem(ddirection: 1, offsets: [(0,0),(1,0),(1,1),(0,-2),(1,-2)])
            return
        }
        if tetromino.direction == 3 {
            // 3>0
            rotationSystem(ddirection: 1, offsets: [(0,0),(-1,0),(-1,-1),(0,2),(-1,2)])
            return
        }
    }
}

func normalSrsLeftRot() {
    if tetromino.name == "I"{
        //SRS
        if tetromino.direction == 0 {
            // 0>3
            rotationSystem(ddirection: -1, offsets: [(0,0),(2,0),(-1,0),(2,1),(-1,-2)])
            return
        }
        if tetromino.direction == 1 {
            // 1>0
            rotationSystem(ddirection: -1, offsets: [(0,0),(1,0),(1,-1),(0,-2),(-1,-2)])
            return
        }
        if tetromino.direction == 2 {
            // 2>1
            rotationSystem(ddirection: -1, offsets: [(0,0),(1,0),(-2,0),(1,-2),(-2,1)])
            return
        }
        if tetromino.direction == 3 {
            // 3>2
            rotationSystem(ddirection: -1, offsets: [(0,0),(-2,0),(1,0),(-2,01),(1,2)])
            return
        }
    } else {
        //SRS
        if tetromino.direction == 0 {
            // 0>3
            rotationSystem(ddirection: -1, offsets: [(0,0),(1,0),(1,1),(0,-2),(1,-2)])
            return
        }
        if tetromino.direction == 1 {
            // 1>0
            rotationSystem(ddirection: -1, offsets: [(0,0),(1,0),(1,-1),(0,-2),(-1,-2)])
            return
        }
        if tetromino.direction == 2 {
            // 2>1
            rotationSystem(ddirection: -1, offsets: [(0,0),(-1,0),(-1,1),(0,-2),(-1,-2)])
            return
        }
        if tetromino.direction == 3 {
            // 3>2
            rotationSystem(ddirection: -1, offsets: [(0,0),(-1,0),(-1,-1),(0,2),(-1,2)])
            return
        }
    }
}

func downForceRotationSystemRightRot() {
    rotationSystem(ddirection: 1, offsets: [(0,0),(0,-1),(0,-2),(0,-3),(0,-4),(0,-5),(0,-6),(0,-7),(0,-8),(0,-9),(0,-10),(0,1),(0,2),(0,3),(0,4),(0,5),(0,6),(0,7),(0,8),(0,9),(0,10)])
}

func downForceRotationSystemLeftRot() {
   rotationSystem(ddirection: -1, offsets: [(0,0),(0,-1),(0,-2),(0,-3),(0,-4),(0,-5),(0,-6),(0,-7),(0,-8),(0,-9),(0,-10),(0,1),(0,2),(0,3),(0,4),(0,5),(0,6),(0,7),(0,8),(0,9),(0,10)])
}

func rotationSystem(ddirection: Int, offsets: [(Int, Int)]) {
    wallKicks = 0
    for offset in offsets {
        wallKicks += 1
        if tetromino.canMoveBy(dx: offset.0, dy: offset.1, ddirection: ddirection) {
            lastSuccessfulAction = "rotate"
            tetromino.moveBy(dx: offset.0, dy: offset.1, ddirection: ddirection)
            return
        }
    }
}
