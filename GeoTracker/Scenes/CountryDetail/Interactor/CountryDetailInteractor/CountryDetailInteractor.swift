//
//  CountryDetailInteractor.swift
//  GeoTracker
//
//  Created by iOS Developer on 06/08/25.
//

import Foundation
import UIKit

final class CountryDetailInteractor: CountryDetailInteractorInputProtocol{
    
    //MARK: - References
    weak var presenter: CountryDetailInteractorOutputProtocol?
    private let country: Country
    
    //MARK: - Initializer
    init(country: Country){
        self.country = country
    }
    
    func fetchCountryDetail() {
        
    }
    
    func fetchFlagImage(from urlString: String) {
        guard let url = URL(string: urlString) else{
            presenter?.didFetchFlag(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url){ data, _, _ in
            let image = data.flatMap { UIImage(data: $0) }
            DispatchQueue.main.async {
                self.presenter?.didFetchFlag(image)
            }
        }.resume()
    }
    
    
}
