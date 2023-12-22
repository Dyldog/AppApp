//
//  AppAppApp.swift
//  AppApp
//
//  Created by Dylan Elliott on 20/11/2023.
//

import SwiftUI
import DylKit

import AppAppKit
import Armstrong

@main
struct AppAppApp: App {
    var body: some Scene {
        WindowGroup {
            AppAppAppView()
        }
    }
}

struct AppAppAppView: View {
    enum Constants {
        static let autoLoadKey = "auto_load_app"
        static let marqueeFileExtension = "marqueescreen"
    }
    
    @State var alert: Alert?
    @State var deepLink: Screen? // = .mappyBoy
    @StateObject var listViewModel: ScreenListViewModel = .init()
    
    init() {
        _ = AppAppKit.shared
    }
    var body: some View {
        Group {
            if
                let autoLoadScreenName = UserDefaults.appApp.string(forKey: Constants.autoLoadKey),
                let screen = AppAppKit.shared.screen(named: autoLoadScreenName)
            {
                ViewMakerView(viewModel: .init(scope: nil, screen: screen, makeMode: false, onUpdate: nil))
            } else if let deepLink = deepLink {
                ViewMakerView(viewModel: .init(scope: nil, screen: deepLink, makeMode: false, onUpdate: nil))
            } else {
                NavigationView {
                    ScreenListView(viewModel: listViewModel)
                }.onOpenURL { incomingURL in
                    print("App was opened via URL: \(incomingURL)")
                    handleIncomingURL(incomingURL)
                }
            }
        }
    }
    
    private func handleIncomingURL(_ url: URL) {
        if url.scheme == "appapp"{
            handleDeeplink(url)
        } else if url.isFileURL {
            importScreen(url)
        }
        
    }
    
    private func importScreen(_ url: URL) {
        do {
            guard let data = FileManager().contents(atPath: url.path) else { return }
            
            var screen = try JSONDecoder().decode(Screen.self, from: data)
            
            if AALibrary.shared.allScreens.contains(where: { $0.name == screen.name }) {
                screen.name = "\(screen.name) 2"
            }
            
            Screen.screens.append(screen)
            listViewModel.screens = Screen.screens
            
            if url.pathExtension == Constants.marqueeFileExtension {
                UserDefaults.appApp.set(screen.name, forKey: Constants.autoLoadKey)
                deepLink = screen
            }
        } catch {
            print(error)
        }
    }
    
    private func handleDeeplink(_ url: URL) {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            print("Invalid URL")
            return
        }
        
        guard let action = components.host, action == "open" else {
            print("Unknown URL, we can't handle this one!")
            return
        }
        
        guard let recipeName = components.queryItems?.first(where: { $0.name == "name" })?.value else {
            print("Recipe name not found")
            return
        }
        
        deepLink = AppAppKit.shared.screen(named: recipeName)
    }
}
