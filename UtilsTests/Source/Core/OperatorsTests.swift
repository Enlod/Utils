//
//  OperatorsTests.swift
//  UtilsTests
//
//  Created by Roman Voskovskyi on 2/3/19.
//  Copyright © 2019 RomanVoskovskyi. All rights reserved.
//

class OperatorsTests: TestCase
{
    func testPipe()
    {
        scope |> Tests.invocationsOnce
    }
    
    // MARK: -
    
    func testComposition()
    {
        let increment = { (value: Int) in
            return value.incremented()
        }
        let double = { $0 * 2 }
        let incrementAndDouble = increment >>> double
        
        1 |> incrementAndDouble |> Tests.isEqual(4)
    }
}
