//
//  model.swift
//  boostcamp_asm
//
//  Created by LEOFALCON on 2017. 6. 8..
//  Copyright © 2017년 LeFal. All rights reserved.
//

import Foundation

struct Student {
    var name : String
    var scores : [String:Int]
    var average : Float? {
        var sum  : Float = 0.0
        var avg : Float = 0.00
        for value in self.scores.values {
            sum += Float(value)
        }
        avg = sum / Float(self.scores.count)
        return avg
    }
    
    var grade : String? {
        if let avg = self.average {
            switch avg {
            case 90.0...100.0:
                return "A"
            case 80.0..<90.0:
                return "B"
            case 70.0..<80.0:
                return "C"
            case 60.0..<70.0:
                return "D"
            case 0.0..<60.0:
                return "F"
            default:
                return nil
            }
        }else{
            return nil
        }
    }
}



