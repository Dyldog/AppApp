//
//  ContentView.swift
//  SimpleAppApp
//
//  Created by Dylan Elliott on 30/12/2023.
//

import Alexandria
import Armstrong
import SwiftUI

struct ContentView: View {
    @StateObject var listViewModel: ScreenListViewModel = .init()

    init() {
        AALibrary.shared.addProviders([Armstrong.self, Alexandria.self])
    }

    var body: some View {
        NavigationStack {
            ScreenListView(viewModel: listViewModel)
        }
    }
}

struct InternetDictionary2View: View {
    @State var IP: Variable
    @State var LOCATIONURL: String
    @State var LOCATION: Variable
    @State var KEYS: Variable

    init() {
        let OUT1 = try! String(contentsOf: URL(string: "https://api.ipify.org?format=json")!)
        let OUT2 = try! JSONSerialization.jsonObject(with: OUT1.data(using: .utf8)!, options: []) as! [String: Any]
        let OUT3 = OUT2["ip"]
        IP = OUT3
        LOCATIONURL = "http://ip-api.com/json/"
        LOCATIONURL = "LOCATIONURL" + IP
        let OUT4 = try! String(contentsOf: URL(string: LOCATIONURL)!)
        let OUT5 = try! JSONSerialization.jsonObject(with: OUT4.data(using: .utf8)!, options: []) as! [String: Any]
        LOCATION = OUT5
        let OUT6 = Array(OUT5.keys)
        KEYS = OUT6
    }

    var body: some View {
        [
            Text("\(IP)")
                .font(.system(size: 24).weight(.semibold))
                .if(true) { $0.italic() }
                .foregroundStyle(Color(hex: "000000FF")),
            TODO,
        ]
    }
}
