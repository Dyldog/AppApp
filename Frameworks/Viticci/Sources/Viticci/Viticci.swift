// The Swift Programming Language
// https://docs.swift.org/swift-book

import Armstrong
import Alexandria

extension Viticci {
    public static var demoScreens: [Screen] { [openURLDemo] }
    
    public static var openURLDemo = Screen(
        id: .init(),
        name: "Open URL",
        initVariables: .init(elements: [:]),
        initActions: .init(value: []),
        subscreens: [],
        content: .init([
            MakeableButton(
                id: .init(),
                title: .text(.string("OPEN")),
                style: .makeDefault(),
                action: .init(
                    arguments: .value(.init(elements: [:])),
                    body: .value(.init(value: [
                        OpenURLStep.makeDefault()
                    ])))
            )
        ]))
}
