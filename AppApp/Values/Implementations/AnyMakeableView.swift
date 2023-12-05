//
//  AnyMakeable.swift
//  AppApp
//
//  Created by Dylan Elliott on 29/11/2023.
//

import SwiftUI

// sourcery: variableTypeName = "view"
final class AnyMakeableView: EditableVariableValue {
    
    static var type: VariableType { .view }
    var value: any MakeableView
    
    var protoString: String { value.protoString }
    var valueString: String { value.valueString }
    
    init(value: any MakeableView) {
        self.value = value
    }
    
    static func makeDefault() -> AnyMakeableView {
        .init(value: MakeableLabel.withText("TEXT"))
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        return try value.add(other)
    }
    
    func value(with variables: Variables) async throws -> VariableValue {
        try await value.value(with: variables)
    }
    
    func editView(title: String, onUpdate: @escaping (AnyMakeableView) -> Void) -> AnyView {
        VStack {
            HStack {
                Text("type")
                Spacer()
                Picker("", selection: .init(get: {
                    Swift.type(of: self.value).type
                }, set: { new in
                    self.value = new.defaultView as! any MakeableView
                    onUpdate(self)
                })) {
                    ForEach(VariableType.makeables) {
                        Text($0.title).tag($0)
                    }
                }.pickerStyle(.menu).any
            }
            
            value.editView(title: "\(title)[value]") {[weak self] in
                guard let self = self else { return }
                self.value = $0
                onUpdate(self)
            }
        }.any
    }
}

extension AnyMakeableView: Codable {
    enum CodingKeys: String, CodingKey {
        case type
        case value
    }
    
    convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: try container.decode(CodableMakeableView.self, forKey: .value).value
        )
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(CodableMakeableView(value: value), forKey: .value)
    }
}

extension MakeableView {
    var any: AnyMakeableView {
        .init(value: self)
    }
}

extension AnyMakeableView: CodeRepresentable {
    var codeRepresentation: String {
        value.codeRepresentation
    }
}
