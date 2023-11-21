//
//  DoView.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

struct DoView<Content: View, Data>: View {
    let view: Content!
    
    init(tryer: @escaping () throws -> Data, content: @escaping (Data) -> Content, onError: @escaping (Error) -> Content) {
        do {
            view = content(try tryer())
        } catch {
            view = onError(error)
        }
    }
    
    var body: some View {
        view
    }
}
