//
//  CompositeEditableVariableValue+EditView.swift
//
//
//  Created by Dylan Elliott on 10/12/2023.
//

import DylKit
import SwiftUI

public extension CompositeEditableVariableValue {
    func editView(scope: Scope, title: String, onUpdate: @escaping (Self) -> Void) -> AnyView {
        VStack(alignment: .leading, spacing: 0) {
            let rows = propertyRows(onUpdate: onUpdate)
            ForEach(enumerated: rows.map { ($0.0, $0.1, $0.2) }) { _, row in
                row.1.editView(scope: scope, title: row.0) { value in
                    row.2(value)
                    onUpdate(self)
                }
            }
        }.any
    }
}
