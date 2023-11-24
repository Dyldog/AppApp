//
//  MakeableView.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

protocol MakeableView: ViewEditable, Codable, Identifiable where ID == UUID {
    func insertValues(into variables: Binding<Variables>) async throws
//    static func view(from value: Binding<Self>, makeMode: Bool, variables: Binding<Variables>?, alert: Binding<Alert?>?, onEdit: (() -> Void)?) throws -> AnyView
}

//extension MakeableView {
//    func view(from value: Binding<Self>, makeMode: Bool, variables: Binding<Variables>?, alert: Binding<Alert?>?, onEdit: (() -> Void)?) -> AnyView {
//        try! Self.view(from: value, makeMode: makeMode, variables: variables, alert: alert, onEdit: onEdit)
//    }
//}
