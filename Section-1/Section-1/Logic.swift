//
//  Logic.swift
//  Section-1
//
//  Created by 민창경 on 2020/12/07.
//

import Foundation

//Mark: 단어를 이동시켜주는 메인 메서드 l,L,r,R 만 입력가능
func moveWords(word:String, cnt:Int, toWhere:String){
    
    if toWhere == "l" || toWhere == "L"{
        
        if(cnt >= 0){
            moveLeft(word: word,cnt: cnt)
        }else{
            let absNum = cnt * -1
            moveRight(word: word,cnt:absNum)
        }
        
    }
    else if toWhere == "r" || toWhere == "R"{

        if(cnt >= 0){
            moveRight(word: word,cnt: cnt)
        }else{
            let absNum = cnt * -1
            moveLeft(word: word,cnt:absNum)
        }
        
    }else{
        print("unavailable keyword")
    }
    
}


//MARK: 단어를 오른쪽 으로 이동 word: 입력받은 단어 cnt: 얼마만큼 이동할지
func moveRight(word:String,cnt:Int){
    //print(cnt)
    var changeWord = word
    for _ in 1...cnt{
        var result = ""
        let lastWord = changeWord[changeWord.index(before: changeWord.endIndex)]
        result.append(lastWord)
        for i in 0...word.count - 2{
            result.append(changeWord[changeWord.index(changeWord.startIndex,offsetBy:i)])
        }
        changeWord = result
        //print(result)
    }
    
    print(changeWord)
 
}


//MARK: 단어를 왼쪽으로 이동 word: 입력받은 단어 cnt: 얼마만큼 이동할지
func moveLeft(word:String,cnt:Int){
    //print(cnt)
    var changeWord = word
    for _ in 1...cnt{
        var result = ""
        let firstWord = changeWord[changeWord.startIndex]
        for i in 0...changeWord.count - 2{
            result.append(changeWord[changeWord.index(word.startIndex,offsetBy:i+1)])
        }
        result.append(firstWord)
        changeWord = result
        //print(result)
    }
    print(changeWord)

}
