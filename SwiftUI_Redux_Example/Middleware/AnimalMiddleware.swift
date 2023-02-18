//
//  AnimalMiddleware.swift
//  SwiftUI_Redux_Example
//
//  Created by dudu on 2023/02/18.
//

import Foundation
import Combine

enum AnimalMiddlewareError: Error {
    case unknown
    case networkError
}

func animalMiddleware(service: AnimalService) -> Middleware<AppState, AppAction> {
    return { state, action in
        switch action {
        case .animal(.fetch):
            return service.generateAnimalInTheFuture()
                .subscribe(on: DispatchQueue.main)
                .map { AppAction.animal(action: .fetchComplete(animal: $0)) }
                .catch { error -> Just<AppAction> in
                    switch error {
                    case .unknown:
                        return Just(AppAction.animal(action: .fetchComplete(animal: "Oops")))
                    case .networkError:
                        return Just(AppAction.animal(action: .fetchComplete(animal: "Network Failed")))
                    }
                }
                .eraseToAnyPublisher()
        default:
            break
        }
        
        return Empty().eraseToAnyPublisher()
    }
}
