//
//  StepType+EditView.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

extension StepType {
    func editView(onUpdate: @escaping (Self) -> Void, remove: @escaping () -> Void) -> any View {
        VStack {
            Text(Self.title)
            HStack {
                VHStack {
                    ForEach(self.properties.map { ($0.key, $0.value)}, id: \.0) { property in
                        HStack {
                            Text(property.0.rawValue)
                            property.1.editView { value in
                                self.set(value, for: property.0)
                                onUpdate(self)
                            }
                        }
                    }
                }
                
                Spacer()
                
                SwiftUI.Button("X", action: remove)
            }
        }
    }
}
