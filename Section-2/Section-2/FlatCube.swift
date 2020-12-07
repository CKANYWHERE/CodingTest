//
//  Logic.swift
//  Section-2
//
//  Created by 민창경 on 2020/12/07.
//

import Foundation

class FlatCube{
    
    func loadData() ->[[String]]{
        let cube =
        [
            ["R","R","W"],
            ["G","C","W"],
            ["G","B","B"]
        ]
        
        return cube
    }
    
    //U  가장 윗줄을 왼쪽으로 한 칸 밀기
    func U(cube:[[String]]) -> [[String]]{
        let first = cube[0][0]
        let second = cube[0][1]
        let third = cube[0][2]
        return [
            [second,third,first],
            cube[1],
            cube[2]
            ]
        
    }

    //U' 가장 윗줄을 오른쪽으로 한 칸 밀기
    func Uquote(cube:[[String]]) -> [[String]]{
        let first = cube[0][0]
        let second = cube[0][1]
        let third = cube[0][2]
        return[
            [third,first,second]
            ,cube[1]
            ,cube[2]
        ]
    }

    //R 가장 오른쪽 줄을 위로 한 칸 밀기
    func R(cube:[[String]]) -> [[String]]{
        let first = cube[0][2]
        let second = cube[1][2]
        let third = cube[2][2]
        
        return[
           [cube[0][0],cube[0][1],second]
            ,[cube[1][0],cube[1][1],third]
            ,[cube[2][0],cube[2][1],first]
        ]
        
    }
    
    //R' 가장 오른쪽 줄을 아래로 한 칸 밀기
    func Rquote(cube:[[String]]) -> [[String]]{
        let first = cube[0][2]
        let second = cube[1][2]
        let third = cube[2][2]
        
        return[
           [cube[0][0],cube[0][1],third]
            ,[cube[1][0],cube[1][1],first]
            ,[cube[2][0],cube[2][1],second]
        ]
    }

    //L  가장 왼쪽 줄을 아래로 한 칸 밀기
    func L(cube:[[String]]) -> [[String]]{
        let first = cube[0][0]
        let second = cube[1][0]
        let third = cube[2][0]
        
        return[
           [third,cube[0][1],cube[0][2]]
            ,[first,cube[1][1],cube[1][2]]
            ,[second,cube[2][1],cube[2][2]]
        ]
    }
    //L' 가장 왼쪽 줄을 위로 한 칸 밀기
    func Lquote(cube:[[String]]) -> [[String]]{
        let first = cube[0][0]
        let second = cube[1][0]
        let third = cube[2][0]
        
        return[
            [second,cube[0][1],cube[0][2]]
             ,[third,cube[1][1],cube[1][2]]
             ,[first,cube[2][1],cube[2][2]]
         ]
    }

    //B  가장 아랫줄을 오른쪽으로 한 칸 밀기
    func B(cube:[[String]])-> [[String]]{
        let first = cube[2][0]
        let second = cube[2][1]
        let third = cube[2][2]
        return[
            cube[0]
            ,cube[1]
            ,[third,first,second]
        ]
    }

    //B' 가장 아랫줄을 왼쪽으로 한 칸 밀기
    func Bquote(cube:[[String]]) -> [[String]]{
        let first = cube[2][0]
        let second = cube[2][1]
        let third = cube[2][2]
        return [
            cube[0],
            cube[1],
            [second,third,first]
            ]
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


