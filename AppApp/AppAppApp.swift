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
//            NavigationSplitView {
                ViewMakerView()
                .padding()
//            } detail: {
//                try! ContentView(variables: $variables, initSteps: [
//                    SetVarStep(varName: "VAR", value: 0, type: .string),
//                    AddToVarStep(varName: "VAR", value: 5, type: .string),
//                    PrintVarStep(varName: "VAR")
//                ],
//                content: VStack {
//                    Button(
//                        title: {
//                            "Button has been tapped \($0.value(for: "VAR")?.string(with: &variables) ?? "ERROR") times"
//                        },
//                        step: AddToVarStep(varName: "VAR", value: 1, type: .string),
//                        variables: $variables,
//                        alert: $alert
//                    )
//                })
//            }

            
        }
    }
}
