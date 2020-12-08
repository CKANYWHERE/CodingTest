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
    
    //Mark: 큐브 무작위로 썪기
    func shuffleCube(){
        for i in 0...data.count-1{
            for j in 0...data[i].count-1{
                for k in 0...data[i][j].count-1{
                    data[i][j][k] = randomString()
                }
            }
        }
    }
    
    func randomString() -> String{
        let letters = "BWOGYR"
        return String(letters.randomElement()!)
    }
    
    //윗면회전
    func U(){
        let temp = data[3]
        
        //2분면 회전
        data[3] = data[6]
        //3분면 회전
        data[6] = data[9]
        //4분면 회전
        data[9] = data[12]
        //5분면 회전
        data[12] = temp
        //print(temp)
    }
    
    //윗면반시계 반향
    func Uquote(){
        let temp = data[12]
        //5분면 회전
        data[12] = data[9]
        //4분면 회전
        data[9] = data[6]
        //3분면 회전
        data[6] = data[3]
        //2분면 회전
        data[3] = temp
    }
    
    //왼쪽면 시계 방향
    func L(){
        let temp = [data[12][0],data[13][0],data[14][0]]
        
        //5분면 회전
        data[12][0] = data[15][0]
        data[13][0] = data[16][0]
        data[14][0] = data[17][0]
        
        //6분면 회전
        data[15][0] = data[6][0]
        data[16][0] = data[7][0]
        data[17][0] = data[8][0]
        
        //3분면 회전
        data[6][0] = data[0][0]
        data[7][0] = data[1][0]
        data[8][0] = data[2][0]
        
        //1분면 회전
        data[0][0] = temp[0]
        data[1][0] = temp[1]
        data[2][0] = temp[2]
    }
    
    //왼쪽면 반시계 방향
    func Lquote(){
        let temp = [data[0][0],data[1][0],data[2][0]]
        
        //1분면 회전
        data[0][0] = data[6][0]
        data[1][0] = data[7][0]
        data[2][0] = data[8][0]
        
        //3분면 회전
        data[6][0] = data[15][0]
        data[7][0] = data[16][0]
        data[8][0] = data[17][0]
        
        //6분면 회전
        data[15][0] = data[12][0]
        data[16][0] = data[13][0]
        data[17][0] = data[14][0]
        
        //5분면 회전
        data[12][0] = temp[0]
        data[13][0] = temp[1]
        data[14][0] = temp[2]
    }
    
    //앞면 시계 방향
    func F(){
        let temp = [data[5][2],data[4][2],data[3][2]]
        
        //2분면 회전
        data[3][2] = data[15][0]
        data[4][2] = data[15][1]
        data[5][2] = data[15][2]
        
        //6분면 회전
        data[15][0] = data[11][0]
        data[15][1] = data[10][0]
        data[15][2] = data[9][0]
        
        //4분면 회전
        data[9][0] = data[2][0]
        data[10][0] = data[2][1]
        data[11][0] = data[2][2]
        
        //1분면 회전
        data[2] = temp
    }
    
    //앞면 반시계 방향
    func Fquote(){
        let temp = data[2]
        
        //1분면 회전
        data[2][0] = data[9][0]
        data[2][1] = data[10][0]
        data[2][2] = data[11][0]
        
        //4분면 회전
        data[9][0] = data[15][2]
        data[10][0] = data[15][1]
        data[11][0] = data[15][0]
        
        //6분면 회전
        data[15][0] = data[3][2]
        data[15][1] = data[4][2]
        data[15][2] = data[5][2]
        
        //2분면 회전
        data[3][2] = temp[2]
        data[4][2] = temp[1]
        data[5][2] = temp[0]
    }
    
    func R(){
        let temp = [data[0][2],data[1][2],data[2][2]]
        
        //1분면 회전
        data[0][2] = data[6][2]
        data[1][2] = data[7][2]
        data[2][2] = data[8][2]
        
        //3분면 회전
        data[6][2] = data[15][2]
        data[7][2] = data[16][2]
        data[8][2] = data[17][2]
        
        //6분면 회전
        data[15][2] = data[12][2]
        data[16][2] = data[13][2]
        data[17][2] = data[14][2]
        
        //5분면 회전
        data[12][2] = temp[0]
        data[13][2] = temp[1]
        data[14][2] = temp[2]
        
    }
    
    func Rquote(){
        let temp = [data[12][2],data[13][2],data[14][2]]
        
        //5분면 회전
        data[12][2] = data[15][2]
        data[13][2] = data[16][2]
        data[14][2] = data[17][2]
        
        //6분면 회전
        data[15][2] = data[6][2]
        data[16][2] = data[7][2]
        data[17][2] = data[8][2]
        
        //3분면 회전
        data[6][2] = data[0][2]
        data[7][2] = data[1][2]
        data[8][2] = data[2][2]
        
        //1분면 회전
        data[0][2] = temp[0]
        data[1][2] = temp[1]
        data[2][2] = temp[2]
        
    }
    
    func B(){
        let temp = data[0]
        
        //1분면 회전
        data[0][0] = data[9][2]
        data[0][1] = data[10][2]
        data[0][2] = data[11][2]
        
        //4분면 회전
        data[9][2] = data[17][2]
        data[10][2] = data[17][1]
        data[11][2] = data[17][0]
        
        //6분면 회전
        data[17][0] = data[3][0]
        data[17][1] = data[4][0]
        data[17][2] = data[5][0]
        
        //2분면 회전
        data[3][0] = temp[2]
        data[4][0] = temp[1]
        data[5][0] = temp[0]
    }
    
    func Bquote(){
        let temp = data[0]
        
        //1분면 회전
        data[0][0] = data[5][0]
        data[0][1] = data[4][0]
        data[0][2] = data[3][0]
        
        //2분면 회전
        data[3][0] = data[17][0]
        data[4][0] = data[17][1]
        data[5][0] = data[17][2]
        
        //6분면 회전
        data[17][0] = data[11][2]
        data[17][1] = data[10][2]
        data[17][2] = data[9][2]
        
        //3분면 회전
        data[9][2] = temp[0]
        data[10][2] = temp[1]
        data[11][2] = temp[2]
    }
    
    func D(){
        let temp = data[8]
        
        //3분면 회전
        data[8] = data[5]
        
        //2분면 회전
        data[5] = data[14]
        
        //5분면 회전
        data[14] = data[11]
        
        //4분면 회전
        data[11] = temp
        
    }
    
    func Dquoute(){
        let temp = data[8]
        
        //3분면 회전
        data[8] = data[11]
        
        //4분면 회전
        data[11] = data[14]
        
        //5분면 회전
        data[14] = data[5]
        
        //2분면 회전
        data[5] = temp
    }
    
    //큐브 출력
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
    
    //플레이타임 측정
    func calcPlayTime(time:CFAbsoluteTime) -> String{
        let minute = Int(time/60)
        let second = Int(time)%60
        
        var playTime = "경과시간: "
        if minute >= 10 && second >= 10{
            playTime = playTime + "\(minute):"+"\(second)"
        }
        else if minute >= 10 && second < 10{
            playTime = playTime + "\(minute):"+"0\(second)"
        }
        else if minute < 10 && second >= 10{
            playTime = playTime + "0\(minute):"+"\(second)"
        }
        else{
            playTime = playTime + "0\(minute):"+"0\(second)"
        }

        return playTime
    }
}


