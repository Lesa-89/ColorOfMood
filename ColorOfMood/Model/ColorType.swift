//
//  ColorType.swift
//  ColorOfMood
//
//  Created by macbook on 15/08/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

enum ColorType {
    case red
    case green
    case blue
    case yellow
    
    var definition: String {
        switch self {
        case .red:
            return "Цвет настроения красный"
        case .green:
            return "Цвет настроения зелёный"
        case .blue:
            return "Цвет настроения синий)"
        case .yellow:
            return "Цвет настроения жёлтый"
        }
    }
}
