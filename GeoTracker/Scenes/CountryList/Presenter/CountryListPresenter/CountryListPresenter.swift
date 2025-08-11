//
//  CountryListPresenter.swift
//  GeoTracker
//
//  Created by iOS Developer on 30/07/25.
//

import Foundation
import UIKit

class CountryListPresenter: CountryListPresenterProtocol{
    //MARK: - References
    weak var view: CountryListViewProtocol?
    var interactor: CountryListInteractorProtocol?
    var router: RouterProtocol?
    
    //MARK: - Functions
    func viewDidLoad() {
        interactor?.fetchCountries()
    }
    
    func didFetchCountries(_ countries: [Country]) {
        view?.showCountries(countries)
    }
    
    func didFailFetching(error: Error) {
        view?.showError(error)
    }
    
    
    func didSelectCountry(_ country: Country) {
        if let viewController = view as? UIViewController{
            router?.presentCountryDetail(from: viewController, country: country)
        }
    }

}
