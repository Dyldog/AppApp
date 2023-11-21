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
    @State var variables: Variables = .init()
    @State var alert: Alert?
    var body: some Scene {
        WindowGroup {
            ViewMakerView()
            .padding()
        }
    }
}
