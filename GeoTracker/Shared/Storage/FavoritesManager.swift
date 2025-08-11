//
//  FavoritesManager.swift
//  GeoTracker
//
//  Created by iOS Developer on 07/08/25.
//

import Foundation

final class FavoritesManager{
    
    //MARK: - Static Constant & Array
    static let shared = FavoritesManager()
    private var favorites: [Country] = []
    
    //MARK: - Initializer
    init(){}
    
    //MARK: - Functions
    func addFavorites(_ country: Country){
        if !favorites.contains(where: { $0.name.common == country.name.common}){
            favorites.append(country)
        }
    }
    
    func removeFavorite(_ country: Country){
        favorites.removeAll { $0.name.common == country.name.common }
    }
    
    func getFavorites() -> [Country]{
        return favorites
    }
    
}
