//
//  SheetButton.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

struct SheetButton<Title: View, Content: View>: View {
    @State var showSheet: Bool = false
    
    let title: () -> Title
    @ViewBuilder var content: Content
    
    var body: some View {
        SwiftUI.Button {
            showSheet = true
        } label: {
            title()
        }.sheet(isPresented: $showSheet, content: {
            content
        })
    }
    
}
