//
//  Initializable.swift
//  Utils
//
//  Created by Roman Voskovskyi on 2/2/19.
//  Copyright © 2019 RomanVoskovskyi. All rights reserved.
//

import UIKit

public protocol Initializable
{
    init()
}

extension Array: Initializable {}
extension Dictionary: Initializable {}
extension Set: Initializable {}
extension String: Initializable {}
extension Bool: Initializable {}
extension Int: Initializable {}
extension Double: Initializable {}
extension Float: Initializable {}
extension UITableViewCell: Initializable {}
