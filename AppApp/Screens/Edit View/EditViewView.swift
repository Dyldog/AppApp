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
    @State var update: Int = 0
    @State var error: VariableValueError?
    
    var body: some View {
        VStack {
            viewModel.editable.editView {
                viewModel.editable = $0
                update += 1
            }
            .frame(minWidth: 300, minHeight: 300)
            .padding()
            
//            DoView {
            MakeableWrapperView(
                isRunning: false,
                showEditControls: false,
                view: viewModel.editable,
                onContentUpdate: { _ in },
                onRuntimeUpdate: { }, 
                error: $error
            )
            .id(update)
            .padding(20)
            .border(.black)
            .padding()
            .any
        }.onDisappear {
            viewModel.onUpdate(viewModel.editable)
        }
    }
    
}
