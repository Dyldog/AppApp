//
//  VHStack.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

struct Stack<Content: View>: View {
    let axis: Axis
    @ViewBuilder var content: () -> Content

    var body: some View {
        if axis == .vertical {
            VStack(content: content)
        } else {
            HStack(content: content)
        }
    }
}


struct VHStack<Content: View>: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @ViewBuilder var content: () -> Content

    var body: some View {
        if horizontalSizeClass == .compact {
            VStack(content: content)
        } else {
            HStack(content: content)
        }
    }
}
