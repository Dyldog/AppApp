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

    static var type: VariableType { .fontWeight }
    static var defaultValue: Font.Weight { .regular}
    var value: Font.Weight
    
    init(value: Font.Weight) {
        self.value = value
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(Self.type, "add")
    }
    
    var protoString: String { "\(value.title)" }
    
    var valueString: String { protoString }
    
    func value(with variables: Variables) async throws -> VariableValue? {
        self
    }
    
    func editView(onUpdate: @escaping (FontWeightValue) -> Void) -> AnyView {
        Picker("", selection: .init(get: { [weak self] in
            self?.value ?? .regular
        }, set: { [weak self] new in
            guard let self = self else { return }
            self.value = new
            onUpdate(self)
        })) {
            ForEach(Font.Weight.allCases) {
                Text($0.title).tag($0)
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
