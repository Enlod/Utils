//
//  NumericExtensions.swift
//  ConsoleTest
//
//  Created by Roman Voskovskyi on 1/31/19.
//  Copyright © 2019 Roman Voskovskyi. All rights reserved.
//

import Foundation

public extension Numeric
{
    private func incrementValue<T: Numeric>() -> T
    {
        return 1
    }

    // MARK: -
    
    mutating func increment()
    {
        self = incremented()
    }
    
    mutating func decrement()
    {
        self = decremented()
    }
    
    func incremented() -> Self
    {
        return self + incrementValue()
    }
    
    func decremented() -> Self
    {
        return self - incrementValue()
    }
}
