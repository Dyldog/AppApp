//
//  Screen+Defaults.swift
//  AppApp
//
//  Created by Dylan Elliott on 3/12/2023.
//

import Foundation

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
                MakeableLabel.withText("AUD", fontSize: 24, bold: true),
                MakeableField(
                    text: .init(initial: .string("123"), output: .named("AUD_VALUE")),
                    fontSize: .init(value: 48),
                    onTextUpdate: .init(value: []),
                    padding: .int(5),
                    alignment: .init(value: .center)
                )
            ]),
            MakeableStack([
                MakeableLabel.withText("=")
            ]),
            MakeableStack([
                MakeableField(
                    text: .init(initial: .string("THB"), output: .named("CURRENCY")),
                    fontSize: .init(value: 24),
                    onTextUpdate: .init(value: []),
                    padding: .int(5),
                    alignment: .init(value: .center)
                ),
                MakeableLabel.text(NumericalOperationValue(
                    lhs: ResultValue(steps: .init(value: [
                        DictionaryValueForKeyStep(
                            dictionary: .init(value: .variable(.named("JSON"))),
                            key: .variable(named: "CURRENCY")
                        )
                    ])).any,
                    rhs: ResultValue(steps: .init(value: [
                        GetNumberStep(value: .variable(named: "AUD_VALUE"), numberType: .init(value: .float))
                    ])).any,
                    operation: .init(value: .mulitply)
                ).any, size: 48)
            ])
        ])
    )
}
