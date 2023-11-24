//
//  AddViewViewModel.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

struct AddViewRow {
    let title: String
    let onTap: () -> Void
}

class AddViewViewModel: ObservableObject {
    let rows: [AddViewRow]
    
    init(onSelect: @escaping (any MakeableView) -> Void) {
        rows = [
            .init(title: "Label", onTap: {
                onSelect(MakeableLabel(text: "TEXT" as Value, fontSize: 18))
            }),
            .init(title: "Button", onTap: {
                onSelect(
                    MakeableButton(
                        title: Value(value: "Text" as Value), 
                        fontSize: 18,
                        action: StepArray(values: [])
                    )
                )
            }),
            .init(title: "Textfield", onTap: {
                onSelect(
                    MakeableField(
                        text: .init(initial: "TEXT" as Value, output: .init(name: StringValue(value: "FIELDTEXT"))), 
                        fontSize: 18,
                        onTextUpdate: StepArray(values: [])
                    )
                )
            })
        ]
    }
}
