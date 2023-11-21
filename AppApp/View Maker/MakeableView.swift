//
//  MakeableView.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

protocol MakeableView: ViewEditable {
    func view(variables: Binding<Variables>?, alert: Binding<Alert?>?) throws -> AnyView
}

extension MakeableView {
    func prototypeView() throws -> AnyView {
        try view(variables: nil, alert: nil)
    }
    
    var makeableConstructor: MakeableViewConstructor {
        .init(
            properties: Properties.allCases.reduce(into: [:], {
                 $0[$1.rawValue] = value(for: $1) ?? $1.defaultValue
            })) { props in
                Self.make {
                    props[$0.rawValue] ?? $0.defaultValue
                }
            }
    }
}

extension MakeableView {
    func editView(onUpdate: @escaping (Self) -> Void) throws -> AnyView {
        try self.view(variables: nil, alert: nil)
    }
}

extension View {
    func onEdit(_ onEdit: (() -> Void)?) -> AnyView {
        if let onEdit = onEdit {
            SwiftUI.Button {
                onEdit()
            } label: {
                self.disabled(true)
            }.buttonStyle(.plain).any
        } else {
            self.any
        }
    }
}
