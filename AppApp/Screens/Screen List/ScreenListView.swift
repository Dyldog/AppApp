//
//  ScreenListView.swift
//  AppApp
//
//  Created by Dylan Elliott on 22/11/2023.
//

import Armstrong
import DylKit
import SwiftUI
import WidgetKit

class ScreenListViewModel: ObservableObject {
    var screens: [Screen] {
        get {
            Screen.screens
        }
        set {
            objectWillChange.send()
            Screen.screens = newValue
            WidgetCenter.shared.reloadAllTimelines()
        }
    }

    var defaultScreens: [Screen] { AALibrary.shared.demoScreens }
}

struct ScreenListView: View {
    @ObservedObject var viewModel: ScreenListViewModel
    @State var showExport: Bool = false
    @State var exportScreen: Screen?

    func onUpdate(_: Screen, index: Int?) -> ((Screen) -> Void)? {
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
                scope: .init(),
                screen: screen,
                makeMode: false,
                onUpdate: onUpdate(screen, index: index)
            )
            )
        } label: {
            Text(screen.name).font(.largeTitle)
        }
    }

    func exportButton(for screen: Screen) -> some View {
        Button {
            exportScreen = screen
            showExport = true
        } label: {
            Label("Favorite", systemImage: "square.and.arrow.up")
        }
        .tint(.yellow)
    }

    var body: some View {
        List {
            if !viewModel.screens.isEmpty {
                Section("User") {
                    ForEach(viewModel.screens.enumeratedArray(), id: \.element.id) { index, screen in
                        screenView(screen, index: index)
                            .swipeActions {
                                Button {
                                    UIPasteboard.general.copy(screen)
                                } label: {
                                    Label("Copy", systemImage: "doc.on.clipboard")
                                }
                                .tint(.blue)

                                exportButton(for: screen)

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
                        .swipeActions {
                            exportButton(for: screen)
                        }
                }
            }
        }
        .fileExporter(
            isPresented: $showExport,
            document: exportScreen.map { ScreenDocument(screen: $0) },
            contentType: .screen,
            defaultFilename: exportScreen?.name,
            onCompletion: { _ in
                //
            }
        )
        .navigationTitle("Screens")
        .toolbar {
            ToolbarItem(placement: .navigation) {
                SwiftUI.Button {
                    viewModel.screens.append(Screen(
                        id: .init(),
                        name: randomString(length: 5).uppercased(),
                        initVariables: .makeDefault(),
                        initActions: .init(value: []),
                        subscreens: [],
                        content: .makeDefault()
                    ))
                    viewModel.objectWillChange.send()
                } label: {
                    Image(systemName: "plus.app.fill")
                }
            }
        }
    }
}
