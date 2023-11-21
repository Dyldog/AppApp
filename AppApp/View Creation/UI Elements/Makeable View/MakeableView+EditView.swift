//
//  MakeableView+T.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

extension MakeableView {
    /// Creates a view that allows editing of the makeable view
    /// - Parameter onUpdate: Should be triggered when the view updates
    /// - Returns: The edit view for this view
    func editView(onUpdate: @escaping (Self) -> Void) throws -> AnyView {
        try self.view(variables: nil, alert: nil)
    }
}
