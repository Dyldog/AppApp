// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI
import DylKit














// OpenURLStep

extension OpenURLStep: Copying {
    public func copy() -> OpenURLStep {
        return OpenURLStep(
                    url: url
        )
    }
}

extension OpenURLStep {
     public enum Properties: String, ViewProperty, CaseIterable {
        case url
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .url: return OpenURLStep.defaultValue(for: .url)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            url: factory(.url) as! TypedValue<StringValue>
        )
    }

    public static func makeDefault() -> Self {
        .init(
            url: Properties.url.defaultValue as! TypedValue<StringValue>
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .url: return url
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .url: self.url = value as! TypedValue<StringValue>
        }
    }
}

extension VariableType {
    public static var openURLStep: VariableType { .init(title: "OpenURLStep") } // OpenURLStep
}

extension OpenURLStep {
    enum CodingKeys: String, CodingKey {
        case url
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            url: (try? valueContainer.decode(TypedValue<StringValue>.self, forKey: .url)) ?? Properties.url.defaultValue as! TypedValue<StringValue>
        )
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(url, forKey: .url)
    }
}
















public class Viticci: AAProvider {
    public static var steps: [any StepType.Type] {
    [
        OpenURLStep.self
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



