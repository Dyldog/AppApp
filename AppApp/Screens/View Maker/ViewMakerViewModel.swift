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
    var content: MakeableStack = .init(content: .init(value: [])) {
        didSet {
            objectWillChange.send()
            onUpdate(.init(id: screenID, name: self.name, initActions: self.initActions, content: content))
        }
    }
    
    let screenID: UUID
    @Published private(set) var initActions: StepArray = .init(value: [])
    private let onUpdate: (Screen) -> Void
    
    @Published var showErrors: Bool = false
//    var error: VariableValueError?
    
    @Published var makeMode: Bool = true
    
//    @Published var showAddIndex: Int?
//    @Published var showEditIndex: EditRow?
    
    @Published private(set) var updater: Int = 0
    
    @Published private(set) var _variables: Variables
    
    private var cancellables: Set<AnyCancellable> = .init()
    
    var variables: Variables {
        get {
            guard !makeMode else { return .init() }
            return _variables
        }
        set {
            guard !self.makeMode else { return }
            self._variables.set(from: newValue)
        }
    }
    
    init(screen: Screen, onUpdate: @escaping (Screen) -> Void) {
        self.screenID = screen.id
        self.name = screen.name
        self.initActions = screen.initActions
        self.content = screen.content
        self.onUpdate = onUpdate
        self._variables = .init()
        
        Task { @MainActor in
            _variables = await makeVariables()
        }
        
        _variables.objectWillChange.sink { [weak self] _ in
            self?.objectWillChange.send()
        }.store(in: &cancellables)
        
//        $content.dropFirst().sink { content in
//            onUpdate(.init(name: self.name, initActions: self.initActions, content: content))
//        }.store(in: &cancellables)
        
//        $_variables.compactMap { $0 }.sink { vars in
//            var newVars = vars
//            self.updateVariablesFromContent(vars: &newVars)
//            self._variables = newVars
//        }.store(in: &cancellables)
    }
    
    private func updateVariablesFromContent(vars: Variables) async {
        for element in content.content {
            try? await element.insertValues(into: vars)
        }
        
        self.variables = vars
        
        self.updater += 1
    }
    
    func makeVariables()  async -> Variables {
        let newVars = Variables()
        
        for action in initActions {
            do {
                try await action.run(with: newVars)
            } catch {
                print(error)
            }
        }
        
        await self.updateVariablesFromContent(vars: newVars)
        
        return newVars
    }
    
    func onRuntimeUpdate() {
        Task { @MainActor in
            await self.updateVariablesFromContent(vars: variables)
        }
    }
    
    func updateInitActions(_ newValue: StepArray) {
        initActions = newValue
        onUpdate(.init(id: screenID, name: self.name, initActions: self.initActions, content: self.content))
    }
}

extension ViewMakerViewModel {
    struct EditRow: Identifiable {
        var id: Int { index }
        let index: Int
        let constructor: MakeableViewConstructor
    }
}
