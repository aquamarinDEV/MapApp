//
//  LocationView.swift
//  Map
//
//  Created by Gabriel Marin on 26.07.2024.
//

import SwiftUI
import MapKit

class LocationsViewModel: ObservableObject {
    
    //All loaded locations
    @Published var location: [Location]
    //Current location on Map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.location = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location:Location) {
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan
            )
        }
    }
}
        


struct LocationView: View {
    
        @StateObject private var vm = LocationsViewModel()
        
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
        }
    }
}
#Preview {
    LocationView()
}
