//
//  main.swift
//  Section-1
//
//  Created by 민창경 on 2020/12/07.
//

import Foundation

let cmd = readLine()
let subCmd = (cmd!.split(separator: " "))

let word = String(subCmd[0])
let cnt = Int(String(subCmd[1]))
let toWhere = String(subCmd[2])

//Mark: Logic.swift 에 있는 함수
moveWords(word: word, cnt: cnt!, toWhere: toWhere)
