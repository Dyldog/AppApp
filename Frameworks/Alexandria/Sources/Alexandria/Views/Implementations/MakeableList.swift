//
//  MakeableList.swift
//  AppApp
//
//  Created by Dylan Elliott on 29/11/2023.
//

import SwiftUI
import Armstrong
import DylKit

// sourcery: skipCopying, skipVariableType, skipCodable
public typealias MakeableListRow = MakeableView & Codable

// sourcery: variableTypeName = "listView"
public final class MakeableList: MakeableView {
    public static let categories: [ValueCategory] = [.views]
    public static var type: VariableType { .listView }
    
    public let id: UUID
    public var protoString: String { data.protoString }
    public var valueString: String { data.valueString }
        
    public var data: TypedValue<ArrayValue>
    public var view: AnyMakeableView
    
    public init(id: UUID, data: TypedValue<ArrayValue>, view: AnyMakeableView) {
        self.id = id
        self.data = data
        self.view = view
    }
    
    public func insertValues(into variables: Variables, with scope: Scope) throws { }
    
    public func add(_ other: VariableValue) throws -> VariableValue { fatalError() }

    public func value(with variables: Variables, and scope: Scope) throws -> VariableValue {
        MakeableStack(axis: .vertical, try valueViews(with: variables, and: scope))
    }

    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .data: return TypedValue(value: .constant(ArrayValue(type: .string, elements: [])))
        case .view: return MakeableLabel.makeDefault().any
        }
    }
    
    public func protoViews() -> [any MakeableView] {
        switch data.value {
        case let .constant(array): 
            return array.elements.map { _ in view.value }
        case .variable:
            return [view.value]
        case .result:
            return [view.value]
        }
    }
    
    public func valueViews(with variables: Variables, and scope: Scope) throws -> [any MakeableView] {
        var views: [any MakeableView] = []
        
        let elements = try data.value.value(with: variables, and: scope).elements
        for data in elements  {
            let variables =  variables.copy()
            
            let value = try data.value(
                with: variables, and: scope
            )
            
             variables.set(value, for: "$0")
            
            let valueView: any MakeableView = try view.value(with: variables, and: scope)
            
            views.append(valueView)
        }
        
        return views
    }
}

public struct MakeableListView: View {
    let isRunning: Bool
    let showEditControls: Bool
    let scope: Scope
    let listView: MakeableList
    
    let onContentUpdate: (MakeableList) -> Void
    let onRuntimeUpdate: (@escaping Block) -> Void
    
    @EnvironmentObject var variables: Variables
    @Binding var error: VariableValueError?
    
//    @State var views: [any MakeableView] = []
    
    public init(isRunning: Bool, showEditControls: Bool, scope: Scope, listView: MakeableList, onContentUpdate: @escaping (MakeableList) -> Void, onRuntimeUpdate: @escaping (@escaping Block) -> Void, error: Binding<VariableValueError?>) {
        self.isRunning = isRunning
        self.showEditControls = showEditControls
        self.listView = listView
        self.onContentUpdate = onContentUpdate
        self.onRuntimeUpdate = onRuntimeUpdate
        self._error = error
        self.scope = scope
    }
    
    private var contentViews: [any MakeableView] {
        let variables = variables.copy()
        var views: [any MakeableView]
        
        if isRunning {
            views = `do` {
                try listView.valueViews(with: variables, and: scope)
            } onError: {
                self.handleError($0)
                return [MakeableLabel.withText("ERR")]
            }
        } else {
            views = listView.protoViews()
        }
        
        if views.isEmpty {
            views = [MakeableLabel.withText("LIST")]
        }
        
        return views
    }
    public var body: some View {
        VStack {
            ForEach(contentViews.enumeratedArray(), id: \.offset) { index, view in
                MakeableWrapperView(
                    isRunning: isRunning,
                    showEditControls: showEditControls, 
                    scope: scope,
                    view: view,
                    onContentUpdate: { _ in
//                        views[index] = $0
                    },
                    onRuntimeUpdate: { completion in
                        onRuntimeUpdate {
                            completion()
                        }
                    },
                    error: $error
                )
            }
        }
        .listStyle(.plain)
            .any
    }
    
    private func handleError(_ error: Error) {
        if let error = error as? VariableValueError {
            self.error = error
        } else {
            print(error.localizedDescription)
        }
    }
}

extension MakeableList: CodeRepresentable {
    public var codeRepresentation: String {
        """
        List {
            ForEach(enumerated: \(data.codeRepresentation)) { (index, element) in
                \(view.codeRepresentation.replacingOccurrences(of: "$0", with: "element"))
            }
        }
        """
    }
}

func `do`<T>(_ block: () throws -> T, onError: (Error) -> T) -> T {
    do {
        return try block()
    } catch {
        return onError(error)
    }
}
