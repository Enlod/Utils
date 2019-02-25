//
//  Tests.swift
//  UtilsTests
//
//  Created by Roman Voskovskyi on 1/31/19.
//  Copyright © 2019 RomanVoskovskyi. All rights reserved.
//

import XCTest

public class TestCase: XCTestCase
{
    public enum Tests
    {
        static func invocations(_ target: Int) -> ((@escaping () -> ()) throws -> ()) -> ()
        {
            return { fun
                in
                var invocations = 0
                
                Tests.noThrow {
                    try fun { invocations.increment() }
                }
                
                target |> isEqual(invocations)
            }
        }
        
        static let invocationsZero = invocations(0)
        static let invocationsOnce = invocations(1)
        
        static func invocationsOrder(_ fun: (@escaping () -> (), @escaping () -> ()) throws -> ())
        {
            var isInvoked1 = false
         
            invocationsOnce { invoke1 in
                invocationsOnce { invoke2 in
                    Tests.noThrow {
                        try fun({
                            invoke1()
                            isInvoked1 = true
                        }, {
                            isInvoked1 |> Tests.isTrue
                            invoke2()
                    })}
                }
            }
        }
        
        static func fail()
        {
            false |> Tests.isTrue
        }
        
        static func isTrue(_ value: Bool)
        {
            XCTAssertTrue(value)
        }
        
        static func isFalse(_ value: Bool)
        {
            XCTAssertFalse(value)
        }
        
        static func isNill<T>(_ value: T?)
        {
            XCTAssertNil(value)
        }
        
        static func isNotNill<T>(_ value: T?)
        {
            XCTAssertNotNil(value)
        }
        
        static func isEqual<T: Equatable>(_ value: T) -> (T) -> ()
        {
            return equal(value) >>> isTrue
        }
        
        static func isNotEqual<T: Equatable>(_ value: T) -> (T) -> ()
        {
            return equal(value) >>> isFalse
        }
        
        static func noThrow(_ fun: () throws -> ())
        {
            do {
                try fun()
            }
            catch {
                Tests.fail()
            }
        }
    }
}
