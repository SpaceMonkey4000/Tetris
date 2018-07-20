import Foundation

func superRotationSystemRightRot() {
    normalSrsRightRot()
}

func superRotationSystemLeftRot() {
    normalSrsLeftRot()
}

func simpleRotationSystemRot() {
    rotationSystem(ddirection: 1, offsets: [(0,0)])
    return
}

func oSpinSuperRotationSystemRightRot(){
    if tetromino.name == "O" {
        if tetromino.blockUp() {
            rotationSystem(ddirection: 1, offsets: [(1,-1),(1,-2),(2,-1),(2,-2)])
        }
    } else {
        normalSrsRightRot()
    }
}

func oSpinSuperRotationSystemLeftRot(){
    if tetromino.name == "O" {
        if tetromino.blockUp() {
            rotationSystem(ddirection: 1, offsets: [(-1,-1),(-1,-2),(-2,-1),(-2,-2)])
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

func rotationSystem(ddirection: Int, offsets: [(Int, Int)]) {
    for offset in offsets {
        if tetromino.canMoveBy(dx: offset.0, dy: offset.1, ddirection: ddirection) {
            tetromino.moveBy(dx: offset.0, dy: offset.1, ddirection: ddirection)
            return
        }
    }
}
