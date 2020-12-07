//
//  main.swift
//  Section-2
//
//  Created by 민창경 on 2020/12/07.
//

import Foundation

let cube = FlatCube()
var data = cube.loadData()

print(data[0])
print(data[1])
print(data[2])

var cmd = ""
while(cmd != "Q"){
    print("Cube>")
    cmd = readLine()!
    
    let cmds = cube.parseCmd(cmd: cmd)
    
    cmds.forEach{
        if $0 == "U'"{
            print("U'")
            data = cube.Uquote(cube: data)
        }
        else if $0 == "U"{
            print("U")
            data = cube.U(cube: data)
        }
        else if $0 == "R"{
            print("R")
            data = cube.R(cube: data)
        }
        else if $0 == "R'"{
            print("R'")
            data = cube.Rquote(cube: data)
        }
        else if $0 == "L"{
            print("L")
            data = cube.L(cube: data)
        }
        else if $0 == "L'"{
            print("L'")
            data = cube.Lquote(cube: data)
        }
        else if $0 == "B"{
            print("B")
            data = cube.B(cube: data)
        }
        else if $0 == "B'"{
            print("B'")
            data = cube.Bquote(cube: data)
        }
        
        print(data[0])
        print(data[1])
        print(data[2])

    }
}

print("Bye~")
