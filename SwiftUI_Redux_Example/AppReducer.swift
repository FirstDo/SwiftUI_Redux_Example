//
//  AppReducer.swift
//  SwiftUI_Redux_Example
//
//  Created by dudu on 2023/02/17.
//

import Foundation
import Combine

// Reducer

// Store

typealias Middleware<State, Action> = (State, Action) -> AnyPublisher<Action, Never>?
typealias AppStore = Store<AppState, AppAction>

final class Store<State, Action>: ObservableObject {
    @Published private(set) var state: State
    
    private var tasks = [AnyCancellable]()
    private let serialQueue = DispatchQueue(label: "redux.serial.queue")
    
    private let reducer: Reducer<State, Action>
    let middlewares: [Middleware<State, Action>]
    private var middlewareCancellables = Set<AnyCancellable>()
    
    init(
        initialState: State,
        reducer: @escaping Reducer<State, Action>,
        middlewares: [Middleware<State, Action>] = []
    ) {
        self.state = initialState
        self.reducer = reducer
        self.middlewares = middlewares
    }
    
    func dispatch(_ action: Action) {
        reducer(&state, action)
        
        for mv in middlewares {
            guard let middleware = mv(state, action) else {
                break
            }
            
            middleware
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: dispatch)
                .store(in: &middlewareCancellables)
        }
    }
}
