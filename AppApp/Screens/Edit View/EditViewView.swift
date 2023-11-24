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
            List {
                ForEach(viewModel.rows, id: \.0) { (key, value) in
                    HStack {
                        Text(key)
                        value.wrappedValue.editView {
                            viewModel.propertyUpdated(key, to: $0)
                        }
                    }
                }
            }
            .frame(minWidth: 300, minHeight: 300)
            
//            DoView {
            MakeableWrapperView(
                makeMode: true,
                view: viewModel.view.makeableConstructor.makeableView,
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
