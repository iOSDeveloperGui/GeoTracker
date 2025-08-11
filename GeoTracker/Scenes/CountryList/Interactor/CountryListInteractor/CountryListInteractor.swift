//
//  CountryListInteractor.swift
//  GeoTracker
//
//  Created by iOS Developer on 30/07/25.
//

import Foundation
import UIKit

class CountryListInteractor: CountryListInteractorProtocol{
    
    //MARK: - WeakReference
    weak var presenter: CountryListPresenterProtocol?
    
    //MARK: - FetchCountries function
    func fetchCountries(){
        NetworkManager.shared.fetchCountries{ [weak self] result in
            DispatchQueue.main.async{
                switch result{
                case .success(let countries):
                    self?.presenter?.didFetchCountries(countries)
                case .failure(let error):
                    self?.presenter?.didFailFetching(error: error)
                }
            }
        }
    }
    
    //MARK: - FetchFlagImage Function
    func fetchFlagImage(from url: URL, completion: @escaping (UIImage?) -> Void){
        
    }
    
    
    
}
