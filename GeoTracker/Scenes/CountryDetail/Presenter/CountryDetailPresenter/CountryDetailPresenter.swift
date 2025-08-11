//
//  CountryDetailPresenter.swift
//  GeoTracker
//
//  Created by iOS Developer on 06/08/25.
//

import Foundation
import UIKit

class CountryDetailPresenter: CountryDetailPresenterProtocol, CountryDetailInteractorOutputProtocol{
    
    weak var view: CountryDetailViewProtocol?
    var router: CountryDetailRouter?
    private var country: Country
    private var interactor: CountryDetailInteractorInputProtocol
    
    //MARK: - Initializer
    init(country: Country, interactor: CountryDetailInteractorInputProtocol){
        self.country = country
        self.interactor = interactor
    }
    
    //MARK: - functions
    func viewDidLoad() {
        view?.showCountry(country)
        interactor.fetchFlagImage(from: country.flags.png)
    }
    
    //MARK: - DidFetchFlag
    func didFetchFlag(_ image: UIImage?) {
        view?.showFlagImage(image)
    }
    
    //MARK: - DidTapFavorite
    func didTapFavorite(){
        FavoritesManager.shared.addFavorites(country)
    }
}
