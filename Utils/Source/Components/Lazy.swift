//
//  Lazy.swift
//  TemplateProject
//
//  Created by Roman Voskovskyi on 8/22/18.
//  Copyright © 2018 Roman Voskovskyi. All rights reserved.
//

import Foundation

public final class Lazy<Value>
{
    private let initializer: () -> Value
    public var cachedValue: Value?
    
    public init(_ initializer: @escaping () -> Value)
    {
        self.initializer = initializer
    }
    
    public func get() -> Value
    {
        return ifNill(
            get: { cachedValue },
            initializer: {
                let value = initializer()
                cachedValue = value
                
                return value
            }
        )
    }
    
    public func modify(_ fun: (Value) -> Value)
    {
        cachedValue = get() |> fun
    }
}
