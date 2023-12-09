//
//  AppAppApp.swift
//  AppApp
//
//  Created by Dylan Elliott on 20/11/2023.
//

import SwiftUI
import DylKit

@main
struct AppAppApp: App {
    @State var alert: Alert?
    @State var deepLink: Screen? // = .mappyBoy
    
    var body: some Scene {
        WindowGroup {
            if let deepLink = deepLink {
                ViewMakerView(viewModel: .init(screen: deepLink, makeMode: false, onUpdate: nil))
            } else {
                NavigationView {
                    ScreenListView()
                }.onOpenURL { incomingURL in
                    print("App was opened via URL: \(incomingURL)")
                    handleIncomingURL(incomingURL)
                }
            }
        }
    }
    
    private func handleIncomingURL(_ url: URL) {
        guard url.scheme == "appapp" else {
            return
        }
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
        
        deepLink = Screen.screens.first(where: { $0.name == recipeName })
    }
}
