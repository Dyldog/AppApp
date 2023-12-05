//
//  MakeableList.swift
//  AppApp
//
//  Created by Dylan Elliott on 29/11/2023.
//

import SwiftUI

// sourcery: skipCopying, skipVariableType, skipCodable
typealias MakeableListRow = MakeableView & Codable

// sourcery: variableTypeName = "listView"
final class MakeableList: MakeableView {
    
    static var type: VariableType { .listView }
    
    var protoString: String { data.protoString }
    var valueString: String { data.valueString }
        
    var data: TypedValue<ArrayValue>
    var view: AnyMakeableView
    
    init(data: TypedValue<ArrayValue>, view: AnyMakeableView) {
        self.data = data
        self.view = view
    }
    
    func insertValues(into variables: Variables) throws { }
    
    func add(_ other: VariableValue) throws -> VariableValue { fatalError() }

    func value(with variables: Variables) async throws -> VariableValue { self }

    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .data: return TypedValue(value: .constant(ArrayValue(type: .string, elements: [])))
        case .view: return MakeableLabel.makeDefault().any
        }
    }
    
    func protoViews() -> [any MakeableView] {
        switch data.value {
        case let .constant(array): 
            return array.elements.map { _ in view.value }
        case .variable:
            return [view.value]
        }
    }
    
    func valueViews(with variables: Variables) async throws -> [any MakeableView] {
        var views: [any MakeableView] = []
        
        
        for data in try await data.value.value(with: variables).elements {
            let variables = await variables.copy()
            
            let value = try await data.value(
                with: variables
            )
            
            await variables.set(value, for: "$0")
            
            await views.append(
                try view.value(with: variables)
            )
        }
        
        return views
    }
}

//extension MakeableList: Codable {
//    enum CodingKeys: String, CodingKey {
//        case data
//        case view
//    }
//    
//    convenience init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.init(
//            data: try container.decode(TypedValue<ArrayValue>.self, forKey: .data),
//            view: try container.decode(AnyMakeableView.self, forKey: .view)
//        )
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(view, forKey: .view)
//        try container.encode(data, forKey: .data)
//    }
//}

struct MakeableListView: View {
    let isRunning: Bool
    let showEditControls: Bool
    let listView: MakeableList
    
    let onContentUpdate: (MakeableList) -> Void
    let onRuntimeUpdate: () -> Void
    
    @EnvironmentObject var variables: Variables
    @Binding var error: VariableValueError?
    
    @State var views: [any MakeableView] = []
    
    init(isRunning: Bool, showEditControls: Bool, listView: MakeableList, onContentUpdate: @escaping (MakeableList) -> Void, onRuntimeUpdate: @escaping () -> Void, error: Binding<VariableValueError?>) {
        self.isRunning = isRunning
        self.showEditControls = showEditControls
        self.listView = listView
        self.onContentUpdate = onContentUpdate
        self.onRuntimeUpdate = onRuntimeUpdate
        self._variables = .init()
        self._error = error
    }
    
    var body: some View {
        VStack {
            ForEach(enumerated: views) { index, view in
                MakeableWrapperView(
                    isRunning: isRunning,
                    showEditControls: showEditControls,
                    view: view,
                    onContentUpdate: {
                        views[index] = $0
                    },
                    onRuntimeUpdate: {
                        //
                    },
                    error: $error
                )
            }
        }.task(id: variables.hashValue) {
            do {
                if isRunning {
                    views = try await listView.valueViews(with: variables)
                } else {
                    views = listView.protoViews()
                }
                
                if views.isEmpty {
                    views = [MakeableLabel.withText("LIST")]
                }
            } catch let error as VariableValueError {
                self.error = error
                views = [MakeableLabel.withText("ERR")]
            } catch {
                fatalError(error.localizedDescription)
            }
        }
        .listStyle(.plain)
            .any
    }
}

extension MakeableList: CodeRepresentable {
    var codeRepresentation: String {
        """
        List {
            ForEach(enumerated: \(data.codeRepresentation)) { (index, element) in
                \(view.codeRepresentation.replacingOccurrences(of: "$0", with: "element"))
            }
        }
        """
    }
}
