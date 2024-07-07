//
//  CodableMakeableView.swift
//  AppApp
//
//  Created by Dylan Elliott on 29/11/2023.
//

import Armstrong
import Foundation

struct CodableMakeableView {
    let type: String
    let value: any MakeableView

    init(value: any MakeableView) {
        self.value = value
        type = typeString(Swift.type(of: value))
    }
}
