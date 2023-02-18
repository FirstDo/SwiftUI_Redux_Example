//
//  AnimalAction.swift
//  SwiftUI_Redux_Example
//
//  Created by dudu on 2023/02/18.
//

import Foundation

enum AnimalAction {
    case fetch
    case fetchComplete(animal: String)
    case fetchError(error: AnimalMiddlewareError?)
}
