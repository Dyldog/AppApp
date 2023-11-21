//
//  Step.swift
//  AppApp
//
//  Created by Dylan Elliott on 20/11/2023.
//

import Foundation
import SwiftUI

protocol Step: StepType {
    func run(with variables: inout Variables) throws
}
