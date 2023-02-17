//
//  AnimalMiddleware.swift
//  SwiftUI_Redux_Example
//
//  Created by dudu on 2023/02/17.
//

import Foundation
import Combine

func animalMiddleware(service: AnimalService) -> Middleware<AppState, AppAction> {
    return { state, action in
        switch action {
        case .animal(action: .fetchAnimal):
            return service.generateAnimalInTheFuture()
                .subscribe(on: DispatchQueue.main)
                .map { AppAction.animal(action: .setCurrentAnimal(animal: $0)) }
                .eraseToAnyPublisher()
            
        default:
            return Empty().eraseToAnyPublisher()
        }
    }
}
