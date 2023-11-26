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
    
    init(rows: [AddViewRow]) {
        self.rows = rows
    }
}
