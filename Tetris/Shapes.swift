//
//  Shapes.swift
//  Tetris
//
//  Created by Axel on 7/15/18.
//  Copyright © 2018 Retroactive Fiasco. All rights reserved.
//

import Foundation


    let orangebasic = texture(named: "Orangebasic")
    let redbasic = texture(named: "Redbasic")
    let greenbasic = texture(named: "Greenbasic")
    let bluebasic = texture(named: "Bluebasic")
    let yellowbasic = texture(named: "Yellowbasic")
    let cyanbasic = texture(named: "Cyanbasic")
    let purplebasic = texture(named: "Purplebasic")
let bloodbasic = texture(named: "Bloodbasic")
let whitebasic = texture(named: "Whitebasic")
let brownbasic = texture(named: "Brownbasic")
let pinkbasic = texture(named: "Pinkbasic")
let blackbasic = texture(named: "Blackbasic")




let lNorth = Shape()
let lSouth = Shape()
let lEast = Shape()
let lWest = Shape()
let jNorth = Shape()
let jSouth = Shape()
let jEast = Shape()
let jWest = Shape()
let iNorth = Shape()
let iSouth = Shape()
let iEast = Shape()
let iWest = Shape()
let tNorth = Shape()
let tSouth = Shape()
let tEast = Shape()
let tWest = Shape()
let sNorth = Shape()
let sSouth = Shape()
let sEast = Shape()
let sWest = Shape()
let zNorth = Shape()
let zSouth = Shape()
let zEast = Shape()
let zWest = Shape()
let oNorth = Shape()
let oSouth = Shape()
let oEast = Shape()
let oWest = Shape()

//debug pieces
let monomino = Shape()
let instaClear = Shape()
let tetrisplus = Shape()
let xPiece = Shape()
let owoPiece = Shape()

func createAllPieces() {
    createLpieces()
    createIpieces()
    createJpieces()
    createOpieces()
    createTpieces()
    createZpieces()
    createSpieces()
    createMiscpieces()
}

func createLpieces() {
    createLnorth()
    createLsouth()
    createLeast()
    createLwest()
}
func createJpieces() {
    createJnorth()
    createJsouth()
    createJeast()
    createJwest()
}
func createIpieces() {
    createInorth()
    createIsouth()
    createIeast()
    createIwest()
}
func createTpieces() {
    createTnorth()
    createTsouth()
    createTeast()
    createTwest()
}
func createSpieces() {
    createSnorth()
    createSsouth()
    createSeast()
    createSwest()
}
func createZpieces() {
    createZnorth()
    createZsouth()
    createZeast()
    createZwest()
}
func createOpieces() {
    createOnorth()
    createOsouth()
    createOeast()
    createOwest()
}
func createMiscpieces() {
    createMonoMino()
    createInstaClear()
    createTetrisPlus()
    createXpiece()
    createOwoPiece()
}
//L pieces
func createLnorth() {
    lNorth.texture = orangebasic
    lNorth.addMino(mx: 0, my: 1)
    lNorth.addMino(mx: 1, my: 1)
    lNorth.addMino(mx: 2, my: 1)
    lNorth.addMino(mx: 2, my: 2)
}
func createLsouth() {
    lSouth.texture = orangebasic
    lSouth.addMino(mx: 0, my: 0)
    lSouth.addMino(mx: 0, my: 1)
    lSouth.addMino(mx: 1, my: 1)
    lSouth.addMino(mx: 2, my: 1)
}
func createLeast() {
    lEast.texture = orangebasic
    lEast.addMino(mx: 1, my: 1)
    lEast.addMino(mx: 1, my: 0)
    lEast.addMino(mx: 2, my: 0)
    lEast.addMino(mx: 1, my: 2)
}
func createLwest() {
    lWest.texture = orangebasic
    lWest.addMino(mx: 0, my: 2)
    lWest.addMino(mx: 1, my: 1)
    lWest.addMino(mx: 1, my: 0)
    lWest.addMino(mx: 1, my: 2)
}
//J pieces
func createJnorth() {
    jNorth.texture = bluebasic
    jNorth.addMino(mx: 2, my: 1)
    jNorth.addMino(mx: 1, my: 1)
    jNorth.addMino(mx: 0, my: 1)
    jNorth.addMino(mx: 0, my: 2)
}
func createJsouth() {
    jSouth.texture = bluebasic
    jSouth.addMino(mx: 2, my: 0)
    jSouth.addMino(mx: 1, my: 1)
    jSouth.addMino(mx: 2, my: 1)
    jSouth.addMino(mx: 0, my: 1)
}
func createJeast() {
    jEast.texture = bluebasic
    jEast.addMino(mx: 1, my: 0)
    jEast.addMino(mx: 1, my: 1)
    jEast.addMino(mx: 1, my: 2)
    jEast.addMino(mx: 2, my: 2)
}
func createJwest() {
    jWest.texture = bluebasic
    jWest.addMino(mx: 0, my: 0)
    jWest.addMino(mx: 1, my: 0)
    jWest.addMino(mx: 1, my: 1)
    jWest.addMino(mx: 1, my: 2)
}
//T pieces
func createTnorth() {
    tNorth.texture = purplebasic
    tNorth.addMino(mx: 1, my: 1)
    tNorth.addMino(mx: 1, my: 2)
    tNorth.addMino(mx: 0, my: 1)
    tNorth.addMino(mx: 2, my: 1)
}

