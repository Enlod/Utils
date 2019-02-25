//
//  Lazy.swift
//  UtilsTests
//
//  Created by Roman Voskovskyi on 2/25/19.
//  Copyright © 2019 RomanVoskovskyi. All rights reserved.
//

import XCTest

class LazyTests: TestCase
{
    func testLazy()
    {
        Tests.invocations(2) <| { invocation in
            let oldValue = 1
            let newValue = 4
            
            var value = oldValue
            let lazy = Lazy<Int> {
                invocation()
                return value
            }
            
            let test = { (value: Int)
                in
                lazy.cachedValue |> Tests.isNill
                lazy.get() |> Tests.isEqual(value)
                lazy.cachedValue |> Tests.isEqual(value)
            }
            
            test(oldValue)
            
            value = newValue
            lazy.cachedValue = nil
            
            test(newValue)
        }
    }
}
