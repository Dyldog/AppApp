//
//  MakeableView.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

protocol MakeableView: ViewEditable/*, Codable*/ {
    func view(variables: Binding<Variables>?, alert: Binding<Alert?>?) throws -> AnyView
}
