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
                onSelect(MakeableLabel.makeDefault())
            }),
            .init(title: "Button", onTap: {
                onSelect(MakeableButton.makeDefault())
            }),
//            .init(title: "Textfield", onTap: {
//                onSelect(
//                    MakeableField.makeableConstructor.makeableView
//                )
//            })
        ]
    }
}
