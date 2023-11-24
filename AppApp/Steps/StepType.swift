//
//  StepType.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

protocol StepType: AnyObject, ViewEditable {
    static var title: String { get }
    func set(_ value: VariableValue, for property: Properties)
}
