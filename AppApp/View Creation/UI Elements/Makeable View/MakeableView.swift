//
//  MakeableView.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

protocol MakeableView: CompositeEditableVariableValue, Codable, Identifiable where ID == UUID {
    func insertValues(into variables: Binding<Variables>) async throws
}
