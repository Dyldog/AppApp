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
    var zoomFollowsNewAnnotations: BoolValue
    
    var protoString: String { "TODO" }
    var valueString: String { "TODO" }
    
    init(locations: TypedValue<ArrayValue>, zoomFollowsNewAnnotations: BoolValue) {
        self.locations = locations
        self.zoomFollowsNewAnnotations = zoomFollowsNewAnnotations
    }
    
    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .locations: return TypedValue.value(ArrayValue(type: .location, elements: []))
        case .zoomFollowsNewAnnotations: return BoolValue(value: true)
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

struct Location: Identifiable, Hashable {
    var id: String { "\(coordinate.latitude)\(coordinate.longitude)" }
    let name: String
    let coordinate: CLLocationCoordinate2D
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(coordinate.latitude)
        hasher.combine(coordinate.longitude)
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
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
        Map(coordinateRegion: $region, annotationItems: locations) { place in
            MapAnnotation(coordinate: place.coordinate) {
                PlaceAnnotationView(title: place.name)
            }
        }.if(map.zoomFollowsNewAnnotations.value) {
            $0.onChange(of: locations) { _ in
                if !locations.isEmpty {
                    region = locations.map { $0.coordinate }.regionThatFits
                }
            }
        }.task(id: variables.hashValue) {
            do {
                let value = try await (try await map.locations.value(with: variables) as? ArrayValue)?.elements.asyncMap {
                    guard let location = $0 as? LocationValue else { throw VariableValueError.wrongTypeForOperation }
                    return Location(
                        name: (try await location.name.value(with: variables) as StringValue).value,
                        coordinate: .init(
                            latitude: Double((try await location.latitude.value(with: variables) as FloatValue).value),
                            longitude: Double((try await location.longitude.value(with: variables) as FloatValue).value)
                        )
                    )
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
