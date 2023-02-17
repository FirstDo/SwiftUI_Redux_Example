//
//  AppReducer.swift
//  SwiftUI_Redux_Example
//
//  Created by dudu on 2023/02/17.
//

import Foundation

// State

struct AppState {
    var currentAnimal: String = ""
}

// Action

enum AppAction {
    case getAnimal
}

// Reducer

typealias Reducer<State, Action> = (inout State, Action) -> Void

func appReducer(state: inout AppState, action: AppAction) -> Void {
    switch action {
    case .getAnimal:
        state.currentAnimal = [
            "Cat","Dog","Crow","Horse","Iguana","Cow","Racoon"
        ].randomElement()!
    }
}

// Store

typealias AppStore = Store<AppState, AppAction>

final class Store<State, Action>: ObservableObject {
    @Published private(set) var state: State
    
    private let reducer: Reducer<State, Action>
    
    init(initialState: State, reducer: @escaping Reducer<State, Action>) {
        self.state = initialState
        self.reducer = reducer
    }
    
    func dispatch(_ action: Action) {
        reducer(&state, action)
    }
}
