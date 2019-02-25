//
//  DictionaryExtensions.swift
//  ConsoleTest
//
//  Created by Roman Voskovskyi on 1/31/19.
//  Copyright © 2019 Roman Voskovskyi. All rights reserved.
//

import Foundation

public extension Dictionary
{
    func value(for key: Key) -> Value?
    {
        return self[key]
    }
    
    mutating func set(_ value: Value, for key: Key)
    {
        self[key] = value
    }
    
    mutating func value(for key: Key, initializer: (Key) -> Value) -> Value
    {        
        return ifNill(
            get: { value(for: key) },
            initializer: {
                let value = initializer(key)
                set(value, for: key)
                
                return value
            }
        )
    }
    
    mutating func apply(for key: Key, mutator: (Value) -> Value)
    {
        value(for: key)
            .map { set(mutator($0), for: key) }
    }
}

public extension Dictionary where Value: Initializable
{
    mutating func applyUnwrapped(for key: Key, mutator: (Value) -> Value)
    {
        value(for: key).unwrapped()
            |> { set(mutator($0), for: key) }
    }
}
