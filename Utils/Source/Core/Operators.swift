//
//  Operators.swift
//  ConsoleTest
//
//  Created by Roman Voskovskyi on 1/31/19.
//  Copyright © 2019 Roman Voskovskyi. All rights reserved.
//

import Foundation

precedencegroup PipePrecedence {
    associativity: left
    higherThan: AssignmentPrecedence
}

precedencegroup CompositionPrecedence {
    associativity: left
    higherThan: PipePrecedence
}

infix operator <|: PipePrecedence
infix operator |>: PipePrecedence
infix operator >>>: CompositionPrecedence

// MARK: -

public func <| <Input, Output>(_ fun: (Input) throws -> Output, _ input: Input) rethrows -> Output
{
    return try fun(input)
}

public func |> <Input, Output>(_ input: Input, _ fun: (Input) throws -> Output) rethrows -> Output
{
    return try fun(input)
}

public func >>> <A, B, C>(_ lhs: @escaping (A) -> B, _ rhs: @escaping (B) -> C) -> (A) -> C
{    
    return { $0 |> lhs |> rhs }
}
