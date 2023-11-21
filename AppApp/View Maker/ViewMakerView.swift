//
//  ViewMakerView.swift
//  AppApp
//
//  Created by Dylan Elliott on 20/11/2023.
//

import SwiftUI
import DylKit
                        
struct ViewMakerView: View {
    @StateObject var viewModel: ViewMakerViewModel = .init()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ScrollView {
                    CenterStack {
                        MakeableStack(content: viewModel.content, makeMode: viewModel.makeMode) {
                            viewModel.addTapped(at: $0)
                        } editTapped: {
                            viewModel.editView(at: $0)
                        }.view(variables: $viewModel.variables, alert: $viewModel.alert)
                            .sheet(item: $viewModel.showAddIndex, content: { index in
                                AddViewView(viewModel: .init(onSelect: { view in
                                    viewModel.onAdd(view, at: index)
                                }))
                            }).sheet(item: $viewModel.showEditIndex, content: { row in
                                EditViewView(viewModel: .init(constructor: row.constructor, onSave: {
                                    viewModel.onEdit($0, at: row.index)
                                }))
                            })
                    }
                    .frame(minHeight: geometry.size.height)
                }
                
                CornerStack(corner: .topRight) {
                    HStack {
                        Spacer()
                        
                        viewModel.initActions.editView(title: "Init Actions") {
                            viewModel.updateInitActions($0)
                        }
                        
                        Toggle("Edit", isOn: $viewModel.makeMode)
                            .fixedSize()
                    }
                }
            }.alert($viewModel.alert)
        }
    }
}
