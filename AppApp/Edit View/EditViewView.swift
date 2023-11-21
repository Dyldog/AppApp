//
//  EditViewView.swift
//  AppApp
//
//  Created by Dylan Elliott on 20/11/2023.
//

import SwiftUI
import DylKit

protocol ViewConstructor {
    var view: any ViewEditable { get }
}

struct EditableViewConstructor<T: ViewEditable>: ViewConstructor {
    let properties: [T.Properties: any VariableValue]
    let factory: ([T.Properties: any VariableValue]) -> any ViewEditable
    
    init(properties: [T.Properties : any VariableValue], factory: @escaping ([T.Properties : any VariableValue]) -> any ViewEditable) {
        self.properties = properties
        self.factory = factory
    }
    
    var view: any ViewEditable {
        factory(properties)
    }
}

struct MakeableViewConstructor: ViewConstructor {
    let properties: [String: any VariableValue]
    let factory: ([String: any VariableValue]) -> any MakeableView
    
    init(properties: [String : any VariableValue], factory: @escaping ([String : any VariableValue]) -> any MakeableView) {
        self.properties = properties
        self.factory = factory
    }
    
    var view: any ViewEditable {
        factory(properties)
    }
}

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
