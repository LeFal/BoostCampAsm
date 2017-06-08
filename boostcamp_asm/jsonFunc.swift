//
//  jsonFunc.swift
//  boostcamp_asm
//
//  Created by LEOFALCON on 2017. 6. 9..
//  Copyright © 2017년 LeFal. All rights reserved.
//

import Foundation


let path = "/Users/LEOFALCON/Students.json"
let file: FileHandle? = FileHandle(forReadingAtPath: path)
var json = [[String:Any]]()

func JsonToObject() -> Void {
    if file != nil {
        let data = file?.readDataToEndOfFile()
        file?.closeFile()
        json = try! JSONSerialization.jsonObject(with: data!, options: []) as? [[String:Any]] ?? [[:]]
    }
    else {
        print("Ooops! Something went wrong!")
    }
    
    for index in json.indices {
        let name = json[index]["name"] as! String
        let scores = json[index]["grade"] as! [String:Int]
        let student = Student(name: name, scores: scores)
        students.append(student)
    }
}
