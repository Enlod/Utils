//
//  OptionalExtensions.swift
//  ConsoleTest
//
//  Created by Roman Voskovskyi on 1/31/19.
//  Copyright © 2019 Roman Voskovskyi. All rights reserved.
//

import Foundation

public func isNill<T>(_ value: T?) -> Bool
{
    return value == nil
}

public func isNotNill<T>(_ value: T?) -> Bool
{
    return value != nil
}

public func ifNill<T>(get: () -> T?, initializer: () -> T) -> T
{
    return get() ?? initializer()
}

public func map<Input1, Input2, Output>
    (
    _ inputs: (Input1?, Input2?),
    _ closure: ((Input1, Input2)) throws -> Output
    )
    rethrows -> Output?
{
    guard
        let input1 = inputs.0,
        let input2 = inputs.1
        else {
            return nil
    }
    
    return try closure((input1, input2))
}

public func map<Input1, Input2, Input3, Output>
    (
    _ inputs: (Input1?, Input2?, Input3?),
    _ closure: ((Input1, Input2, Input3)) throws -> Output
    )
    rethrows -> Output?
{
    guard
        let input1 = inputs.0,
        let input2 = inputs.1,
        let input3 = inputs.2
        else {
            return nil
    }
    
    return try closure((input1, input2, input3))
}

// MARK: -

public extension Optional
{
    func filter(_ predicate: (Wrapped) -> Bool) -> Wrapped?
    {
        return flatMap { predicate($0) ? $0 : nil }
    }
}

// MARK: -

public extension Optional where Wrapped: Initializable
{
    func unwrapped() -> Wrapped
    {
        return self ?? .init()
    }
    
    mutating func appliedUnwrapped(_ mutator: (inout Wrapped) -> ())
    {
        var value = unwrapped()
        mutator(&value)
        self = value
    }
}

// MARK: -

public extension Optional where Wrapped: Emptiable
{
    func notEmpty() -> Wrapped?
    {
        return flatMap(Wrapped.notEmpty >>> invoke)
    }
}
