//
//  GeneralTests.swift
//  Utils
//
//  Created by Roman Voskovskyi on 1/31/19.
//  Copyright © 2019 RomanVoskovskyi. All rights reserved.
//

final class GeneralTests: TestCase
{
    func testScope()
    {
        scope |> Tests.invocationsOnce
    }
    
    func testInvoke()
    {
        invoke |> Tests.invocationsOnce
    }
    
    func testTimes()
    {
        let repeats = 3
        
        repeated(repeats) |> Tests.invocations(repeats)
    }
    
    func testLazy()
    {
        Tests.invocationsOrder { invoke1, invoke2
            in
            let lazyValue = lazy { () -> Int
                in
                invoke2()
                
                return 0
            }
            
            invoke1()
            
            _ = lazyValue()
        }
    }
}
