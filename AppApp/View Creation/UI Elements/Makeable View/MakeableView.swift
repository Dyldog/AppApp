//
//  MakeableView.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

protocol MakeableView: CompositeEditableVariableValue, Codable {
    func insertValues(into variables: Variables) async throws
}
