//
//  Scope.swift
//
//
//  Created by Dylan Elliott on 15/12/2023.
//

import Foundation
import SwiftUI

public typealias ScreenFactory = (String) -> Screen?

public struct Scope {
    private let index: Int
    let screenNames: [String]
    private let factory: ScreenFactory

    var color: Color { .forScope(index) }

    private init(index: Int, screenNames: [String], factory: @escaping ScreenFactory) {
        self.index = index
        self.screenNames = screenNames
        self.factory = factory
    }

    public init() {
        self.init(
            index: 0,
            screenNames: AALibrary.shared.allScreens.map { $0.name },
            factory: { name in AALibrary.shared.allScreens.first(where: { $0.name == name }) }
        )
    }

    public var next: Scope {
        .init(index: index + 1, screenNames: screenNames, factory: screen)
    }

    public func withScreens(screens: [String], factory: @escaping ScreenFactory) -> Scope {
        return .init(
            index: index,
            screenNames: screens + screenNames
        ) {
            factory($0) ?? self.factory($0)
        }
    }

    public func screen(named name: String) -> Screen? {
        factory(name)
    }
}

public extension View {
    func scope(_ scope: Scope) -> some View {
        tint(scope.color)
            .foregroundStyle(scope.color)
    }
}

extension View {
    func pickerScope(_ scope: Scope) -> some View {
        accentColor(scope.color)
    }
}
