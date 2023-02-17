//
//  AppState.swift
//  SwiftUI_Redux_Example
//
//  Created by dudu on 2023/02/17.
//

import Foundation

struct AppState {
    var animal: AnimalState
}

struct AnimalState {
    var currentAnimal: String = ""
}
