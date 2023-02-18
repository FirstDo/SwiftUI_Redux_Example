//
//  ContentView.swift
//  SwiftUI_Redux_Example
//
//  Created by dudu on 2023/02/17.
//

import SwiftUI

struct ContentView: View {
    let store = AppStore(
        initialState: .init(animal: AnimalState()),
        reducer: appReducer,
        middlewares: [
            animalMiddleware(service: AnimalService())
        ]
    )
    var body: some View {
        AnimalView()
            .environmentObject(store)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
