//
//  ViewProperty.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

protocol ViewProperty: CaseIterable, Hashable {
    var rawValue: String { get }
    var defaultValue: any VariableValue { get }
}
