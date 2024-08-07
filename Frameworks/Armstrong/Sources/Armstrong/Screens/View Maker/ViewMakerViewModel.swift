//
//  ViewMakerViewModel.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Combine
import DylKit
import SwiftUI

@MainActor
public class ViewMakerViewModel: ObservableObject {
    @Published var title: String

    var content: MakeableStack {
        willSet {
            objectWillChange.send()
        }
        didSet {
            onUpdate?(screen)
        }
    }

    @Published private(set) var screen: Screen
    private let onUpdate: ((Screen) -> Void)?
    var showEdit: Bool { onUpdate != nil }

    private(set) var scope: Scope!

    @Published var showErrors: Bool = false
//    var error: VariableValueError?

    var makeMode: Bool = false {
        didSet {
            do {
                try makeNewVariables()
            } catch {
                if let error = error as? VariableValueError {
                    self.error = error
                } else {
                    print("Unhandled error: \(error)")
                }
            }
        }
    }

    @Published private(set) var updater: Int = 0

    @Published private(set) var _variables: Variables
    var error: VariableValueError? {
        willSet { if showErrors { objectWillChange.send() } }
        didSet {
            guard let error else { return }
            print("ERROR: \(error.localizedDescription)")
        }
    }

    private var cancellables: Set<AnyCancellable> = .init()

    var variables: Variables {
        get {
            guard !makeMode else { return .init() }
            return _variables
        }
        set {
            guard !makeMode, newValue != _variables else { return }
            _variables.set(from: newValue)
        }
    }

    public init(scope: Scope?, screen: Screen, makeMode: Bool, onUpdate: ((Screen) -> Void)?) {
        self.screen = screen
        title = screen.name
        content = screen.content
        self.onUpdate = onUpdate
        _variables = .init()
        self.makeMode = makeMode

        self.scope = scope ?? .init()

        self.scope = self.scope.withScreens(screens: screen.subscreens.map { $0.name }) { screen in
            self.screen.subscreens.first(where: { $0.name == screen })
        }

        do {
            try makeNewVariables()
        } catch {
            if let error = error as? VariableValueError {
                self.error = error
            } else {
                print("Unhandled error: \(error)")
            }
        }

        _variables.objectWillChange.sink { [weak self] _ in
            self?.objectWillChange.send()
        }.store(in: &cancellables)

        $title.dropFirst().sink { [weak self] in
            guard let self else { return }
            self.screen.name = $0
            self.onUpdate?(self.screen)
        }
        .store(in: &cancellables)

//        $content.dropFirst().sink { content in
//            onUpdate(.init(name: self.name, initActions: self.initActions, content: content))
//        }.store(in: &cancellables)

//        $_variables.compactMap { $0 }.sink { vars in
//            var newVars = vars
//            self.updateVariablesFromContent(vars: &newVars)
//            self._variables = newVars
//        }.store(in: &cancellables)
    }

    func makeNewVariables() throws {
        _variables = try makeVariables()
    }

    func makeVariables() throws -> Variables {
        let newVars = Variables()
        try screen.initialise(with: newVars, and: scope)
        return newVars
    }

    func onRuntimeUpdate(completion: @escaping Block) {
        do {
            try screen.updateVariablesFromContent(vars: variables, and: scope)
            completion()
        } catch {
            handleError(error)
        }
    }

    func updateInitActions(_ newValue: StepArray) {
        do {
            screen.initActions = newValue
            try makeNewVariables()
            onUpdate?(screen)
        } catch {
            handleError(error)
        }
    }

    func updateInitVariables(_ newValue: DictionaryValue) {
        do {
            screen.initVariables = newValue
            try makeNewVariables()
            onUpdate?(screen)
        } catch {
            handleError(error)
        }
    }

    func updateSubscreens(_ newValue: [Screen]) {
        do {
            screen.subscreens = newValue
            try makeNewVariables()
            onUpdate?(screen)
        } catch {
            handleError(error)
        }
    }

    private func handleError(_ error: Error) {
        if let error = error as? VariableValueError {
            self.error = error
        } else {
            print(error.localizedDescription)
        }
    }
}

extension ViewMakerViewModel {
    struct EditRow: Identifiable {
        var id: Int { index }
        let index: Int
        let constructor: MakeableViewConstructor
    }
}
