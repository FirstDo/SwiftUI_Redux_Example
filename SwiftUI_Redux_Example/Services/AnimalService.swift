//
//  AnimalService.swift
//  SwiftUI_Redux_Example
//
//  Created by dudu on 2023/02/18.
//

import Foundation
import Combine

enum AnimalServiceError: Error, CaseIterable {
    case unknown
    case networkError
}

struct AnimalService {
    
    var requestNumber = 0
    
    func generateAnimalInTheFuture() -> AnyPublisher<String, AnimalServiceError> {
        let animals = ["Cat", "Dog", "Crow", "Hores", "Iguana", "Cow", "Racoon"]
        let number = Double.random(in: 2...5)
        
        return Future<String, AnimalServiceError> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + number) {
                
                if Bool.random() {
                    promise(.success(animals.randomElement()!))
                } else {
                    promise(.failure(.allCases.randomElement()!))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