func createTsouth() {
    tSouth.texture = purplebasic
    tSouth.addMino(mx: 1, my: 1)
    tSouth.addMino(mx: 1, my: 0)
    tSouth.addMino(mx: 0, my: 1)
    tSouth.addMino(mx: 2, my: 1)
}
func createTeast() {
    tEast.texture = purplebasic
    tEast.addMino(mx: 1, my: 1)
    tEast.addMino(mx: 1, my: 0)
    tEast.addMino(mx: 1, my: 2)
    tEast.addMino(mx: 2, my: 1)
}
func createTwest() {
    tWest.texture = purplebasic
    tWest.addMino(mx: 1, my: 1)
    tWest.addMino(mx: 0, my: 1)
    tWest.addMino(mx: 1, my: 2)
    tWest.addMino(mx: 1, my: 0)
}
// S pieces
func createSnorth() {
    sNorth.texture = greenbasic
    sNorth.addMino(mx: 1, my: 1)
    sNorth.addMino(mx: 1, my: 2)
    sNorth.addMino(mx: 0, my: 1)
    sNorth.addMino(mx: 2, my: 2)
}
func createSsouth() {
    sSouth.texture = greenbasic
    sSouth.addMino(mx: 1, my: 0)
    sSouth.addMino(mx: 1, my: 1)
    sSouth.addMino(mx: 0, my: 0)
    sSouth.addMino(mx: 2, my: 1)
}
func createSeast() {
    sEast.texture = greenbasic
    sEast.addMino(mx: 1, my: 1)
    sEast.addMino(mx: 2, my: 1)
    sEast.addMino(mx: 2, my: 0)
    sEast.addMino(mx: 1, my: 2)
}
func createSwest() {
    sWest.texture = greenbasic
    sWest.addMino(mx: 0, my: 1)
    sWest.addMino(mx: 1, my: 1)
    sWest.addMino(mx: 1, my: 0)
    sWest.addMino(mx: 0, my: 2)
}
// Z pieces
func createZnorth() {
    zNorth.texture = redbasic
    zNorth.addMino(mx: 1, my: 1)
    zNorth.addMino(mx: 1, my: 2)
    zNorth.addMino(mx: 0, my: 2)
    zNorth.addMino(mx: 2, my: 1)
}
func createZsouth() {
    zSouth.texture = redbasic
    zSouth.addMino(mx: 1, my: 0)
    zSouth.addMino(mx: 1, my: 1)
    zSouth.addMino(mx: 0, my: 1)
    zSouth.addMino(mx: 2, my: 0)
}
func createZeast() {
    zEast.texture = redbasic
    zEast.addMino(mx: 1, my: 1)
    zEast.addMino(mx: 1, my: 0)
    zEast.addMino(mx: 2, my: 1)
    zEast.addMino(mx: 2, my: 2)
}
func createZwest() {
    zWest.texture = redbasic
    zWest.addMino(mx: 0, my: 1)
    zWest.addMino(mx: 0, my: 0)
    zWest.addMino(mx: 1, my: 1)
    zWest.addMino(mx: 1, my: 2)
}
// O pieces
func createOnorth() {
    oNorth.texture = yellowbasic
    oNorth.addMino(mx: 1, my: 1)
    oNorth.addMino(mx: 2, my: 2)
    oNorth.addMino(mx: 2, my: 1)
    oNorth.addMino(mx: 1, my: 2)
}
func createOsouth() {
    oSouth.texture = yellowbasic
    oSouth.addMino(mx: 1, my: 1)
    oSouth.addMino(mx: 2, my: 2)
    oSouth.addMino(mx: 2, my: 1)
    oSouth.addMino(mx: 1, my: 2)
}
func createOeast() {
    oEast.texture = yellowbasic
    oEast.addMino(mx: 1, my: 1)
    oEast.addMino(mx: 2, my: 2)
    oEast.addMino(mx: 2, my: 1)
    oEast.addMino(mx: 1, my: 2)
}
func createOwest() {
    oWest.texture = yellowbasic
    oWest.addMino(mx: 1, my: 1)
    oWest.addMino(mx: 2, my: 2)
    oWest.addMino(mx: 2, my: 1)
    oWest.addMino(mx: 1, my: 2)
}
//I pieces
func createInorth() {
    iNorth.texture = cyanbasic
    iNorth.addMino(mx: 0, my: 2)
    iNorth.addMino(mx: 1, my: 2)
    iNorth.addMino(mx: 2, my: 2)
    iNorth.addMino(mx: 3, my: 2)
}
func createIsouth() {
    iSouth.texture = cyanbasic
    iSouth.addMino(mx: 0, my: 1)
    iSouth.addMino(mx: 1, my: 1)
    iSouth.addMino(mx: 2, my: 1)
    iSouth.addMino(mx: 3, my: 1)
}
func createIeast() {
    iEast.texture = cyanbasic
    iEast.addMino(mx: 2, my: 0)
    iEast.addMino(mx: 2, my: 1)
    iEast.addMino(mx: 2, my: 2)
    iEast.addMino(mx: 2, my: 3)

}
func createIwest() {
    iWest.texture = cyanbasic
    iWest.addMino(mx: 1, my: 0)
    iWest.addMino(mx: 1, my: 1)
    iWest.addMino(mx: 1, my: 2)
    iWest.addMino(mx: 1, my: 3)
}
//monomino
func createMonoMino() {
    monomino.texture = garbage
    monomino.addMino(mx: 1, my: 1)
}

