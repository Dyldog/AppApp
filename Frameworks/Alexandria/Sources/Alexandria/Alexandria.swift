// The Swift Programming Language
// https://docs.swift.org/swift-book

import Armstrong

extension Alexandria {
    public static var demoScreens: [Screen] {
        [appNotes, internetDictionary, countingButton, currencyConverter, mappyBoy]
    }

    private static let internetDictionary: Screen = .init(
        id: .init(),
        name: "Internet Dictionary",
        initVariables: .makeDefault(),
        initActions: .init(value: [
            APIValueStep(url: StringValue(value: "https://api.ipify.org?format=json").any),
            DecodeDictionaryStep(value: Variable(value: StringValue(value: "$0").any).any),
            DictionaryValueForKeyStep(dictionary: .init(value: .variable(.named("$0"))), key: .string("ip")),
            SetVarStep(varName: .string("IP"), value: .variable(named: "$0")),
            SetVarStep(varName: .string("LOCATIONURL"), value: .string("http://ip-api.com/json/")),
            AddToVarStep(varName: .string("LOCATIONURL"), value: .variable(named: "IP")),
            APIValueStep(url: .variable(named: "LOCATIONURL")),
            DecodeDictionaryStep(value: .variable(named: "$0")),
            SetVarStep(varName: .string("LOCATION"), value: .variable(named: "$0")),
            DictionaryKeysStep(dictionary: .init(value: .variable(.named("$0")))),
            SetVarStep(varName: .string("KEYS"), value: .variable(named: "$0")),
        ]),
        subscreens: [],
        content: MakeableStack(id: .init(), content: .value(ArrayValue(type: .base, elements: [
            MakeableLabel(
                id: .init(), text: .variable(named: "IP"),
                fontSize: .int(24),
                fontWeight: .init(value: .semibold),
                italic: .init(value: true),
                base: .makeDefault(),
                textColor: .init(value: .black),
                isMultiline: .false
            ),
            MakeableList(
                id: .init(), data: .init(value: .variable(.named("KEYS"))),
                view: MakeableStack(
                    id: .init(), axis: .init(value: .horizontal),
                    content: .value(.init(type: .base, elements: [
                        MakeableLabel.text(.variable(named: "$0")),
                        MakeableLabel.text(ResultValue(steps: .init(value: [
                            DictionaryValueForKeyStep(
                                dictionary: .init(value: .variable(.named("LOCATION"))),
                                key: .variable(named: "$0")
                            ),
                        ])).any),
                    ]))
                ).any
            ),
        ])))
    )

    private static let countingButton: Screen = .init(
        id: .init(),
        name: "Counting Button",
        initVariables: .makeDefault(),
        initActions: .init(value: [
            SetVarStep(varName: .string("COUNT"), value: .int(0)),
        ]),
        subscreens: [],
        content: MakeableStack(id: .init(), content: .value(ArrayValue(type: .base, elements: [
            MakeableButton(id: .init(), title: .text(.variable(named: "COUNT"), size: 120), style: .makeDefault(), action: .init(value: [
                AddToVarStep(varName: .string("COUNT"), value: .int(1)),
            ])),
        ])))
    )

    private static let currencyConverter: Screen = .init(
        id: .init(),
        name: "Currency Converter",
        initVariables: .makeDefault(),
        initActions: .init(value: [
            APIValueStep(url: .string("https://open.er-api.com/v6/latest/AUD")),
            DecodeDictionaryStep(value: .variable(named: "$0")),
            DictionaryValueForKeyStep(
                dictionary: .init(value: .variable(.named("$0"))), key: .string("rates")
            ),
            SetVarStep(varName: .string("JSON"), value: .variable(named: "$0")),
        ]),
        subscreens: [],
        content: .init(axis: .horizontal, [
            MakeableStack([
                MakeableLabel.withText("AUD", fontSize: 24, bold: true),
                MakeableField(
                    id: .init(), text: .init(initial: .string("123"), output: .named("AUD_VALUE")),
                    fontSize: .init(value: 48),
                    onTextUpdate: .init(value: []),
                    padding: .int(5),
                    alignment: .init(value: .center),
                    isMultiline: .false
                ),
            ]),
            MakeableStack([
                MakeableLabel.withText("="),
            ]),
            MakeableStack([
                MakeableField(
                    id: .init(), text: .init(initial: .string("THB"), output: .named("CURRENCY")),
                    fontSize: .init(value: 24),
                    onTextUpdate: .init(value: []),
                    padding: .int(5),
                    alignment: .init(value: .center),
                    isMultiline: .false
                ),
                MakeableLabel.text(NumericalOperationValue(
                    lhs: ResultValue(steps: .init(value: [
                        DictionaryValueForKeyStep(
                            dictionary: .init(value: .variable(.named("JSON"))),
                            key: .variable(named: "CURRENCY")
                        ),
                    ])).any,
                    rhs: ResultValue(steps: .init(value: [
                        GetNumberStep(value: .variable(named: "AUD_VALUE"), numberType: .init(value: .float)),
                    ])).any,
                    operation: .init(value: .mulitply)
                ).any, size: 48, isMultiline: .true),
            ]),
        ])
    )

