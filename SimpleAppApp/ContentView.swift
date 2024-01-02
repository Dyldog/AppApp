//
//  ContentView.swift
//  SimpleAppApp
//
//  Created by Dylan Elliott on 30/12/2023.
//

import SwiftUI
import Armstrong
import Alexandria

struct ContentView: View {
    @StateObject var listViewModel: ScreenListViewModel = .init()
    
    init() {
        AALibrary.shared.addProviders([Armstrong.self, Alexandria.self])
    }
    
    var body: some View {
        NavigationView {
            ScreenListView(viewModel: listViewModel)
        }
    }
}

#Preview {
    ContentView()
}
