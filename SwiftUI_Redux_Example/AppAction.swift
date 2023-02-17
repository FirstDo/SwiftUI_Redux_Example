//
//  AppAction.swift
//  SwiftUI_Redux_Example
//
//  Created by dudu on 2023/02/17.
//

import Foundation

enum AppAction {
    case animal(action: AnimalAction)
}

enum AnimalAction {
    case fetchAnimal
    case setCurrentAnimal(animal: String)
}
