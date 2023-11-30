//
//  ScreenListView.swift
//  AppApp
//
//  Created by Dylan Elliott on 22/11/2023.
//

import SwiftUI
import DylKit

class ScreenListViewModel: ObservableObject {
    var screens: [Screen] {
        get { Screen.screens }
        set{ Screen.screens = newValue }
    }
    
    func addBookmark(for index: Int) {
        
    }
}

struct ScreenListView: View {
    @StateObject var viewModel: ScreenListViewModel = .init()
    
    var body: some View {
        List {
            ForEach(enumerated: viewModel.screens) { (index, screen) in
                NavigationLink {
                    ViewMakerView(viewModel: .init(screen: screen, onUpdate: {
                        viewModel.objectWillChange.send()
                        viewModel.screens[index] = $0
                    }))
                } label: {
                    Text(screen.name).font(.largeTitle)
                }
                .swipeActions {
                    Button {
                        viewModel.addBookmark(for: index)
                    } label: {
                        Label("Favorite", systemImage: "bookmark.fill")
                    }
                    .tint(.yellow)
        
                    Button {
                        viewModel.screens.remove(atOffsets: [index])
                        viewModel.objectWillChange.send()
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                }
            }
        }
        .navigationTitle("Screens")
        .toolbar {
            ToolbarItem(placement: .navigation) {
                SwiftUI.Button {
                    viewModel.screens.append(Screen(
                        id: .init(),
                        name: randomString(length: 5).uppercased(),
                        initActions: .init(value: []),
                        content: .init(
                            content: .init(
                                value: [],
                                axis: .init(value: .vertical)
                            ),
                            padding: .init(value: 5)
                        )
                    ))
                    viewModel.objectWillChange.send()
                } label: {
                    Image(systemName: "plus.app.fill")
                }
            }
        }
    }
}

func randomString(length: Int) -> String {
  let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  return String((0..<length).map{ _ in letters.randomElement()! })
}
