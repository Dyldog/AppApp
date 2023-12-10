//
//  MakeableView.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import Armstrong

protocol MakeableView: CompositeEditableVariableValue, Codable, CodeRepresentable {
    func insertValues(into variables: Variables) async throws
}
