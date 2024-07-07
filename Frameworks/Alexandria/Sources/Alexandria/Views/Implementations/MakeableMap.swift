//
//  MakeableMap.swift
//  AppApp
//
//  Created by Dylan Elliott on 9/12/2023.
//

import Armstrong
import DylKit
import MapKit
import SwiftUI

public final class MakeableMap: MakeableView {
    public static let categories: [ValueCategory] = [.views]
    public static var type: VariableType { .map }

    public let id: UUID

    public var locations: TypedValue<ArrayValue>
    public var zoomFollowsNewAnnotations: BoolValue

    public var protoString: String { "Map View" }
    public var valueString: String { protoString }

    public init(id: UUID, locations: TypedValue<ArrayValue>, zoomFollowsNewAnnotations: BoolValue) {
        self.id = id
        self.locations = locations
        self.zoomFollowsNewAnnotations = zoomFollowsNewAnnotations
    }

    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .locations: return TypedValue.value(ArrayValue(type: .location, elements: []))
        case .zoomFollowsNewAnnotations: return BoolValue(value: true)
        }
    }

    public func value(with _: Variables, and _: Scope) throws -> VariableValue {
        self
    }

    public func insertValues(into _: Variables, with _: Scope) throws {}

    public func add(_: VariableValue) throws -> VariableValue {
        fatalError()
    }
}

extension MakeableMap: CodeRepresentable {
    public var codeRepresentation: String { "" }
}

public struct Location: Identifiable, Hashable {
    public var id: String { "\(coordinate.latitude)\(coordinate.longitude)" }
    public let name: String
    public let coordinate: CLLocationCoordinate2D

    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(coordinate.latitude)
        hasher.combine(coordinate.longitude)
    }

    public static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}

public struct MakeableMapView: View {
    let isRunning: Bool
    let showEditControls: Bool
    let scope: Scope
    let map: MakeableMap
    let onContentUpdate: (MakeableMap) -> Void
    let onRuntimeUpdate: (@escaping Block) -> Void
    @EnvironmentObject var variables: Variables
    @Binding var error: VariableValueError?

//    @State var locations: [Location] = []

    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))

    public var body: some View {
        if isRunning {
            content
        } else {
            Text(map.protoString)
        }
    }

    private var content: some View {
        let variables = variables.copy()
        let locations: [Location] = `do` {
            try (map.locations.value(with: variables, and: scope) as? ArrayValue)?.elements.map {
                guard let location = $0 as? LocationValue else { throw VariableValueError.wrongTypeForOperation }
                return try Location(
                    name: (location.name.value(with: variables, and: scope) as StringValue).value,
                    coordinate: .init(
                        latitude: Double((location.latitude.value(with: variables, and: scope) as FloatValue).value),
                        longitude: Double((location.longitude.value(with: variables, and: scope) as FloatValue).value)
                    )
                )
            } ?? []
        } onError: {
            self.handleError($0)
            return []
        }

//        if !locations.isEmpty {
//            region = locations.map { $0.coordinate }.regionThatFits
//        }

        return Map(coordinateRegion: $region, annotationItems: locations) { place in
            MapAnnotation(coordinate: place.coordinate) {
                PlaceAnnotationView(title: place.name)
            }
        }.onAppear {
            if !locations.isEmpty {
                region = locations.map { $0.coordinate }.regionThatFits
            }
        }
//        .task(id: variables.hashValue) {
//            do {
//                let value = try (try map.locations.value(with: variables, and: scope) as? ArrayValue)?.elements.map {
//                    guard let location = $0 as? LocationValue else { throw VariableValueError.wrongTypeForOperation }
//                    return Location(
//                        name: (try location.name.value(with: variables, and: scope) as StringValue).value,
//                        coordinate: .init(
//                            latitude: Double((try location.latitude.value(with: variables, and: scope) as FloatValue).value),
//                            longitude: Double((try location.longitude.value(with: variables, and: scope) as FloatValue).value)
//                        )
//                    )
//                }
//                self.locations = value ?? []
//            } catch let error as VariableValueError {
//                self.error = error
//            } catch {
//                fatalError(error.localizedDescription)
//            }
//        }
    }

    private func handleError(_ error: Error) {
        if let error = error as? VariableValueError {
            self.error = error
        } else {
            print(error.localizedDescription)
        }
    }
}

struct PlaceAnnotationView: View {
    let title: String

    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
                .font(.footnote)
                .padding(5)
                .background(Color(.white))
                .cornerRadius(10)

            Image(systemName: "mappin.circle.fill")
                .font(.title)
                .foregroundColor(.red)

            Image(systemName: "arrowtriangle.down.fill")
                .font(.caption)
                .foregroundColor(.red)
                .offset(x: 0, y: -5)
        }
        .frame(maxWidth: 200)
    }
}
