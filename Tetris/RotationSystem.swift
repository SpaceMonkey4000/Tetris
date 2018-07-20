import Foundation

func superRotationSystemRightRot() {
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

func superRotationSystemLeftRot() {
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

func simpleRotationSystemRightRot() {
    rotationSystem(ddirection: 1, offsets: [(0,0)])
    return
}

func brokenRotationSystemRightRot() {
    if tetromino.direction == 0 {
        // 0>1
        rotationSystem(ddirection: 1, offsets: [(0,0),(2,1),(1,1),(0,-2),(1,-2)])
        return
    }
    if tetromino.direction == 1 {
        // 1>2
        rotationSystem(ddirection: 1, offsets: [(0,0),(3,2),(1,-1),(0,-2),(-1,-2)])
        return
    }
    if tetromino.direction == 2 {
        // 2>3
        rotationSystem(ddirection: 1, offsets: [(0,0),(-4,8),(3,3),(1,-6),(-3,-1)])
        return
    }
    if tetromino.direction == 3 {
        // 3>0
        rotationSystem(ddirection: 1, offsets: [(0,0),(-2,2),(0,-4),(-4,-2),(-3,-9)])
        return
    }
}

func brokenRotationSystemLeftRot() {
    if tetromino.direction == 0 {
        // 0>1
        rotationSystem(ddirection: -1, offsets: [(0,0),(2,1),(1,1),(0,-2),(1,-2)])
        return
    }
    if tetromino.direction == 1 {
        // 1>2
        rotationSystem(ddirection: -1, offsets: [(0,0),(3,3),(1,-1),(0,-2),(-1,-2)])
        return
    }
    if tetromino.direction == 2 {
        // 2>3
        rotationSystem(ddirection: -1, offsets: [(0,0),(-4,8),(3,3),(1,-6),(-3,-1)])
        return
    }
    if tetromino.direction == 3 {
        // 3>0
        rotationSystem(ddirection: -1, offsets: [(0,0),(-2,2),(0,-4),(-4,-2),(-3,-9)])
        return
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
