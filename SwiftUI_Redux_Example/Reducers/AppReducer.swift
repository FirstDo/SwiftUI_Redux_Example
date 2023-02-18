//
//  Reducer.swift
//  SwiftUI_Redux_Example
//
//  Created by dudu on 2023/02/18.
//

import Foundation

typealias Reducer<State, Action> = (inout State, Action) -> Void

func appReducer(state: inout AppState, action: AppAction) -> Void {
    switch action {
    case .animal(let action):
        animalReducer(state: &state.animal, action: action)
    }
}