//owo
func createOwoPiece() {
    owoPiece.texture = pinkbasic
    owoPiece.addMino(mx: 0, my: 0)
    owoPiece.addMino(mx: 0, my: 1)
    owoPiece.addMino(mx: 0, my: 2)
    owoPiece.addMino(mx: 1, my: 0)
    owoPiece.addMino(mx: 1, my: 1)
    owoPiece.addMino(mx: 1, my: 2)
    owoPiece.addMino(mx: 2, my: 0)
    owoPiece.addMino(mx: 2, my: 1)
    owoPiece.addMino(mx: 2, my: 2)
}

//instaclear
func createInstaClear() {
    instaClear.texture = whitebasic
    for y in 0..<20 {
        for x in 0..<30 {
            instaClear.addMino(mx: x - 15, my: y - 20)
        }
    }
}
//tetris plus
func createTetrisPlus() {
    tetrisplus.texture = bloodbasic
    tetrisplus.addMino(mx: 1, my: 0)
    tetrisplus.addMino(mx: 1, my: 1)
    tetrisplus.addMino(mx: 1, my: 2)
    tetrisplus.addMino(mx: 1, my: 3)
    tetrisplus.addMino(mx: 1, my: 4)
}

//X
func createXpiece() {
    xPiece.texture = brownbasic
    xPiece.addMino(mx: 1, my: 1)
    xPiece.addMino(mx: 0, my: 1)
    xPiece.addMino(mx: 2, my: 1)
    xPiece.addMino(mx: 1, my: 2)
    xPiece.addMino(mx: 1, my: 0)
}

