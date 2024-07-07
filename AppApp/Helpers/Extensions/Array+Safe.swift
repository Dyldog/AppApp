//
//  Array+Safe.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

extension Array {
    subscript(safe index: Index) -> Element? {
        get {
            if indices.contains(index) {
                return self[index]
            } else {
                return nil
            }
        }
        set {
            if index <= endIndex, let newValue = newValue {
                insert(newValue, at: index)
            }
        }
    }
}
