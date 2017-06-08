//
//  saveFileFunc.swift
//  boostcamp_asm
//
//  Created by LEOFALCON on 2017. 6. 9..
//  Copyright © 2017년 LeFal. All rights reserved.
//

import Foundation

let savePath = "/Users/LEOFALCON/result.txt"

func writeAndSaveFile(students : [Student]) -> Void {
    var result = ""
    var tempStudents : [Student]
    let title = "성적결과표\n"
    let totalAvgString = "전체 평균 : "
    let individualGrade = "개인별 학점\n"
    let completion = "수료생\n"
    let blank1 = "       : "
    let blank2 = "      : "
    let lineBreak = "\n"
    let rest = ", "
    
    tempStudents = students.sorted(by: {$0.name < $1.name })
    
    result += title
    result += lineBreak
    result += totalAvgString
    result += calcTotalAvg(student: students)
    result += lineBreak
    result += lineBreak
    result += individualGrade
    
    for index in tempStudents.indices {
        if tempStudents[index].name == "steve" {
            result += tempStudents[index].name
            result += blank2
            result += tempStudents[index].grade!
            result += lineBreak
        } else {
            result += tempStudents[index].name
            result += blank1
            result += tempStudents[index].grade!
            result += lineBreak
        }
    }
    
    result += lineBreak
    result += completion
    
    var firstComp = 0
    
    for index in tempStudents.indices {
        if tempStudents[index].average! >= 70.0 {
            if firstComp == 1 {
                result += rest
            }
            result += tempStudents[index].name
            firstComp = 1
        }
    }

    saveFile(result: result)
}

func saveFile (result : String) -> Void {
    do {
        // Write contents to file
        try result.write(toFile: savePath, atomically: false, encoding: String.Encoding.utf8)
    }
    catch let error as NSError {
        print("Ooops! Something went wrong: \(error)")
    }
}

func calcTotalAvg(student : [Student]) -> String {
    var totalAvg : Float = 0.0
    var sum : Float = 0.0
    var count : Float = 0.0
    var totalAvgString = ""
    
    for index in students.indices {
        sum += students[index].average!
        count += 1.0
    }
    totalAvg = Float(sum / count)
    totalAvgString =  String(totalAvg.roundTo(places: 2))
    
    return totalAvgString
}
