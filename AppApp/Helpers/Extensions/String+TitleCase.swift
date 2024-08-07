//
//  String+TitleCase.swift
//  AppApp
//
//  Created by Dylan Elliott on 30/11/2023.
//

import Foundation

extension String {
    func titleCase() -> String {
        return replacingOccurrences(of: "([A-Z])",
                                    with: " $1",
                                    options: .regularExpression,
                                    range: range(of: self))
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .capitalized // If input is in llamaCase
    }
}
