//
//  ViewMakerView.swift
//  AppApp
//
//  Created by Dylan Elliott on 20/11/2023.
//

import SwiftUI
import DylKit
       
struct ViewMakerView: View {
    @StateObject var viewModel: ViewMakerViewModel
    
    var body: some View {
        Self._printChanges()
        return GeometryReader { geometry in
            VStack {
                ScrollView {
                    CenterStack {
                        MakeableStackView(
                            makeMode: viewModel.makeMode,
                            stack: .init(content: viewModel.content),
                            onContentUpdate: { content in
                                onMain {
                                    viewModel.content = content.content
                                }
                            }, onRuntimeUpdate: {
                                Task { @MainActor in
                                    await viewModel.onRuntimeUpdate()
                                }
                            },
                            variables: $viewModel.variables,
                            error: $viewModel.error
                        )
                    }
                    .frame(minHeight: geometry.size.height)
                }
            }
            .navigationTitle(viewModel.name)
            .if(viewModel.showErrors, modified: { view in
                view.alert(item: $viewModel.error, content: {
                    .init(title: Text("Error"), message: Text($0.localizedDescription))
                })
            })
            .toolbar {
                HStack {
                    if viewModel.makeMode {
                        viewModel.initActions.editView {
                            viewModel.updateInitActions($0)
                        }
                        
                        VStack(spacing: 0) {
                            Text("Errors").font(.footnote)
                            Toggle("Errors", isOn: $viewModel.showErrors)
                                .toggleStyle(.switch)
                                .fixedSize()
                                .labelsHidden()
                        }
                    }
                    
                    VStack(spacing: 0) {
                        Text("Edit").font(.footnote)
                        Toggle("Edit", isOn: $viewModel.makeMode)
                            .toggleStyle(.switch)
                            .fixedSize()
                            .labelsHidden()
                    }
                }
            }
        }
    }
}
