//
//  ViewMakerViewModel.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import DylKit

class ViewMakerViewModel: ObservableObject {
    let name: String
    @Published var content: [any MakeableView] = []
    @Published private(set) var initActions: [any StepType] = []
    private let onUpdate: (Screen) -> Void
    
    @Published var alert: Alert?
    
    @Published var makeMode: Bool = true
    
    @Published var showAddIndex: Int?
    @Published var showEditIndex: EditRow?
    
    /*@Published*/ private var _variables: Variables!
    
    var variables: Binding<Variables>? {
        guard !makeMode else { return nil }
        return .init(
            get: {
                self._variables
            },
            set: {
                guard !self.makeMode else { return }
                self._variables = $0
            }
        )
    }
    
    private func newVariables() -> Variables {
        var vars = Variables()
        do {
            try initActions.forEach {
                try $0.run(with: &vars)
            }
        } catch {
            alert = .init(title: "Error", message: error.localizedDescription)
        }
        return vars
    }
    
    init(screen: Screen, onUpdate: @escaping (Screen) -> Void) {
        self.name = screen.name
        self.initActions = screen.initActions
        self.content = screen.content
        self.onUpdate = onUpdate
        self._variables = newVariables()
    }
    
    func updateInitActions(_ newValue: [any StepType]) {
        initActions = newValue
        _variables = newVariables()
        onUpdate(.init(name: name, initActions: initActions, content: content))
    }
    
    func addTapped(at index: Int) {
        showAddIndex = index
    }
    
    func onAdd(_ view: any MakeableView, at index: Int) {
        self.content.insert(view, at: index)
        onUpdate(.init(name: name, initActions: initActions, content: content))
        showAddIndex = nil
    }
    
    func editView(at index: Int) {
        showEditIndex = .init(index: index, constructor: content[index].makeableConstructor)
    }
    
    func onEdit(_ view: any MakeableView, at index: Int) {
        self.content[index] = view
        onUpdate(.init(name: name, initActions: initActions, content: content))
    }
    
    func removeView(at index: Int) {
        self.content.remove(at: index)
        onUpdate(.init(name: name, initActions: initActions, content: content))
    }
}

extension ViewMakerViewModel {
    struct EditRow: Identifiable {
        var id: Int { index }
        let index: Int
        let constructor: MakeableViewConstructor
    }
}
