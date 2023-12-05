//
//  ContentView.swift
//  AATest
//
//  Created by Dylan Elliott on 3/12/2023.
//

import SwiftUI
import DylKit

struct ContentView: View {
    var body: some View {
        InternetDictionaryView()
            .padding()
    }
}

struct InternetDictionaryView: View {
    @State var IP: Variable
    @State var LOCATIONURL: StringValue
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
        let OUT6 = OUT5.keys
        KEYS = OUT6
    }
    var body: some View {
        VStack {
            Text("\(IP)")
                .font(.system(size: 24).weight(.semibold))
                .if(true) { $0.italic() }
                .foregroundStyle(Color(hex: "000000FF"))
            List {
                ForEach(enumerated: KEYS, id: \.offset) { (index, element) in
                    HStack {
                        Text("\($0)")
                            .font(.system(size: 18).weight(.regular))
                            .if(false) { $0.italic() }
                            .foregroundStyle(Color(hex: "000000FF"))
                        Text("")
                        .font(.system(size: 18).weight(.regular))
                        .if(false) { $0.italic() }
                        .foregroundStyle(Color(hex: "000000FF"))
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
