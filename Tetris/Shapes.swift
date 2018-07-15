//
//  Shapes.swift
//  Tetris
//
//  Created by Axel on 7/15/18.
//  Copyright © 2018 Retroactive Fiasco. All rights reserved.
//



import Foundation

let lNorth = Shape()
let lSouth = Shape()
let lEast = Shape()
let lWest = Shape()

func createLpieces() {
    createLnorth()
    createLsouth()
    createLeast()
    createLwest()
}

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
