//
//  TextAlignmentValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 1/12/2023.
//

import SwiftUI
import Armstrong

// sourcery: categories = ".text"
extension TextAlignment: PickableValue, Codable {
    
    public static var defaultValue: TextAlignment = .center
    
    public var title: String {
        switch self {
        case .center: return "Center"
        case .leading: return "Leading"
        case .trailing: return "Trailing"
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    public var codeRepresentation: String {
        switch self {
        case .center: return ".center"
        case .leading: return ".leading"
        case .trailing: return ".trailing"
        }
    }
}
