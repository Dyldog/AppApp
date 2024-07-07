//
//  LocationValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 9/12/2023.
//

import Foundation
import Armstrong

public final class LocationValue: CompositeEditableVariableValue {
    
    public static let categories: [ValueCategory] = [.location]
    public static var type: VariableType { .location }
    
    public var name: TypedValue<StringValue>
    public var latitude: TypedValue<FloatValue>
    public var longitude: TypedValue<FloatValue>
    
    public var protoString: String { "\(latitude.protoString), \(longitude.protoString)" }
    public var valueString: String { "\(latitude.valueString), \(longitude.valueString)" }
    
    public init(name: TypedValue<StringValue>, latitude: TypedValue<FloatValue>, longitude: TypedValue<FloatValue>) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }

    public func value(with variables: Variables, and scope: Scope) throws -> VariableValue {
        LocationValue(
            name: .value(try name.value(with: variables, and: scope)),
            latitude: .value(try latitude.value(with: variables, and: scope)),
            longitude: .value(try longitude.value(with: variables, and: scope))
        )
    }
    
    public static func defaultValue(for property: Properties) -> EditableVariableValue {
        switch property {
        case .name: return TypedValue.value(StringValue(value: "Australia"))
        case .latitude: return TypedValue.value(FloatValue(value: -24.7761086))
        case .longitude: return TypedValue.value(FloatValue(value: 134.755))
        }
    }
    
    public func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(.nil, "add")
    }
}

extension LocationValue: CodeRepresentable {
    public var codeRepresentation: String {
        "CLLocationCoordinate2D(TODO)"
    }
}

