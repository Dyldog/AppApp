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
            
            DoView {
                try viewModel.view.prototypeView()
            } content: {
                $0
                    .padding(20)
                    .border(.black)
                    .padding()
                    .any
            } onError: {
                viewModel.alert = .init(title: "Error", message: $0.localizedDescription)
                return Text("ERROR").any
            }
        }
//        .alert($viewModel.alert)
    }
    
}
