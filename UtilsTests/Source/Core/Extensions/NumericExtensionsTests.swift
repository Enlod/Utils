//
//  NumericExtensionsTests.swift
//  Utils
//
//  Created by Roman Voskovskyi on 2/1/19.
//  Copyright © 2019 RomanVoskovskyi. All rights reserved.
//

final class NumericUtilsTests: TestCase
{
    let test = { (fun: (inout Int) -> (), increment: Bool) in
        let initialValue = 0
        var value = initialValue
        fun(&value)
        
        value
        |> equal(initialValue + (increment ? 1 : -1))
        |> Tests.isTrue
    }
    
    func testIncrement()
    {
        test({ $0.increment() }, true)
    }
    
    func testDecrement()
    {
        test({ $0.decrement() }, false)
    }
    
    func testIncremented()
    {
        test({ $0 = $0.incremented() }, true)
    }
    
    func testDecremented()
    {
        test({ $0 = $0.decremented() }, false)
    }
}
