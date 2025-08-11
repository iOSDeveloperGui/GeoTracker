//
//  CountryModel.swift
//  GeoTracker
//
//  Created by iOS Developer on 29/07/25.
//

import Foundation

struct Country: Decodable{
    let name: Name
    let capital: [String]?
    let region: String
    let population: Int
    let area: Double?
    let languages: [String: String]?
    let flags: Flag
    let latlng: [Double]?
}

struct Name: Decodable{
    let common: String
}

struct Flag: Decodable{
    let png: String
}
