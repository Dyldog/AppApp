//
//  Screen.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

struct Screen: Codable, Identifiable {
    let id: UUID
    var name: String
    var initActions: [any StepType]
    var content: [any MakeableView]
    
    enum CodingKeys: String, CodingKey {
        case initActions
        case content
        case id
        case name
    }
    
    init(id: UUID = .init(), name: String, initActions: [any StepType], content: [any MakeableView]) {
        self.name = name
        self.id = id
        self.initActions = initActions
        self.content = content
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(CodableStepList(steps: initActions), forKey: .initActions)
        try container.encode(CodableMakeableList(elements: content), forKey: .content)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        initActions = try container.decode(CodableStepList.self, forKey: .initActions).steps
        content = try container.decode(CodableMakeableList.self, forKey: .content).elements
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
    }
}
