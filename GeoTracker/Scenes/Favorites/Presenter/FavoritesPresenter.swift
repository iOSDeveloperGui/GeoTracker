//
//  FavoritesPresenter.swift
//  GeoTracker
//
//  Created by iOS Developer on 08/08/25.
//

import Foundation

class FavoritesPresenter{
    //MARK: - References
    weak var view: FavoritesViewProtocol?
    var router: FavoritesRouter?
    
    func viewWillAppear(){
        let favorites = FavoritesManager.shared.getFavorites()
        view?.showFavorites(favorites)
    }
}
