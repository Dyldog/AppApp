//
//  ActionListView.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

struct ActionListView: View {
    @State var showAddIndex: Int?
    var steps: [any StepType]
    let onUpdate: ([any StepType]) -> Void
    
    var body: some View {
        List {
            addButton(index: 0)
            
            ForEach(enumerated: steps) { (index, element) in
                element.editView(onUpdate: {
                    onUpdate(steps.replacing($0, at: index))
                }, remove: {
                    onUpdate(steps.removing(at: index))
                }).buttonStyle(.plain).any
                
                addButton(index: index + 1)
            }
        }.sheet(item: $showAddIndex) { index in
            AddActionView { newStep in
                onUpdate(steps.inserting(newStep, at: index))
                showAddIndex = nil
            }
        }
    }
    
    func addButton(index: Int) -> some View {
        SwiftUI.Button("+") {
            showAddIndex = index
        }
    }
}
