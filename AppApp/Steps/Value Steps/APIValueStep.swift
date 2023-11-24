//
//  APIValueStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class APIValueStep: ValueStep {
    static var title: String { "Get value from API" }
    @Published var url: Value
    
    init(url: Value) {
        self.url = url
    }
    
    var protoString: String { "{ $\(url.valueString) }" }
    
    func run(with variables: Binding<Variables>) async throws -> VariableValue {
        guard
            let value = try await url.value(with: variables),
            let url = URL(string: value.valueString)
        else { throw VariableValueError.wrongTypeForOperation }
        
        return StringValue(value: try String(contentsOf: url))
    }
    
    static func make(factory: (Properties) -> VariableValue) -> APIValueStep {
        return APIValueStep(
            url: factory(.url) as! Value
        )
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .url: return url
        }
    }
    
    func set(_ value: VariableValue, for property: Properties) {
        switch property {
        case .url: self.url = value as! Value
        }
    }
    
    enum Properties: String, ViewProperty {
        case url
        
        var defaultValue: VariableValue {
            switch self {
            case .url: return StringValue(value: "https://swapi.dev/api/people/1")
            }
        }
    }
}

extension APIValueStep: Codable {
    enum CodingKeys: String, CodingKey {
        case url
    }
    
    convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(url: try container.decode(Value.self, forKey: .url))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(url, forKey: .url)
    }
}
