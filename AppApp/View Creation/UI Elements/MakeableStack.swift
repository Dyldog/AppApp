//
//  MakeableStack.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import DylKit

struct MakeableStack: MakeableView {
    enum Properties: String, CaseIterable, ViewProperty {
        case content
        
        var defaultValue: VariableValue { "" }
    }
    
    let content: [any MakeableView]
    let makeMode: Bool
    var onEdit: (() -> Void)?
    let addTapped: (Int) -> Void
    let editTapped: (Int) -> Void
    
    init(content: [any MakeableView], makeMode: Bool = false, addTapped: @escaping (Int) -> Void, editTapped: @escaping (Int) -> Void) {
        self.content = content
        self.addTapped = addTapped
        self.editTapped = editTapped
        self.makeMode = makeMode
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .content: return nil
        }
    }
    
    static func make(factory: (Properties) -> any VariableValue) -> MakeableStack {
        .init(
            content: factory(.content) as! [any MakeableView],
            addTapped: { _ in },
            editTapped: { _ in }
        )
    }
    
    func view(variables: Binding<Variables>?, alert: Binding<Alert?>?) -> AnyView {
        VStack {
            if makeMode {
                makeButton(at: 0)
            }
            
            ForEach(Array(content.enumerated()), id: \.offset) { (index, element) in
                DoView {
                    try element.view(variables: variables, alert: alert)
                } content: { content in
                    VStack {
                        content
                            .onEdit(makeMode ? { editTapped(index) } : nil)
                        
                        if makeMode {
                            makeButton(at: index + 1)
                        }
                    }.any
                } onError: {
                    alert?.wrappedValue = .init(title: "ERROR", message: $0.localizedDescription)
                    return VStack {
                        Text("ERROR")
                    }.any
                }
            }
        }.if(makeMode) {
            $0.padding().border(.black, width: 2)
        }
    }
    
    func makeButton(at index: Int) -> some View {
        SwiftUI.Button("Add", action: {
            addTapped(index)
        })
    }
}
