//
//  AnimalView.swift
//  SwiftUI_Redux_Example
//
//  Created by dudu on 2023/02/18.
//

import SwiftUI

struct AnimalView: View {
    @EnvironmentObject var store: AppStore
    
    var body: some View {
        let shouldDisplayError = Binding<Bool> {
            store.state.animal.fetchError != nil
        } set: { _ in
            store.dispatch(.animal(action: .fetchError(error: nil)))
        }

        
        VStack {
            if store.state.animal.fetchInProgress {
                ProgressView("Fetching Animal...")
            } else {
                Text(store.state.animal.current)
                    .font(.largeTitle)
                    .padding()
                Button("Tap me") {
                    store.dispatch(.animal(action: .fetch))
                }
            }
        }
        .alert(isPresented: shouldDisplayError) {
             Alert(
                title: Text("An error has Ocurred"),
                message: Text(store.state.animal.fetchError ?? ""),
                dismissButton: .default(Text("Got it!"))
             )
         }
    }
}
