//
//  ButtonStyleValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 29/11/2023.
//

import SwiftUI

enum ButtonStyle: String, PickableValue {
    case plain
    case borderedProminent
    case bordered
    
    static var defaultValue: ButtonStyle = .plain
    
    var title: String { rawValue }
    
    var style: any PrimitiveButtonStyle {
        switch self {
        case .plain: return .plain
        case .borderedProminent: return .borderedProminent
        case .bordered: return .bordered
        }
    }
    
    var codeRepresentation: String {
        switch self {
        case .plain: return ".plain"
        case .borderedProminent: return ".borderedProminent"
        case .bordered: return ".bordered"
        }
    }
}
