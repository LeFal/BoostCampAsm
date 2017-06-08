//
//  extension.swift
//  boostcamp_asm
//
//  Created by LEOFALCON on 2017. 6. 9..
//  Copyright © 2017년 LeFal. All rights reserved.
//

import Foundation

extension Float {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
}
