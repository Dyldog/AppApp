//
//  ButtonStyleValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 29/11/2023.
//

import SwiftUI
import Armstrong

// sourcery: categories = ".layout"
public enum ButtonStyle: String, PickableValue {
    case plain
    case borderedProminent
    case bordered
    
    public static var defaultValue: ButtonStyle = .plain
    
    public var title: String { rawValue }
    
    public var codeRepresentation: String {
        switch self {
        case .plain: return ".plain"
        case .borderedProminent: return ".borderedProminent"
        case .bordered: return ".bordered"
        }
    }
}

public extension View {
    func withButtonStyle(_ style: ButtonStyle) -> some View {
        switch style {
        case .plain: return buttonStyle(.plain).any
        case .borderedProminent: return buttonStyle(.borderedProminent).any
        case .bordered: return buttonStyle(.bordered).any
        }
    }
}
