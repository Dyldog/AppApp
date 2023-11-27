//
//  EditViewView.swift
//  AppApp
//
//  Created by Dylan Elliott on 20/11/2023.
//

import SwiftUI
import DylKit

struct EditViewView: View {
    @StateObject var viewModel: EditViewViewModel
    
    var body: some View {
        VStack {
            viewModel.editable.editView {
                viewModel.editable = $0
            }
            .frame(minWidth: 300, minHeight: 300)
            
//            DoView {
            MakeableWrapperView(
                makeMode: true,
                view: viewModel.editable,
                onContentUpdate: { _ in },
                onRuntimeUpdate: { }
            )
            .padding(20)
            .border(.black)
            .padding()
            .any
        }.onDisappear {
            viewModel.onUpdate(viewModel.editable)
        }
    }
    
}
