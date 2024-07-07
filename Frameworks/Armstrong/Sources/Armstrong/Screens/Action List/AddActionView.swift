//
//  AddActionView.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import DylKit
import SwiftUI

struct AddActionView: View {
    @State var searchText: String = ""
    let onSelect: (any StepType) -> Void

    var body: some View {
        NavigationStack {
            CategoryPicker(title: "Select Step", elements: (AALibrary.shared.steps as [any EditableVariableValue.Type]).categoryTree) {
                onSelect($0.makeDefault() as! (any StepType))
            }
        }
    }
}
