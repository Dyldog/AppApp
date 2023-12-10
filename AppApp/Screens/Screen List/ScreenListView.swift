//
//  ScreenListView.swift
//  AppApp
//
//  Created by Dylan Elliott on 22/11/2023.
//

import SwiftUI
import DylKit
import Armstrong

class ScreenListViewModel: ObservableObject {
    var screens: [Screen] {
        get { Screen.screens }
        set{ Screen.screens = newValue }
    }
    
    var defaultScreens: [Screen] {
        Screen.defaults
    }
    
    func addBookmark(for index: Int) {
        
    }
}

struct ScreenListView: View {
    @StateObject var viewModel: ScreenListViewModel = .init()
    
    func onUpdate(_ screen: Screen, index: Int?) -> ((Screen) -> Void)? {
        if let index = index {
            return {
                viewModel.objectWillChange.send()
                viewModel.screens[index] = $0
            }
        } else {
            return { _ in }
        }
    }
    
    func screenView(_ screen: Screen, index: Int?) -> some View {
        NavigationLink {
            ViewMakerView(viewModel: .init(
                screen: screen,
                makeMode: false,
                onUpdate: onUpdate(screen, index: index))
            )
        } label: {
            Text(screen.name).font(.largeTitle)
        }
    }
    var body: some View {
        List {
            if !viewModel.screens.isEmpty {
                Section("User") {
                    ForEach(enumerated: viewModel.screens) { (index, screen) in
                        screenView(screen, index: index)
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
            }
            
            Section("Defaults") {
                ForEach(viewModel.defaultScreens) { screen in
                        screenView(screen, index: nil)
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
                            )
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