    static let mappyBoy: Screen = .init(
        id: .init(), name: "Mappy Boy",
        initVariables: .makeDefault(),
        initActions: .init(value: []),
        subscreens: [],
        content: .init([
            MakeableField(
                id: .init(), text: .init(initial: .string("Australia"), output: .named("SEARCH")),
                fontSize: .int(16),
                onTextUpdate: .init(value: [
                    SetVarStep(varName: .string("URL"), value: .string("https://geocode.maps.co/search?api_key=668a52b5ea994476442246huq9acbec&q=")),
                    URLEncodeStep(value: .variable(named: "SEARCH")),
                    AddToVarStep(varName: .string("URL"), value: .variable(named: "$0")),
                    APIValueStep(url: .variable(named: "URL")),
                    DecodeArrayStep(value: .variable(.named("$0"))),
                    MapStep(value: .variable(.named("$0")), mapper: .init(value: [
                        DictionaryValueForKeyStep(dictionary: .variable(.named("$INPUT")), key: .string("lat")),
                        GetNumberStep(value: .variable(named: "$0"), numberType: .init(value: .float)),
                        SetVarStep(varName: .string("LAT"), value: .variable(named: "$0")),
                        DictionaryValueForKeyStep(dictionary: .variable(.named("$INPUT")), key: .string("lon")),
                        GetNumberStep(value: .variable(named: "$0"), numberType: .init(value: .float)),
                        SetVarStep(varName: .string("LNG"), value: .variable(named: "$0")),
                        DictionaryValueForKeyStep(dictionary: .variable(.named("$INPUT")), key: .string("display_name")),
                        SetVarStep(varName: .string("NAME"), value: .variable(named: "$0")),
                        StaticValueStep(value: .init(value: LocationValue(
                            name: .variable(.named("NAME")),
                            latitude: .variable(.named("LAT")),
                            longitude: .variable(.named("LNG"))
                        ))),
                    ])),
                    SetVarStep(varName: .string("LOCATIONS"), value: .variable(named: "$0")),
                ]),
                padding: .init(value: 5),
                alignment: .init(value: .center),
                isMultiline: .false
            ),
            MakeableMap(id: .init(), locations: .variable(.named("LOCATIONS")), zoomFollowsNewAnnotations: .true),
        ])
    )

    static let appNotes: Screen = .init(
        id: .init(),
        name: "App Notes",
        initVariables: .makeDefault(),
        initActions: .init(value: [
            GetSavedDataStep(key: .value(.init(value: "KEY"))),
            SetVarStep(varName: .string("FIELDTEXT"), value: .variable(named: "$0")),
        ]),
        subscreens: [],
        content: .init([
            MakeableLabel.text(.string("App Notes"), size: 36),
            MakeableField(
                id: .init(), text: .init(initial: .variable(named: "FIELDTEXT"), output: .named("FIELDTEXT")),
                fontSize: .int(16),
                onTextUpdate: .init(value: [
                    SaveDataStep(key: .value(.init(value: "KEY")), data: .variable(named: "FIELDTEXT")),
                ]),
                padding: .int(5),
                alignment: .init(value: .leading),
                isMultiline: .true
            ),
        ])
    )
}
