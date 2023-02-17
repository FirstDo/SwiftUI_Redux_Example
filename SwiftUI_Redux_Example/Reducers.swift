//
//  Reducers.swift
//  SwiftUI_Redux_Example
//
//  Created by dudu on 2023/02/17.
//

import Foundation

typealias Reducer<State, Action> = (inout State, Action) -> Void

func appReducer(state: inout AppState, action: AppAction) -> Void {
    switch action {
    case .animal(let action):
        animalReducer(state: &state.animal, action: action)
    }
}

func animalReducer(state: inout AnimalState, action: AnimalAction) -> Void {
    switch action {
    case .fetchAnimal:
        state.currentAnimal = "Loading..."
    case .setCurrentAnimal(let animal):
        state.currentAnimal = animal
    }
}
