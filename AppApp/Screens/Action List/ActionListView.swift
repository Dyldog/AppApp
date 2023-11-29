//
//  ActionListView.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

struct ActionListView: View {
    let title: String
    @State var showAddIndex: Int?
    @State var steps: [any StepType]
    let onUpdate: ([any StepType]) -> Void
    
    var body: some View {
        NavigationView {
            List {
                addButton(index: 0)
                
                ForEach(enumerated: steps) { (index, element) in
                    VStack {
                        HStack {
                            Text(type(of: element).title).bold()
                            
                            Button("X") {
                                steps = steps.removing(at: index)
                                onUpdate(steps)
                            }
                            .buttonStyle(.plain)
                        }
                        
                        element.editView(title: title) { value in
                            onUpdate(steps.replacing(value, at: index))
                        }
                        .buttonStyle(.plain)
                    }
                    .frame(maxWidth: .infinity)
                    
                    addButton(index: index + 1)
                }
            }
            .navigationTitle(title)
        }.sheet(item: $showAddIndex) { index in
            AddActionView { newStep in
                steps = steps.inserting(newStep, at: index)
                onUpdate(steps)
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
