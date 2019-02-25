//
//  BoolExtensionsTests.swift
//  Utils
//
//  Created by Roman Voskovskyi on 2/1/19.
//  Copyright © 2019 RomanVoskovskyi. All rights reserved.
//

final class BoolUtilsTests: TestCase
{
    func testValue()
    {
        
        Bool.values()
            |> {
                let contains = Array.contains($0)
                
                return
                    contains(true)
                    && contains(false)
                    && $0.count == 2
            }
            |> Tests.isTrue
    }
    
    func testAndOr()
    {
        [
            (false, false, false, false),
            (true, false, false, true),
            (false, true, false, true),
            (true, true, true, true)
        ]
            .forEach {
                $0 |> Bool.and($1) |> Tests.isEqual($2)
                $0 |> Bool.or($1) |> Tests.isEqual($3)
            }
    }
    
    func testIsFalse()
    {
        [
            (true, Tests.isFalse),
            (false, Tests.isTrue)
        ]
        .forEach { $0 |> Bool.isFalse |> $1 }
    }
}
