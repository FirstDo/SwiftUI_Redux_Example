//
//  AnimalView.swift
//  SwiftUI_Redux_Example
//
//  Created by dudu on 2023/02/17.
//

import SwiftUI

struct AnimalView: View {
    @EnvironmentObject var store: AppStore
    
    var body: some View {
        VStack {
            Text(store.state.animal.currentAnimal)
                .font(.system(.largeTitle))
            Button("Tap me") {
                store.dispatch(.animal(action: .fetchAnimal))
            }
        }
    }
}
