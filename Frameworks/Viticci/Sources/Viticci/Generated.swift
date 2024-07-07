// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import DylKit
import SwiftUI

// OpenURLStep

extension OpenURLStep: Copying {
    public func copy() -> OpenURLStep {
        return OpenURLStep(
            url: url
        )
    }
}

public extension OpenURLStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case url
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .url: return OpenURLStep.defaultValue(for: .url)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            url: factory(.url) as! TypedValue<StringValue>
        )
    }

    static func makeDefault() -> Self {
        .init(
            url: Properties.url.defaultValue as! TypedValue<StringValue>
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .url: return url
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .url: url = value as! TypedValue<StringValue>
        }
    }
}

public extension VariableType {
    static var openURLStep: VariableType { .init(title: "OpenURLStep") } // OpenURLStep
}

public extension OpenURLStep {
    internal enum CodingKeys: String, CodingKey {
        case url
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            url: (try? valueContainer.decode(TypedValue<StringValue>.self, forKey: .url)) ?? Properties.url.defaultValue as! TypedValue<StringValue>
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(url, forKey: .url)
    }
}

public class Viticci: AAProvider {
    public static var steps: [any StepType.Type] {
        [
            OpenURLStep.self,
        ]
    }

    public static var values: [any EditableVariableValue.Type] {
        [
            OpenURLStep.self,
        ]
    }

    public static var views: [any MakeableView.Type] {
        [
        ]
    }
}

import Armstrong
import DylKit
