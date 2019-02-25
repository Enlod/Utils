//
//  SingleInput.swift
//  ConsoleTest
//
//  Created by Roman Voskovskyi on 1/31/19.
//  Copyright © 2019 Roman Voskovskyi. All rights reserved.
//

import Foundation

public func curry<Input1, Input2, Output>
    (
    _ fun: @escaping (Input1, Input2) -> Output
    )
    -> (Input1) -> (Input2) -> Output
{
    return { input1 in
        return { input2 in
            fun(input1, input2)
        }
    }
}

public func flip<Input1, Input2, Output>
    (
    _ fun: @escaping (Input1) -> (Input2) -> Output
    )
    -> (Input2) -> (Input1) -> Output
{
    return { input2 in
        return { input1 in
            fun(input1)(input2)
        }
    }
}
