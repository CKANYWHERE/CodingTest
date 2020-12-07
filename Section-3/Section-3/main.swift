//
//  main.swift
//  Section-3
//
//  Created by 민창경 on 2020/12/07.
//

import Foundation


let cube = LubicsCube()

/**
        BBB => 1분면
        BBB
        BBB

 WWW    OOO     GGG
 WWW    OOO     GGG
 WWW    OOO     GGG     => 순서대로 2,3,4분면
            
        YYY
        YYY
        YYY =>  5분면
 
        RRR
        RRR
        RRR => 6분면
 */
var data = cube.loadData()

cube.printCube(cube: data)

var cmd = ""
var controlCnt = 0
while(cmd != "Q"){
    print("Cube>")
    cmd = readLine()!
    
    let cmds = cube.parseCmd(cmd: cmd)
    controlCnt = controlCnt + cmds.count
   
    cmds.forEach{
        if $0 == "U"{
            print("U")
            cube.U()
        }
        else if $0 == "U'"{
            print("U'")
            cube.Uqoute()
        }
        
        cube.printCube(cube: data)
    }
    
}


print("조작겟수:" + "\(controlCnt - 1)")
print("이용햐주셔서 감사합니다. 뚜뚜뚜.")
