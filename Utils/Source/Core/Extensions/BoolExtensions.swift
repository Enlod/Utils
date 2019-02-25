//
//  BoolExtensions.swift
//  ConsoleTest
//
//  Created by Roman Voskovskyi on 1/31/19.
//  Copyright © 2019 Roman Voskovskyi. All rights reserved.
//

import Foundation

public extension Bool
{
    static func values() -> [Bool]
    {
        return [true, false]
    }
    
    static func and(_ value: Bool) -> (Bool) -> Bool
    {
        return { $0 && value }
    }
    
    static func or(_ value: Bool) -> (Bool) -> Bool
    {
        return { $0 || value }
    }
    
    static func isFalse(_ value: Bool) -> Bool
    {
        return !value
    }
}
