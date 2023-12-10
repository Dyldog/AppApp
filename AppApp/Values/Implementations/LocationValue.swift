//
//  LocationValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 9/12/2023.
//

import Foundation
import Armstrong

final class LocationValue: CompositeEditableVariableValue {
    
    static var type: VariableType { .location }
    
    var name: TypedValue<StringValue>
    var latitude: TypedValue<FloatValue>
    var longitude: TypedValue<FloatValue>
    
    var protoString: String { "\(latitude.value), \(longitude.value)" }
    var valueString: String { protoString }
    
    init(name: TypedValue<StringValue>, latitude: TypedValue<FloatValue>, longitude: TypedValue<FloatValue>) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }

    func value(with variables: Variables) async throws -> VariableValue {
        LocationValue(
            name: .value(try await name.value(with: variables)),
            latitude: .value(try await latitude.value(with: variables)),
            longitude: .value(try await longitude.value(with: variables))
        )
    }
    
    static func defaultValue(for property: Properties) -> EditableVariableValue {
        switch property {
        case .name: return TypedValue.value(StringValue(value: "Australia"))
        case .latitude: return TypedValue.value(FloatValue(value: -24.7761086))
        case .longitude: return TypedValue.value(FloatValue(value: 134.755))
        }
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(.nil, "add")
    }
}

extension LocationValue: CodeRepresentable {
    var codeRepresentation: String {
        "CLLocationCoordinate2D(TODO)"
    }
}

