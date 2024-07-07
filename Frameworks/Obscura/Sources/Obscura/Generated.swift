// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import DylKit
import SwiftUI

public extension MakeableImageView {
    func make(isRunning: Bool, showEditControls: Bool, scope: Scope, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping (@escaping Block) -> Void, error: Binding<VariableValueError?>) -> AnyView {
        MakeableImageViewView(isRunning: isRunning, showEditControls: showEditControls, scope: scope, imageView: self, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: error).any
    }
}

// GetSystemImageStep

extension GetSystemImageStep: Copying {
    public func copy() -> GetSystemImageStep {
        return GetSystemImageStep(
            image: image.copy()
        )
    }
}

public extension GetSystemImageStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case image
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .image: return GetSystemImageStep.defaultValue(for: .image)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            image: factory(.image) as! SystemImageValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            image: Properties.image.defaultValue as! SystemImageValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .image: return image
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .image: image = value as! SystemImageValue
        }
    }
}

public extension VariableType {
    static var getSystemImageStep: VariableType { .init(title: "GetSystemImageStep") } // GetSystemImageStep
}

public extension GetSystemImageStep {
    internal enum CodingKeys: String, CodingKey {
        case image
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            image: (try? valueContainer.decode(SystemImageValue.self, forKey: .image)) ?? Properties.image.defaultValue as! SystemImageValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(image, forKey: .image)
    }
}

// ImageValue

extension ImageValue: Copying {
    public func copy() -> ImageValue {
        return ImageValue(
            value: value,
            size: size
        )
    }
}

public extension VariableType {
    static var image: VariableType { .init(title: "Image") } // ImageValue
}

public extension ImageValue {
    internal enum CodingKeys: String, CodingKey {
        case value
        case size
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(CodableImage.self, forKey: .value)) ?? Self.makeDefault().value,
            size: (try? valueContainer.decode(IntValue.self, forKey: .size)) ?? Self.makeDefault().size
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try container.encode(size, forKey: .size)
    }
}

// MakeableImageView

extension MakeableImageView: Copying {
    public func copy() -> MakeableImageView {
        return MakeableImageView(
            id: id,
            base: base,
            image: image,
            tint: tint
        )
    }
}

public extension MakeableImageView {
    enum Properties: String, ViewProperty, CaseIterable {
        case base
        case image
        case tint
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .base: return MakeableImageView.defaultValue(for: .base)
            case .image: return MakeableImageView.defaultValue(for: .image)
            case .tint: return MakeableImageView.defaultValue(for: .tint)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            id: UUID(),
            base: factory(.base) as! MakeableBase,
            image: factory(.image) as! TypedValue<ImageValue>,
            tint: factory(.tint) as! TypedValue<ColorValue>
        )
    }

    static func makeDefault() -> Self {
        .init(
            id: UUID(),
            base: Properties.base.defaultValue as! MakeableBase,
            image: Properties.image.defaultValue as! TypedValue<ImageValue>,
            tint: Properties.tint.defaultValue as! TypedValue<ColorValue>
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .base: return base
        case .image: return image
        case .tint: return tint
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .base: base = value as! MakeableBase
        case .image: image = value as! TypedValue<ImageValue>
        case .tint: tint = value as! TypedValue<ColorValue>
        }
    }
}

public extension VariableType {
    static var imageView: VariableType { .init(title: "ImageView") } // MakeableImageView
}

public extension MakeableImageView {
    internal enum CodingKeys: String, CodingKey {
        case id
        case base
        case image
        case tint
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: (try? valueContainer.decode(UUID.self, forKey: .id)) ?? UUID(),
            base: (try? valueContainer.decode(MakeableBase.self, forKey: .base)) ?? Properties.base.defaultValue as! MakeableBase,
            image: (try? valueContainer.decode(TypedValue<ImageValue>.self, forKey: .image)) ?? Properties.image.defaultValue as! TypedValue<ImageValue>,
            tint: (try? valueContainer.decode(TypedValue<ColorValue>.self, forKey: .tint)) ?? Properties.tint.defaultValue as! TypedValue<ColorValue>
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(base, forKey: .base)
        try container.encode(image, forKey: .image)
        try container.encode(tint, forKey: .tint)
    }
}

// SystemImageValue

extension SystemImageValue: Copying {
    public func copy() -> SystemImageValue {
        return SystemImageValue(
            name: name,
            size: size
        )
    }
}

public extension SystemImageValue {
    enum Properties: String, ViewProperty, CaseIterable {
        case name
        case size
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .name: return SystemImageValue.defaultValue(for: .name)
            case .size: return SystemImageValue.defaultValue(for: .size)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            name: factory(.name) as! StringValue,
            size: factory(.size) as! IntValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            name: Properties.name.defaultValue as! StringValue,
            size: Properties.size.defaultValue as! IntValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .name: return name
        case .size: return size
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .name: name = value as! StringValue
        case .size: size = value as! IntValue
        }
    }
}

public extension VariableType {
    static var systemImage: VariableType { .init(title: "SystemImage") } // SystemImageValue
}

public extension SystemImageValue {
    internal enum CodingKeys: String, CodingKey {
        case name
        case size
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            name: (try? valueContainer.decode(StringValue.self, forKey: .name)) ?? Properties.name.defaultValue as! StringValue,
            size: (try? valueContainer.decode(IntValue.self, forKey: .size)) ?? Properties.size.defaultValue as! IntValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(size, forKey: .size)
    }
}

import Armstrong
import DylKit

public class Obscura: AAProvider {
    public static var steps: [any StepType.Type] {
        [
            GetSystemImageStep.self,
        ]
    }

    public static var values: [any EditableVariableValue.Type] {
        [
            GetSystemImageStep.self,
            ImageValue.self,
            MakeableImageView.self,
            SystemImageValue.self,
        ]
    }

    public static var views: [any MakeableView.Type] {
        [
            MakeableImageView.self,
        ]
    }
}
