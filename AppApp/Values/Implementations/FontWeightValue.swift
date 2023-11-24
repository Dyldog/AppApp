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

extension Font.Weight: VariableValue {

    static var type: VariableType { .fontWeight }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(Self.type, "add")
    }
    
    var protoString: String { "\(title)" }
    
    var valueString: String { protoString }
    
    func value(with variables: Binding<Variables>) async throws -> VariableValue? {
        self
    }
    
    func editView(title: String, onUpdate: @escaping (Font.Weight) -> Void) -> AnyView {
        Picker("Weight", selection: .init(get: {
            self
        }, set: { new in
            onUpdate(new)
        })) {
            ForEach(Self.allCases) {
                Text($0.protoString).tag($0)
            }
        }.pickerStyle(.menu).any
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
