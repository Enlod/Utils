//
//  TransformTests.swift
//  UtilsTests
//
//  Created by Roman Voskovskyi on 2/4/19.
//  Copyright © 2019 RomanVoskovskyi. All rights reserved.
//

class TransformTests: TestCase
{
    func testFilter()
    {
        let value = 3
        
        [
            (value, Tests.isNotNill),
            (value.incremented(), Tests.isNill)
        ]
            .forEach {
                value
                    |> (filter <| equal($0))
                    |> $1
            }
    }
    
    func testLike()
    {
        [
            ("", true),
            (1, false),
        ]
            .forEach { (value: Any, result: Bool) in
                value
                    |> like(String.self)
                    |> isNotNill
                    |> Tests.isEqual(result)
            }
        
    }
}
