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
                onSelect(MakeableLabel(text: "TEXT" as Value))
            }),
            .init(title: "Button", onTap: {
                onSelect(
                    MakeableButton(
                        title: Value(value: "Text" as Value),
                        action: []
                    )
                )
            }),
            .init(title: "Textfield", onTap: {
                onSelect(
                    MakeableField(text: .init(value: "TEXT" as Value))
                )
            })
        ]
    }
}
