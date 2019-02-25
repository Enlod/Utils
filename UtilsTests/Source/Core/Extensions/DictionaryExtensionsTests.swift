//
//  DictionaryExtensionsTests.swift
//  UtilsTests
//
//  Created by Roman Voskovskyi on 2/4/19.
//  Copyright © 2019 RomanVoskovskyi. All rights reserved.
//

class DictionaryUtilsTests: TestCase
{
    func testValueForKey()
    {
        let key = 0
        let value = 1
        let dict = [key: value]
        
        dict.value(for: key) |> Tests.isEqual(value)
        dict.value(for: value) |> Tests.isEqual(nil)
    }
    
    func testSetValueForKey()
    {
        var dict = [Int: Int]()
        let key = 1
        let value = 2
        
        dict.set(value, for: key)
        
        dict.value(for: key) |> Tests.isEqual(value)
    }
    
    func testValueForKeyInitializer()
    {
        Tests.invocationsOnce { invoke in
            var dict = [Int: Int]()
            let key = 1
            let value = 2
            
            dict.value(for: key) { key in
                invoke()
                
                return value
            }
            |> Tests.isEqual(value)
            
            dict.value(for: key) |> Tests.isEqual(value)
        }
    }
    
    func testApply()
    {
        let key = 5
        let value = 2
        let mutator = { Int.incremented($0)() }
        
        [
            (key, mutator(value)),
            (key.incremented(), value)
        ]
            .forEach {
                var dict = [key: value]
                dict.apply(for: $0, mutator: mutator)
                dict.value(for: key) |> Tests.isEqual($1)
            }
    }
    
    func testAppliedUnwrapped()
    {
        let key = 0
        let value = [1: 2]
        
        var dict = [Int: [Int: Int]]()
        dict[key].appliedUnwrapped { dict in
            dict = value
        }
        
        dict[key] |> Tests.isEqual(value)
    }
}
