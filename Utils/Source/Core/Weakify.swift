//
//  Weakified.swift
//  ConsoleTest
//
//  Created by Roman Voskovskyi on 1/31/19.
//  Copyright © 2019 Roman Voskovskyi. All rights reserved.
//

import Foundation

//MARK: - 0 input

public func weakify<Element: AnyObject>
    (
    _ element: Element,
    _ fun: @escaping (Element) -> ()
    )
    -> () -> ()
{
    return { [weak element] in
        element.map(fun)
    }
}

public func weakifyResult<Element: AnyObject, Output: Initializable>
    (
    _ element: Element,
    _ fun: @escaping (Element) -> Output
    )
    -> () -> Output
{
    return { [weak element] in
        return element.map(fun).unwrapped()
    }
}

//MARK: - 1 input

public func weakify<Element: AnyObject, Input>
    (
    _ element: Element,
    _ fun: @escaping (Element, Input) -> ()
    )
    -> (Input) -> ()
{
    return { [weak element] param in
        element.map { fun($0, param) }
    }
}

public func weakify<Element1: AnyObject, Element2: AnyObject, Input>
    (
    _ element1: Element1,
    _ element2: Element2,
    _ fun: @escaping (Element1, Element2, Input) -> ()
    )
    -> (Input) -> ()
{
    return { [weak element1, weak element2] param in
        map((element1, element2)) { fun($0, $1, param) }
    }
}

//MARK: - 2 input

public func weakify<Element: AnyObject, Input1, Input2>
    (
    _ element: Element,
    _ fun: @escaping (Element, Input1, Input2) -> ()
    )
    -> (Input1, Input2) -> ()
{
    return { [weak element] input1, input2 in
        element.map { fun($0, input1, input2) }
    }
}

//MARK: - 3 input

public func weakify<Element: AnyObject, Input1, Input2, Input3>
    (
    _ element: Element,
    _ fun: @escaping (Element, Input1, Input2, Input3) -> ()
    )
    -> (Input1, Input2, Input3) -> ()
{
    return { [weak element] input1, input2, input3 in
        element.map { fun($0, input1, input2, input3) }
    }
}
