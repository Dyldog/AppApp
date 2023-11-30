//
//  Screen.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation
import DylKit
import SwiftUI

struct Screen: Codable, Identifiable {
    @UserDefaultable(key: "SCREENS") static var screens: [Screen] = Screen.defaults
    
    let id: UUID
    var name: String
    var initActions: StepArray
    var content: MakeableStack
    
    enum CodingKeys: String, CodingKey {
        case initActions
        case content
        case id
        case name
    }
    
    init(id: UUID, name: String, initActions: StepArray, content: MakeableStack) {
        self.name = name
        self.id = id
        self.initActions = initActions
        self.content = content
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(initActions, forKey: .initActions)
        try container.encode(content, forKey: .content)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        initActions = try container.decode(StepArray.self, forKey: .initActions)
        content = try container.decode(MakeableStack.self, forKey: .content)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
    }
}

extension Variable {
    static func named(_ name: String) -> Variable {
        .init(value: StringValue(value: name))
    }
}

extension AnyValue {
    static func variable(named name: String) -> AnyValue {
        Variable.named(name).any
    }
    
    static func string(_ value: String) -> AnyValue {
        StringValue(value: value).any
    }
    
    static func int(_ value: Int) -> AnyValue {
        IntValue.int(value).any
    }
}

extension IntValue {
    static func int(_ value: Int) -> IntValue {
        .init(value: value)
    }
}

extension MakeableLabel {
    static func text(_ text: AnyValue, size: Int = 18) -> MakeableLabel {
        .init(text: text, fontSize: .int(size), fontWeight: .init(value: .regular), italic: .init(value: false), base: .makeDefault(), textColor: .init(value: .black))
    }
}

extension MakeableStack {
    convenience init(axis: Axis = .vertical, _ elements: [any MakeableView]) {
        self.init(content: .init(value: elements, axis: .init(value: axis)), padding: .init(value: 5))
    }
}
extension Screen {
    static let defaults: [Screen] = [.internetDictionary, .countingButton, .currencyConverter]
    
    private static let internetDictionary: Screen = .init(
        id: .init(),
        name: "Internet Dictionary",
        initActions: .init(value: [
            APIValueStep(url: StringValue(value: "https://api.ipify.org?format=json").any),
            DecodeDictionaryStep(value: Variable(value: StringValue(value: "$0")).any),
            DictionaryValueForKeyStep(dictionary: .init(value: .variable(.named("$0"))), key: .string("ip")),
            SetVarStep(varName: .string("IP"), value: .variable(named: "$0")),
            SetVarStep(varName: .string("LOCATIONURL"), value: .string("http://ip-api.com/json/")),
            AddToVarStep(varName: .string("LOCATIONURL"), value: .variable(named: "IP")),
            APIValueStep(url: .variable(named: "LOCATIONURL")),
            DecodeDictionaryStep(value: .variable(named: "$0")),
            SetVarStep(varName: .string("LOCATION"), value: .variable(named: "$0")),
            DictionaryKeysStep(dictionary: .init(value: .variable(.named("$0")))),
            SetVarStep(varName: .string("KEYS"), value: .variable(named: "$0"))
        ]), content: .init(content: .init(value: [
            MakeableLabel(
                text: .variable(named: "IP"),
                fontSize: .int(24),
                fontWeight: .init(value: .semibold),
                italic: .init(value: true),
                base: .makeDefault(),
                textColor: .init(value: .black)
            ),
            MakeableList(
                data: .init(value: .variable(.named("KEYS"))),
                view: MakeableStack(
                    content: .init(value: [
                        MakeableLabel.text(.variable(named: "$0")),
                        MakeableLabel.text(ResultValue(steps: .init(value: [
                            DictionaryValueForKeyStep(
                                dictionary: .init(value: .variable(.named("LOCATION"))),
                                key: .variable(named: "$0")
                            )
                        ])).any)
                    ], axis: .init(value: .horizontal)),
                    padding: .int(5)
                ).any
            )
        ], axis: .init(value: .vertical)), padding: .init(value: 5)))
    
    private static let countingButton: Screen = .init(
        id: .init(),
        name: "Counting Button",
        initActions: .init(value: [
            SetVarStep(varName: .string("COUNT"), value: .int(0))
        ]), content: .init(content: .init(value: [
            MakeableButton(title: .text(.variable(named: "COUNT"), size: 120), style: .makeDefault(), action: .init(value: [
                AddToVarStep(varName: .string("COUNT"), value: .int(1))
            ]))
        ], axis: .init(value: .vertical)), padding: .int(5)))
    
    private static let currencyConverter: Screen = .init(
        id: .init(),
        name: "Currency Converter",
        initActions: .init(value: [
            APIValueStep(url: .string("https://open.er-api.com/v6/latest/AUD")),
            DecodeDictionaryStep(value: .variable(named: "$0")),
            DictionaryValueForKeyStep(
                dictionary: .init(value: .variable(.named("$0"))), key: .string("rates")
            ),
            SetVarStep(varName: .string("JSON"), value: .variable(named: "$0"))
        ]), content: .init(axis: .horizontal, [
            MakeableStack([
                MakeableLabel.withText("AUD"),
                MakeableField(
                    text: .init(initial: .string("123"), output: .named("AUD_VALUE")),
                    fontSize: .init(value: 24),
                    onTextUpdate: .init(value: []),
                    padding: .int(5)
                )
            ]),
            MakeableStack([
                MakeableLabel.withText("=")
            ]),
            MakeableStack([
                MakeableLabel.withText("THB"),
                MakeableLabel.text(NumericalOperationValue(
                    lhs: ResultValue(steps: .init(value: [
                        DictionaryValueForKeyStep(
                            dictionary: .init(value: .variable(.named("JSON"))),
                            key: .string("THB")
                        )
                    ])).any,
                    rhs: ResultValue(steps: .init(value: [
                        GetNumberStep(value: .variable(named: "AUD_VALUE"), numberType: .init(value: .float))
                    ])).any,
                    operation: .init(value: .mulitply)
                ).any)
            ])
        ])
    )
}
