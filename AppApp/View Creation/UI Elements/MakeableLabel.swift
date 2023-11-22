//
//  MakeableLAbel.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

struct MakeableLabel: MakeableView {
    let text: VariableValue
    let fontSize: Int
    var onEdit: (() -> Void)?
    
    func view(variables: Binding<Variables>?, alert: Binding<Alert?>?) throws -> AnyView {
        if var variables = variables?.wrappedValue {
            guard let value = try text.value(with: &variables)?.valueString
            else { throw VariableValueError.valueNotFoundForVariable }
            return Text(value).font(.system(size: CGFloat(fontSize))).any
        } else {
            return Text(text.protoString).font(.system(size: CGFloat(fontSize))).any
        }
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .value: return text
        case .fontSize: return fontSize
        }
    }
    
    static func make(factory: (Properties) -> VariableValue) -> MakeableLabel {
        .init(
            text: factory(.value),
            fontSize: factory(.fontSize) as! Int
        )
    }
    
    enum Properties: String, CaseIterable, ViewProperty {
        case value
        case fontSize
        
        var defaultValue: VariableValue {
            switch self {
            case .value: return "TEXT" as Value
            case .fontSize: return 18
            }
        }
    }
}

extension MakeableLabel: Codable {
    enum CodingKeys: String, CodingKey {
        case text
        case fontSize
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        text = try container.decode(CodableVariableValue.self, forKey: .text).value
        fontSize = try container.decode(Int.self, forKey: .fontSize)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(CodableVariableValue(value: text), forKey: .text)
        try container.encode(fontSize, forKey: .fontSize)
    }
}
