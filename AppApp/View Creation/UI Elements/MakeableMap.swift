//
//  MakeableMap.swift
//  AppApp
//
//  Created by Dylan Elliott on 9/12/2023.
//

import SwiftUI
import MapKit

final class MakeableMap: MakeableView {
    
    static var type: VariableType { .map }
    
    var locations: TypedValue<ArrayValue>
    
    var protoString: String { "TODO" }
    var valueString: String { "TODO" }
    
    init(locations: TypedValue<ArrayValue>) {
        self.locations = locations
    }
    
    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .locations: return TypedValue.value(ArrayValue(type: .location, elements: []))
        }
    }
    
    func value(with variables: Variables) async throws -> VariableValue {
        self
    }
    
    func insertValues(into variables: Variables) async throws {
        
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
}

extension MakeableMap: CodeRepresentable {
    var codeRepresentation: String { "" }
}

struct Location: Identifiable {
    var id: String { "\(coordinate.latitude)\(coordinate.longitude)" }
    let coordinate: CLLocationCoordinate2D
}

struct MakeableMapView: View {
    let isRunning: Bool
    let showEditControls: Bool
    let map: MakeableMap
    let onContentUpdate: (MakeableMap) -> Void
    let onRuntimeUpdate: () -> Void
    @EnvironmentObject var variables: Variables
    @Binding var error: VariableValueError?
    
    @State var locations: [Location] = []
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) {
            MapMarker(coordinate: $0.coordinate)
        }.task(id: variables.hashValue) {
            do {
                let value = try await (try await map.locations.value(with: variables) as? ArrayValue)?.elements.asyncMap {
                    guard let location = $0 as? LocationValue else { throw VariableValueError.wrongTypeForOperation }
                    return Location(coordinate: .init(
                        latitude: Double((try await location.latitude.value(with: variables) as FloatValue).value),
                        longitude: Double((try await location.longitude.value(with: variables) as FloatValue).value)
                    ))
                }
                self.locations = value ?? []
            } catch let error as VariableValueError {
                self.error = error
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
}
