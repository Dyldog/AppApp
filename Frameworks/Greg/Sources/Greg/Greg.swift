// The Swift Programming Language
// https://docs.swift.org/swift-book

import Armstrong
import Alexandria

extension Greg {
    private static let binNight: Screen = .init(
        id: .init(),
        name: "Bin Night",
        initVariables: .makeDefault(),
        initActions: .init(value: [
            GetCurrentDateStep(),
            GetDateComponentStep(component: .init(value: .weekOfYear), date: .variable(.named("$0"))),
            IfStep(
                ifAction: .init(
                    ifCondition: .init(
                        lhs: NumericalOperationValue(
                            lhs: .variable(named: "$0"),
                            rhs: .int(2),
                            operation: .init(value: .mod)
                        ).any,
                        rhs: .int(0),
                        comparison: .init(value: .equals)
                    ),
                    ifSteps: .init(value: [
                        SetVarStep(varName: .string("NIGHT"), value: .string("RECYCLING"))
                    ])
                ),
                elseAction: .init(value: [
                    SetVarStep(varName: .string("NIGHT"), value: .string("GREEN WASTE"))
                ])
            )
        ]),
        subscreens: [],
        content: .init([
            MakeableLabel(
                id: .init(),
                text: .variable(named: "NIGHT"),
                fontSize: .int(36),
                fontWeight: .init(value: .bold),
                italic: .false,
                base: .makeDefault(),
                textColor: .init(value: .black),
                isMultiline: .false
            )
        ]))
    public static var demoScreens: [Screen] { [binNight] }
}

