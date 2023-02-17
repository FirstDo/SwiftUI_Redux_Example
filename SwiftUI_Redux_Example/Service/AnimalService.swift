//
//  AnimalService.swift
//  SwiftUI_Redux_Example
//
//  Created by dudu on 2023/02/17.
//

import Foundation
import Combine

struct AnimalService {
    func generateAnimalInTheFuture() -> AnyPublisher<String, Never> {
        let animals = ["Cat", "Dog", "Crow", "Horse", "Iguana", "Cow", "Racoon"]
        let number = Double.random(in: 0..<5)
        return Future<String, Never> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + number) {
                let result = animals.randomElement()!
                promise(.success(result))
            }
        }
        .eraseToAnyPublisher()
    }
}
