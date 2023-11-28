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
                            isRunning: !viewModel.makeMode,
                            showEditControls: viewModel.makeMode,
                            stack: viewModel.content, 
                            onContentUpdate: { content in
                                onMain {
                                    viewModel.content = content
                                }
                            }, onRuntimeUpdate: {
                                withAnimation {
                                    viewModel.onRuntimeUpdate()
                                }
                                
                            }, 
                            error: $viewModel.error
                        ).id(viewModel.variables)
                    }
                    .frame(minHeight: geometry.size.height)
                }
            }
            .environmentObject(viewModel.variables)
            .navigationTitle(viewModel.name)
            .if(viewModel.showErrors, modified: { view in
                view.alert(item: $viewModel.error, content: {
                    .init(title: Text("Error"), message: Text($0.localizedDescription))
                })
            })
            .toolbar {
                HStack {
                    if viewModel.makeMode {
                        SheetButton(title: { Text("Edit") }) {
                            ActionListView(steps: viewModel.initActions.value, onUpdate: {
                                viewModel.updateInitActions(.init(value: $0))
                            })
                        } onDismiss: {
                            //
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
