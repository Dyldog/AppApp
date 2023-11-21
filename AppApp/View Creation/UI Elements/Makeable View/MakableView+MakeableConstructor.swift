//
//  MakableView+MakeableConstructor.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

extension MakeableView {
    /// A constructor that allows the building of a `MakeableView`
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
