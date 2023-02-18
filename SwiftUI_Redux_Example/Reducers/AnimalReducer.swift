//
//  AnimalReducer.swift
//  SwiftUI_Redux_Example
//
//  Created by dudu on 2023/02/18.
//

import Foundation

func animalReducer(state: inout AnimalState, action: AnimalAction) -> Void {
    switch action {
    case .fetch:
        state.fetchError = nil
        state.fetchInProgress = true
    case .fetchComplete(let animal):
        state.fetchInProgress = false
        state.current = animal
    case .fetchError(let error):
        switch error {
        case .networkError:
            state.fetchError = "Ooops!. It seems someone made a mistake"
        default:
            state.fetchError = "I'm sorry, but the server went away"
        }
        
        state.fetchInProgress = false
    }
}
