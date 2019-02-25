//
//  Transform.swift
//  ConsoleTest
//
//  Created by Roman Voskovskyi on 1/31/19.
//  Copyright © 2019 Roman Voskovskyi. All rights reserved.
//

import Foundation

public func filter<Input>(_ fun: @escaping (Input) -> Bool) -> (Input) -> Input?
{
    return { fun($0) ? $0 : nil }
}

public func like<Input, Output>(_ type: Output.Type) -> (Input) -> Output?
{
    return { $0 as? Output }
}
