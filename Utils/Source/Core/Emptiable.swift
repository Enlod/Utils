//
//  Emptiable.swift
//  Utils
//
//  Created by Roman Voskovskyi on 1/31/19.
//  Copyright © 2019 RomanVoskovskyi. All rights reserved.
//

import Foundation

public protocol Emptiable
{
    func isEmpty() -> Bool
}

public extension Emptiable
{
    func notEmpty() -> Self?
    {
        return isEmpty() ? nil : self
    }
}

// MARK: -

extension String: Emptiable
{
    public func isEmpty() -> Bool
    {
        return isEmpty
    }
}

extension Array: Emptiable
{
    public func isEmpty() -> Bool
    {
        return isEmpty
    }
}

extension Dictionary: Emptiable
{
    public func isEmpty() -> Bool
    {
        return isEmpty
    }
}

extension Set: Emptiable
{
    public func isEmpty() -> Bool
    {
        return isEmpty
    }
}
