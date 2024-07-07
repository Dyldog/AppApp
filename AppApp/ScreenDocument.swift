//
//  ScreenDocument.swift
//  AppApp
//
//  Created by Dylan Elliott on 18/12/2023.
//

import Armstrong
import SwiftUI
import UniformTypeIdentifiers

public extension UTType {
    static var screen: UTType { UTType(exportedAs: "com.dylan.AppAppScreen") }
    static var marqueeScreen: UTType { UTType(exportedAs: "com.dylan.AppAppMarqueeScreen") }
}

public struct ScreenDocument: FileDocument {
    public static var readableContentTypes: [UTType] { [.screen, .marqueeScreen] }

    public var screen: Screen

    public init(screen: Screen) {
        self.screen = screen
    }

    public init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents
        else {
            throw CocoaError(.fileReadCorruptFile)
        }

        screen = try JSONDecoder().decode(Screen.self, from: data)
    }

    public func fileWrapper(configuration _: WriteConfiguration) throws -> FileWrapper {
        return try FileWrapper(regularFileWithContents: JSONEncoder().encode(screen))
    }
}
