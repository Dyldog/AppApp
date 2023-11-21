//
//  VariableValue+EditView.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

extension VariableValue {
    func editView(onUpdate: @escaping (Self) -> Void) -> AnyView {
        editView(title: "Edit", onUpdate: onUpdate)
    }
}
