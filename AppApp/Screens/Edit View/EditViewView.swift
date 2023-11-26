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
                viewModel.onUpdate($0)
            }
            .frame(minWidth: 300, minHeight: 300)
            
//            DoView {
            MakeableWrapperView(
                makeMode: true,
                view: viewModel.editable.makeableConstructor.makeableView,
                onContentUpdate: { _ in },
                onRuntimeUpdate: { },
                variables: .nil(),
                error: .nil()
            )
            .padding(20)
            .border(.black)
            .padding()
            .any
        }
    }
    
}
