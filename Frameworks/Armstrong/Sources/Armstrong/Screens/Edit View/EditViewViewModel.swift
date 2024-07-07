//
//  EditViewViewModel.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import DylKit
import SwiftUI

class EditViewViewModel: ObservableObject {
    @Published var editable: any MakeableView
    @Published var alert: DylKit.Alert?
    let onUpdate: (any MakeableView) -> Void

    init(editable: any MakeableView, onUpdate: @escaping (any MakeableView) -> Void) {
        self.editable = editable
        self.onUpdate = onUpdate
    }
}
