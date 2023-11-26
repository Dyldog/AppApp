//
//  AddActionView.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

struct AddActionView: View {
    let onSelect: (any StepType) -> Void
    
    var body: some View {
        List(Actions.allCases, id: \.self) { item in
            SwiftUI.Button(item.title) {
                onSelect(item.make())
            }
        }
    }
}
