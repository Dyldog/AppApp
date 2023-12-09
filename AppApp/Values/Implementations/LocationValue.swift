//
//  LocationValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 9/12/2023.
//

import Foundation

final class LocationValue: CompositeEditableVariableValue {
    
    static var type: VariableType { .location }
    
    var latitude: TypedValue<FloatValue>
    var longitude: TypedValue<FloatValue>
    
    var protoString: String { "\(latitude.value), \(longitude.value)" }
    var valueString: String { protoString }
    
    init(latitude: TypedValue<FloatValue>, longitude: TypedValue<FloatValue>) {
        self.latitude = latitude
        self.longitude = longitude
    }

    func value(with variables: Variables) async throws -> VariableValue {
        LocationValue(
            latitude: .value(try await latitude.value(with: variables)),
            longitude: .value(try await longitude.value(with: variables))
        )
    }
    
    static func defaultValue(for property: Properties) -> EditableVariableValue {
        switch property {
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

