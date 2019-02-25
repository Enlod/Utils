//
//  ArrayExtensions.swift
//  ConsoleTest
//
//  Created by Roman Voskovskyi on 1/31/19.
//  Copyright © 2019 Roman Voskovskyi. All rights reserved.
//

import Foundation

public extension Array
{
    func element(at index: Int) -> Element?
    {
        return index < count && index >= 0
            ? self[index]
            : nil
    }
    
    mutating func move(from sourceIndex: Int, to destinationIndex: Int)
    {
        guard
            sourceIndex != destinationIndex
                && Swift.min(sourceIndex, destinationIndex) >= 0
                && Swift.max(sourceIndex, destinationIndex) < count
        else {
            return
        }
        
        let direction = sourceIndex < destinationIndex ? 1 : -1
        var sourceIndex = sourceIndex
        
        repeat {
            let nextSourceIndex = sourceIndex + direction
            swapAt(sourceIndex, nextSourceIndex)
            sourceIndex = nextSourceIndex
        }
        while sourceIndex != destinationIndex
    }
    
    mutating func apply(at index: Index, mutator: (Element) -> Element)
    {
        element(at: index)
            .map { self[index] = mutator($0) }
    }
}
