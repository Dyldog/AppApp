//
//  MakeableView+Prototype.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

extension MakeableView {
    /// The view as it displays in edit mode
    /// - Returns: The view with templates where variables would be used
    func prototypeView() throws -> AnyView {
        try view(variables: nil, alert: nil)
    }
}
