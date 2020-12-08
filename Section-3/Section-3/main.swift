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

 WWW    OOO     GGG     YYY
 WWW    OOO     GGG     YYY
 WWW    OOO     GGG     YYY => 순서대로 2,3,4,5분면
            
        RRR
        RRR
        RRR => 6분면
 */
var data = cube.loadData()

//cube.shuffleCube()
cube.printCube(cube: data)


var cmd = ""
var controlCnt = 0
var start = CFAbsoluteTimeGetCurrent()
var isGood = true

while(cmd != "Q" || isGood == false){
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
            cube.Uquote()
        }
        else if $0 == "L"{
            print("L")
            cube.L()
        }
        else if $0 == "L'"{
            print("L'")
            cube.Lquote()
        }
        else if $0 == "F"{
            print("F")
            cube.F()
        }
        else if $0 == "F'"{
            print("F'")
            cube.Fquote()
        }
        else if $0 == "R"{
            print("R")
            cube.R()
        }
        else if $0 == "R'"{
            print("R'")
            cube.Rquote()
        }
        else if $0 == "B"{
            print("B")
            cube.B()
        }
        else if $0 == "B'"{
            print("B'")
            cube.Bquote()
        }
        else if $0 == "D"{
            print("D")
            cube.D()
        }
        else if $0 == "D'"{
            print("D'")
            cube.Dquoute()
        }
        cube.printCube(cube: data)
    }
    
    if cube.checkComplete() == true{
        print("큐브를 완성했군요! 축하합니다! ")
        break
    }
}

var end = CFAbsoluteTimeGetCurrent()

var playTime = cube.calcPlayTime(time:end-start)

print(playTime)
print("조작겟수: " + "\(controlCnt - 1)")
print("이용햐주셔서 감사합니다. 뚜뚜뚜.")
