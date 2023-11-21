//
//  ViewMakerViewModel.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import DylKit

class ViewMakerViewModel: ObservableObject {
    @Published var content: [any MakeableView] = []
    @Published private(set) var initActions: [any StepType] = []
    
    @Published var alert: Alert?
    
    @Published var makeMode: Bool = true
    
    @Published var showAddIndex: Int?
    @Published var showEditIndex: EditRow?
    
    @Published var variables: Variables!
    
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
    
    init() {
        variables = newVariables()
    }
    
    func updateInitActions(_ newValue: [any StepType]) {
        initActions = newValue
        variables = newVariables()
    }
    
    func addTapped(at index: Int) {
        showAddIndex = index
    }
    
    func onAdd(_ view: any MakeableView, at index: Int) {
        self.content.insert(view, at: index)
        showAddIndex = nil
    }
    
    func editView(at index: Int) {
        showEditIndex = .init(index: index, constructor: content[index].makeableConstructor)
    }
    
    func onEdit(_ view: any MakeableView, at index: Int) {
        self.content[index] = view
    }
}

extension ViewMakerViewModel {
    struct EditRow: Identifiable {
        var id: Int { index }
        let index: Int
        let constructor: MakeableViewConstructor
    }
}
