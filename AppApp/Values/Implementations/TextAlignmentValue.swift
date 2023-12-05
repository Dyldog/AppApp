//
//  TextAlignmentValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 1/12/2023.
//

import SwiftUI

extension TextAlignment: PickableValue, Codable {
    
    static var defaultValue: TextAlignment = .center
    
    var title: String {
        switch self {
        case .center: return "Center"
        case .leading: return "Leading"
        case .trailing: return "Trailing"
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    var codeRepresentation: String {
        switch self {
        case .center: return ".center"
        case .leading: return ".leading"
        case .trailing: return ".trailing"
        }
    }
}
