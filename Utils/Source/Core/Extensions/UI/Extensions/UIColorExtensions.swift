//
//  UIColorExtensions.swift
//  TemplateProject
//
//  Created by Roman Voskovskyi on 8/26/18.
//  Copyright © 2018 Roman Voskovskyi. All rights reserved.
//

import UIKit

extension UIColor
{
    convenience init(red: Int, green: Int, blue: Int)
    {
        let component = { (color: Int) in CGFloat(color) / 255 }
        
        self.init(
            red: component(red),
            green: component(green),
            blue: component(blue),
            alpha: 1.0
        )
    }
    
    convenience init(rgb: Int)
    {
        let component = { (rgb >> ($0 * 8)) & 0xFF }
        
        self.init(
            red: component(2),
            green: component(1),
            blue: component(0)
        )
    }
}
