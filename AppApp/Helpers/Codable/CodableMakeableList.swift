//
//  CodableMakeableList.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import Foundation

struct CodableMakeableList: Codable {
    let elements: [any MakeableView]
    
    init(elements: [any MakeableView]) {
        self.elements = elements
    }
    
    init(from decoder: Decoder) throws {
        var contentContainer = try decoder.unkeyedContainer()
        
        var content: [any MakeableView] = []
        
        while !contentContainer.isAtEnd {
            if let value = try? contentContainer.decode(MakeableStack.self) {
                content.append(value)
            } else if let value = try? contentContainer.decode(MakeableField.self) {
                content.append(value)
            } else if let value = try? contentContainer.decode(MakeableLabel.self) {
                content.append(value)
            } else if let value = try? contentContainer.decode(MakeableButton.self) {
                content.append(value)
            } else {
//                fatalError()
                self.init(elements: [MakeableLabel.withText("ERROR")])
                return
            }
        }
        
        self.init(elements: content)
    }
    
    func encode(to encoder: Encoder) throws {
        var contentContainer = encoder.unkeyedContainer()
        
        for element in elements {
            switch element {
            case let stack as MakeableStack:
                try contentContainer.encode(stack)
            case let label as MakeableLabel:
                try contentContainer.encode(label)
            case let button as MakeableButton:
                try contentContainer.encode(button)
            case let field as MakeableField:
                try contentContainer.encode(field)
            default:
                fatalError()
            }
        }
    }
}
