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
            // 1분면
            [
             ["B"],["B"],["B"]
            ],
            [
             ["B"],["B"],["B"]
            ],
            [
             ["B"],["B"],["B"]
            ],
            //2분면
            [
             ["W"],["W"],["W"]
            ],
            [
             ["W"],["W"],["W"]
            ],
            [
             ["W"],["W"],["W"]
            ],
            //3분면
            [
             ["O"],["O"],["O"]
            ],
            [
             ["O"],["O"],["O"]
            ],
            [
             ["O"],["O"],["O"]
            ],
            //4분면
            [
             ["G"],["G"],["G"]
            ],
            [
             ["G"],["G"],["G"]
            ],
            [
             ["G"],["G"],["G"]
            ],
            //5분면
            [
             ["Y"],["Y"],["Y"]
            ],
            [
             ["Y"],["Y"],["Y"]
            ],
            [
             ["Y"],["Y"],["Y"]
            ],
            //6분면
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
    
    //윗면회전
    func U(){
        let temp = data[3]
        data[3] = data[6]
        data[6] = data[9]
        data[9] = data[12]
        data[12] = temp
        //print(temp)
    }
    
    //윗면반시계 반향
    func Uquote(){
        let temp = data[12]
        data[12] = data[9]
        data[9] = data[6]
        data[6] = data[3]
        data[3] = temp
    }
    
    //왼쪽면 시계 방향
    func L(){
        let temp = [data[12][0],data[13][0],data[14][0]]
        
        //5분면 변경
        data[12][0] = data[15][0]
        data[13][0] = data[16][0]
        data[14][0] = data[17][0]
        
        //6분면 변경
        data[15][0] = data[6][0]
        data[16][0] = data[7][0]
        data[17][0] = data[8][0]
        
        //3분면 변경
        data[6][0] = data[0][0]
        data[7][0] = data[1][0]
        data[8][0] = data[2][0]
        
        //1분면 변경
        data[0][0] = temp[0]
        data[1][0] = temp[1]
        data[2][0] = temp[2]
    }
    
    //왼쪽면 반시계 방향
    func Lquote(){
        let temp = [data[0][0],data[1][0],data[2][0]]
        
        //1분면 변경
        data[0][0] = data[6][0]
        data[1][0] = data[7][0]
        data[2][0] = data[8][0]
        
        //3분면 변경
        data[6][0] = data[15][0]
        data[7][0] = data[16][0]
        data[8][0] = data[17][0]
        
        //6분면 변경
        data[15][0] = data[12][0]
        data[16][0] = data[13][0]
        data[17][0] = data[14][0]
        
        //5분면 변경
        data[12][0] = temp[0]
        data[13][0] = temp[1]
        data[14][0] = temp[2]
    }
    
    func printCube(cube:[[[String]]]){
        for i in 0...cube.count - 1{
            if i < 3{
                print("\t\t\t\t\t\t\t\t",cube[i])
            }else if i >= 3 && i < 6{
                print(cube[i], cube[i+3], cube[i+6],cube[i+9])
            }else if i >= 15 && i < 18{
                print("\t\t\t\t\t\t\t\t",cube[i])
            }
 
           
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


