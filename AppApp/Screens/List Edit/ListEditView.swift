//
//  ListEditView.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import DylKit

struct ListEditView: View {
    @Binding var value: ArrayValue
    let onUpdate: (ArrayValue) -> Void
    
    var body: some View {
        List {
            value.type.editView(
                onUpdate: { self.value.type = $0 }
            )
            
            addButton(index: 0)
            
            ForEach(enumerated: value.elements) { (index, element) in
//                element.editView(title: "\(index)", onUpdate: { editedElement in
//                    value.elements[index] = editedElement
//                    onUpdate(value)
//                })
                
                addButton(index: index + 1)
            }
        }
    }
    
    func addButton(index: Int) -> some View {
        SwiftUI.Button("+") {
            let view = value.type.defaultView
            if index <= value.elements.count {
                value.elements.append(view)
            } else {
                value.elements[index] = view
            }
            
            onUpdate(value)
        }
    }
}
