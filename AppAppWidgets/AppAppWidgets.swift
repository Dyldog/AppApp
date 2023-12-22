//
//  AppAppWidgets.swift
//  AppAppWidgets
//
//  Created by Dylan Elliott on 22/12/2023.
//

import WidgetKit
import SwiftUI
import Armstrong
import AppAppKit

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        .init(date: .now, configuration: .init())
    }
    
    func getSnapshot(for configuration: ScreenIntent, in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        completion(.init(date: .init(), configuration: configuration))
    }
    
    func getTimeline(for configuration: ScreenIntent, in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(.init(entries: [entry], policy: .atEnd))
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ScreenIntent
}

struct AppAppWidgetsEntryView : View {
    var entry: Provider.Entry
    var screen: Screen? {
        guard let name = entry.configuration.name else { return nil }
        return AppAppKit.shared.screen(named: name)
    }

    var body: some View {
        if let screen {
            ViewMakerView(viewModel: .init(scope: nil, screen: screen, makeMode: false, onUpdate: nil))
        } else {
            Text("ERROR: Couldn't find screen with name '\(entry.configuration.name ?? "")'")
        }
    }
}

struct AppAppWidgets: Widget {
    let kind: String = "AppAppWidgets"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ScreenIntent.self, provider: Provider()) { entry in
            AppAppWidgetsEntryView(entry: entry)
        }
    }
}

#Preview {
    AppAppWidgetsEntryView(entry: .init(date: .now, configuration: .init()))
}
