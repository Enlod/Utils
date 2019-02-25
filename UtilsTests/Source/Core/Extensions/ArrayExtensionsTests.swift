//
//  ArrayExtensionsTests.swift
//  UtilsTests
//
//  Created by Roman Voskovskyi on 2/3/19.
//  Copyright © 2019 RomanVoskovskyi. All rights reserved.
//

class ArrayUtilsTests: TestCase
{
    func testSafeSubscriptIndex()
    {
        let value = 7
        let array = [value]
        let nilValue: Int? = nil
        
        [
            (-1, nilValue),
            (0, value),
            (1, nilValue)
        ]
            .forEach {
                array.element(at: $0) |> Tests.isEqual($1)
            }
    }
    
    func testMove()
    {
        var array = [1,2,3,4,5]
        let firstIndex = 0
        let lastIndex = array.count.decremented()
        let lowerThanFirstIndex = firstIndex.decremented()
        let greaterThanLastIndex = lastIndex.incremented()
        
        let testArrayEqual = { (modifier: () -> (), expectedArray: [Int]) in
            modifier()
            
            array |> Tests.isEqual(expectedArray)
        }
        let testArrayEqualInitialOne = { testArrayEqual($0, array) }
        
        [
            (lowerThanFirstIndex, lastIndex),
            (firstIndex, firstIndex),
            (lastIndex, lastIndex),
            (firstIndex, greaterThanLastIndex),
            (lowerThanFirstIndex, greaterThanLastIndex)
        ]
            .map { it
                in
                return { array.move(from: it.0, to: it.1) }
            }
            .forEach(testArrayEqualInitialOne)
        
        testArrayEqual({ array.move(from: firstIndex, to: lastIndex) }, [2,3,4,5,1])
        testArrayEqual({ array.move(from: lastIndex.decremented(), to: firstIndex.incremented() ) }, [2,5,3,4,1])
    }
}
