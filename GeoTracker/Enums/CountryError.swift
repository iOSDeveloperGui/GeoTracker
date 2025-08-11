//
//  CountryError.swift
//  GeoTracker
//
//  Created by iOS Developer on 29/07/25.
//

import Foundation

enum CountryError: Error{
    case invalidURL
    case noData
    case decodingError(Error)
    case networkError(Error)
    
    var response: String{
        switch self{
        case .invalidURL:
            return "The country data URL is invalid. Please contact support."
        case .noData:
            return "No country data found. Please try again later."
        case .decodingError(let error):
            return "Failed to process country data. (\(error.localizedDescription))"
        case .networkError(let error):
            return "A network error occurred: \(error.localizedDescription). Please check your internet connection."
        }
    }
}
