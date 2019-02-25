//
//  OptionalExtensionsTests.swift
//  UtilsTests
//
//  Created by Roman Voskovskyi on 2/3/19.
//  Copyright © 2019 RomanVoskovskyi. All rights reserved.
//

class OptionalUtilsTests: TestCase
{
    func testIfNill()
    {
        var optionalValue: Int? = nil
        let value = 7
        
        ifNill(
            get: { optionalValue },
            initializer: {
                let result = value
                optionalValue = result
                
                return result
            }
        )
        |> Tests.isEqual(value)
    }
    
    func testIsNillAndIsNotNill()
    {
        [
            (0, Tests.isFalse),
            (nil, Tests.isTrue)
        ]
            .forEach {
                $0 |> isNill |> $1
                $0 |> isNotNill |> Bool.isFalse |> $1
        }
    }
    
    func testFilter()
    {
        let value = 0
        
        [
            (value, Tests.isNotNill),
            (value.incremented(), Tests.isNill),
            (nil, Tests.isNill)
        ]
            .forEach {
                $0
                |> Optional.filter <| equal(value)
                |> $1
            }
    }
    
    func testMap()
    {
        let nilValue: Int? = nil
        let nonNilValue = 7
        
        let stub = { (any: Any) in () }
        
        map((nilValue, nilValue), stub)
            |> Tests.isNill
        
        map((nilValue, nonNilValue), stub)
            |> Tests.isNill
        
        map((nonNilValue, nonNilValue), { equal($0)($1) })
            .map(Tests.isTrue)
            |> Tests.isNotNill
        
        
        map((nilValue, nilValue, nilValue), stub)
            |> Tests.isNill
        
        map((nilValue, nonNilValue, nonNilValue), stub)
            |> Tests.isNill
        
        map((nonNilValue, nonNilValue, nonNilValue), { equal($0)($1) |> Bool.and(equal($0)($2)) })
            .map(Tests.isTrue)
            |> Tests.isNotNill
    }
    
    func testUnwrapped()
    {
        let defaultValue: Int = .init()
        
        [
            (7, false),
            (nil, true)
        ]
        .forEach {
            $0.unwrapped() |> equal(defaultValue) |> Tests.isEqual($1)
        }
    }
    
    func testNotEmpty()
    {
        [
            ("", Tests.isNill),
            (nil, Tests.isNill),
            ("_", Tests.isNotNill)
        ]
            .forEach {
                $0
                |> Optional.notEmpty |> invoke
                |> $1
            }
    }
}
