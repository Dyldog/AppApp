// The Swift Programming Language
// https://docs.swift.org/swift-book

import Alexandria
import Armstrong
import Greg
import Obscura
import Viticci

public struct AppAppKit {
    public static let shared: AppAppKit = .init()

    var providers: [any AAProvider.Type] = [
        Armstrong.self,
        Alexandria.self,
        Greg.self,
        Obscura.self,
        Viticci.self,
    ]

    init() {
        AALibrary.shared.addProviders(providers)
    }

    public func screen(named name: String) -> Screen? {
        AALibrary.shared.allScreens.first(where: { $0.name == name })
    }
}
