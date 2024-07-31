//
//  Location.swift
//  Map
//
//  Created by Gabriel Marin on 26.07.2024.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    var id: String {
        name + cityName
    }
        
        static func defaultLocation() -> Location {
            return Location(name: "Romania", cityName: "Bucharest", coordinates: CLLocationCoordinate2D(latitude: 44.439663, longitude: 26.096306), description: "Cap Romania", imageNames: ["paris-louvre-3"] , link: "https://en.wikipedia.org/wiki/Bucharest")
        }
        
    }

