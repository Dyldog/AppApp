//
//  ViewContructor.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation
import Armstrong

/// Produces a `ViewEditable` without arguments
protocol ViewConstructor {
    var view: any ViewEditable { get }
}
