////
////  Button+Step.swift
////  AppApp
////
////  Created by Dylan Elliott on 20/11/2023.
////
//
//import SwiftUI
import DylKit
//
typealias Alert = DylKit.Alert
//
//struct StepButton<Title: View>: View {
//    
//    let title: (Variables) -> Title
//    let step: any Step
//    @Binding var variables: Variables
//    @Binding var alert: Alert?
//    
//    init(title: @escaping (Variables) -> Title, step: any Step, variables: Binding<Variables>, alert: Binding<Alert?>) {
//        self.title = title
//        self.step = step
//        self._variables = variables
//        self._alert = alert
//    }
//    
//    init(title: String, step: any Step, variables: Binding<Variables>, alert: Binding<Alert?>) where Title == Text {
//        self.init(title: { _ in Text(title) }, step: step, variables: variables, alert: alert)
//    }
//    
//    init(title: @escaping (Variables) -> String, step: any Step, variables: Binding<Variables>, alert: Binding<Alert?>) where Title == Text {
//        self.init(title: { Text(title(&$0)) }, step: step, variables: variables, alert: alert)
//    }
//    
//    var body: some View {
//        SwiftUI.Button(action: {
//            do {
//                try step.run(with: $variables)
//            } catch {
//                alert = .init(title: "Error", message: error.localizedDescription)
//            }
//        }, label: {
//            title(variables)
//        })
//    }
//}
//
//typealias Button = StepButton
