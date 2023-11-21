//
//  ContentView.swift
//  AppApp
//
//  Created by Dylan Elliott on 20/11/2023.
//

import SwiftUI
import DylKit

struct ContentView<Content: View>: View {
    @Binding var variables: Variables
    @State var error: Error?
    @State var view: Content
//    let initSteps: [Step]
    
    init(variables: Binding<Variables>, initSteps: [any Step], content: Content) throws {
        self._view = .init(initialValue: content)
        self._variables = variables
        
        onMain {
            do {
                try initSteps.forEach {
                    try $0.run(with: &variables.wrappedValue)
                }
            } catch {
                //
            }
        }
    }
    
    var body: some View {
        view
    }
}

//#Preview {
//    ContentView()
//}
