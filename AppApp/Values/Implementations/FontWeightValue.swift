//
//  FontWeightValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import SwiftUI

extension Font.Weight {
    static var allCases: [Font.Weight] { [
        .regular,
        .bold,
        .semibold,
        .black, .heavy, .light, .ultraLight, .thin,
    ] }
    
    var title: String {
        switch self {
        case .black: return "Black"
        case .bold: return "Bold"
        case .heavy: return "Heavy"
        case .light: return "Light"
        case .ultraLight: return "Ultralight"
        case .semibold: return "Semibold"
        case .thin: return "Thin"
        case .regular: return "Regular"
        default: return "???"
        }
    }
}

final class FontWeightValue: PrimitiveEditableVariableValue, Codable {

    enum Properties: String, PrimitiveViewProperty {
        case value
        
        var defaultValue: Any {
            switch self {
            case .value: return Font.Weight.regular
            }
        }
    }
    
    static var type: VariableType { .fontWeight }
    var value: Font.Weight
    
    init(value: Font.Weight) {
        self.value = value
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(Self.type, "add")
    }
    
    var protoString: String { "\(value.title)" }
    
    var valueString: String { protoString }
    
    func value(with variables: Binding<Variables>) async throws -> VariableValue? {
        self
    }
    
    func editView(onUpdate: @escaping (FontWeightValue) -> Void) -> AnyView {
        Picker("", selection: .init(get: {
            self.value
        }, set: { new in
            onUpdate(.init(value: new))
        })) {
            ForEach(Font.Weight.allCases) {
                Text($0.title).tag($0)
            }
        }.pickerStyle(.menu).any
    }
    
    static func make(factory: (Properties) -> Any) -> FontWeightValue {
        .init(value: factory(.value) as! Font.Weight)
    }
    
    func value(for property: Properties) -> Any? {
        switch property {
        case .value: return value
        }
    }
    
    func set(_ value: Any, for property: Properties) {
        switch property {
        case .value: self.value = value as! Font.Weight
        }
    }
}
    
extension Font.Weight: Codable {
    public init(from decoder: Decoder) throws {
        let title = try decoder.singleValueContainer().decode(String.self)
        guard let value = Self.allCases.first(where: { $0.title == title }) else {
            throw DecodingError.valueNotFound(Font.Weight.self, .init(codingPath: [], debugDescription: ""))
        }
        self = value
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(title)
    }
}
