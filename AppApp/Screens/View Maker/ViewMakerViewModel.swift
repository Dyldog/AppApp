//
//  ViewMakerViewModel.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import DylKit
import Combine

@MainActor
class ViewMakerViewModel: ObservableObject {
    let name: String
    var content: MakeableArray = .init(value: []) {
        didSet {
            objectWillChange.send()
            onUpdate(.init(name: self.name, initActions: self.initActions, content: content))
        }
    }
    @Published private(set) var initActions: StepArray = .init(value: [])
    private let onUpdate: (Screen) -> Void
    
    @Published var showErrors: Bool = false
    var error: VariableValueError?
    
    @Published var makeMode: Bool = true
    
//    @Published var showAddIndex: Int?
//    @Published var showEditIndex: EditRow?
    
    @Published private var updater: Int = 0
    
    @MainActor private var _variables: Variables? {
        willSet { onMain { self.objectWillChange.send() } }
    }
    
    private var cancellables: Set<AnyCancellable> = .init()
    
    var variables: Variables? {
        get {
            guard !makeMode else { return nil }
            return _variables
        }
        set {
            guard !self.makeMode, let newValue = newValue else { return }
            self._variables?.set(from: newValue)
        }
    }
    
    private var variablesBinding: Binding<Variables> {
        .init {
            self._variables!
        } set: { new in
            onMain {
                self._variables = new
            }
        }

    }
    
    init(screen: Screen, onUpdate: @escaping (Screen) -> Void) {
        self.name = screen.name
        self.initActions = screen.initActions
        self.content = screen.content
        self.onUpdate = onUpdate
        self._variables = .init()
        
        Task { @MainActor in
//            _variables = await makeVariables()
        }
        
//        $content.dropFirst().sink { content in
//            onUpdate(.init(name: self.name, initActions: self.initActions, content: content))
//        }.store(in: &cancellables)
        
//        $_variables.compactMap { $0 }.sink { vars in
//            var newVars = vars
//            self.updateVariablesFromContent(vars: &newVars)
//            self._variables = newVars
//        }.store(in: &cancellables)
    }
    
    private func updateVariablesFromContent(vars: Binding<Variables>) async {
        for element in content {
            try? await element.insertValues(into: vars)
        }
        
        updater += 1
    }
    
    func makeVariables()  async -> Variables {
        var newVars = Variables()
        
        let varsBinding = Binding(get: {
            newVars
        }, set: {
            newVars = $0
        })
        
        for action in initActions {
            do {
                try await action.run(with: varsBinding)
            } catch {
                print(error)
            }
        }
        
        await self.updateVariablesFromContent(vars: varsBinding)
        
        return newVars
    }
    
    func onRuntimeUpdate() async {
//        await self.updateVariablesFromContent(vars: variablesBinding)
        onMain { self.updater += 1 }
    }
    
//    private func updateContent() {
//        onMain {
//            self.updater += 1
//        }
//    }
//    
//    private func viewUpdated() {
//        self.content.forEach {
//            try? $0.insertValues(into: &self._variables)
//        }
//        
//        self.updateContent()
//    }    
    
    func updateInitActions(_ newValue: StepArray) {
        initActions = newValue
        onUpdate(.init(name: self.name, initActions: self.initActions, content: self.content))
    }
}

extension ViewMakerViewModel {
    struct EditRow: Identifiable {
        var id: Int { index }
        let index: Int
        let constructor: MakeableViewConstructor
    }
}
