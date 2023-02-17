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
            Text(store.state.currentAnimal)
                .font(.system(.largeTitle))
            Button("Tap me") {
                store.dispatch(.getAnimal)
            }
        }
    }
}

struct AnimalView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalView()
            .environmentObject(AppStore(initialState: .init(), reducer: appReducer(state:action:)))
    }
}
