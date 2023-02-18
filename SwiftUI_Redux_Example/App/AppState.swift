//
//  AppState.swift
//  SwiftUI_Redux_Example
//
//  Created by dudu on 2023/02/18.
//

import Foundation

struct AppState {
    var animal: AnimalState
}

struct AnimalState {
    var current: String = ""
    var fetchError: String?
    var fetchInProgress: Bool = false
}
