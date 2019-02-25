//
//  General.swift
//  ConsoleTest
//
//  Created by Roman Voskovskyi on 1/31/19.
//  Copyright © 2019 Roman Voskovskyi. All rights reserved.
//

import Foundation

public func scope(_ fun: () -> ())
{
    fun()
}

public func invoke<Output>(_ fun: () -> Output) -> Output
{
    return fun()
}

public func invoke<Output>(_ fun: () throws -> Output) rethrows -> Output
{
    return try fun()
}

public func repeated(_ count: Int) -> (() -> ()) -> ()
{
    return { fun
        in
        (0..<count).forEach { _ in fun() }
    }
}

public func lazy<Output>(_ fun: @escaping () -> Output) -> () -> Output
{
    return Lazy(fun).get
}

public func ignoreInput<Input, Output>(_ fun: @escaping () -> Output) -> (Input) -> Output
{
    return { _ in fun() }
}

public func equal<Value: Equatable>(_ value: Value) -> (Value) -> Bool
{
    return { $0 == value }
}

public func toString<Value: CustomStringConvertible>(_ value: Value) -> String
{
    return value.description
}

public let print = { Swift.print($0) }

public func mesure(_ fun: () -> Void)
{
    let date = { Date() }
    let timeInterval = { (date: Date) in date.timeIntervalSince1970 }
    let start = date()
    
    fun()
    
    "time: \((date() |> timeInterval) - (start |> timeInterval))"
        |> print
}
