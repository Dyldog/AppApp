//
//  MakeableWrapperView.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import SwiftUI

struct MakeableWrapperView: View {
    let isRunning: Bool
    let showEditControls: Bool
    @State var view: any MakeableView
    let onContentUpdate: (any MakeableView) -> Void
    let onRuntimeUpdate: () -> Void
}
