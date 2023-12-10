//
//  Screen.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation
import DylKit
import SwiftUI
import Alexandria

struct Screen: Codable, Identifiable {
    @UserDefaultable(key: "SCREENS") static var screens: [Screen] = []
    
    let id: UUID
    var name: String
    var initActions: StepArray
    var content: MakeableStack
    
    enum CodingKeys: String, CodingKey {
        case initActions
        case content
        case id
        case name
    }
    
    init(id: UUID, name: String, initActions: StepArray, content: MakeableStack) {
        self.name = name
        self.id = id
        self.initActions = initActions
        self.content = content
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(initActions, forKey: .initActions)
        try container.encode(content, forKey: .content)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        initActions = try container.decode(StepArray.self, forKey: .initActions)
        content = try container.decode(MakeableStack.self, forKey: .content)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
    }
}

extension Variable {
    static func named(_ name: String) -> Variable {
        .init(value: StringValue(value: name))
    }
}

extension AnyValue {
    static func variable(named name: String) -> AnyValue {
        Variable.named(name).any
    }
    
    static func string(_ value: String) -> AnyValue {
        StringValue(value: value).any
    }
    
    static func int(_ value: Int) -> AnyValue {
        IntValue.int(value).any
    }
}

extension IntValue {
    static func int(_ value: Int) -> IntValue {
        .init(value: value)
    }
}

extension MakeableLabel {
    static func text(_ text: AnyValue, size: Int = 18) -> MakeableLabel {
        .init(text: text, fontSize: .int(size), fontWeight: .init(value: .regular), italic: .init(value: false), base: .makeDefault(), textColor: .init(value: .black))
    }
}

extension MakeableStack {
    convenience init(axis: Axis = .vertical, _ elements: [any MakeableView]) {
        self.init(content: .init(value: elements, axis: .init(value: axis)), padding: .init(value: 5))
    }
}
