//
//  Logic.swift
//  Section-3
//
//  Created by 민창경 on 2020/12/07.
//

import Foundation
class LubicsCube{
    
    func loadData() ->[[[String]]]{
        let cube:[[[String]]] = [
            
            [
             ["B"],["B"],["B"]
            ],
            [
             ["B"],["B"],["B"]
            ],
            [
             ["B"],["B"],["B"]
            ],
            
            [
             ["W"],["W"],["W"]
            ],
            [
             ["W"],["W"],["W"]
            ],
            [
             ["W"],["W"],["W"]
            ],
            
            [
             ["O"],["O"],["O"]
            ],
            [
             ["O"],["O"],["O"]
            ],
            [
             ["O"],["O"],["O"]
            ],
            
            [
             ["G"],["G"],["G"]
            ],
            [
             ["G"],["G"],["G"]
            ],
            [
             ["G"],["G"],["G"]
            ],
            
            
            [
             ["Y"],["Y"],["Y"]
            ],
            [
             ["Y"],["Y"],["Y"]
            ],
            [
             ["Y"],["Y"],["Y"]
            ],
            
            
            [
             ["R"],["R"],["R"]
            ],
            [
             ["R"],["R"],["R"]
            ],
            [
             ["R"],["R"],["R"]
            ],
        ]
        return cube
    }
    
    func printCube(cube:[[[String]]]){
        for i in 0...cube.count - 1{
            if i % 3 == 0{
                print("\(i/3 + 1) " + "분면")
            }
            print(cube[i])
        }
    }
    
    //MARK: 커맨드 라인 입력한 부분 파싱하기
    func parseCmd(cmd : String) -> [String]{
        var cmds:[String] = []
        for i in 0...cmd.count - 1{
            var getCmds = ""
            //SingleQutation일 경우 처리 안함
            if String(cmd[cmd.index(cmd.startIndex,offsetBy:i)]) != "'"{
                
                if i != cmd.count - 1 {
                    //실행해야할 커맨드에 싱글쿼테이션이 있는경우
                    if String(cmd[cmd.index(cmd.startIndex,offsetBy:i+1)]) == "'"{
                        getCmds = String(cmd[cmd.index(cmd.startIndex,offsetBy:i)]) + "'"
                    }
                    //없는경우
                    else{
                        getCmds = (String(cmd[cmd.index(cmd.startIndex,offsetBy:i)]))
                    }
                }
                //마지막 커맨드
                else{
                    getCmds = (String(cmd[cmd.index(cmd.startIndex,offsetBy:i)]))
                }
                
                cmds.append(getCmds)
            }
        }
        return cmds
    }
}


