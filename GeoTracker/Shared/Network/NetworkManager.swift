//
//  NetworkManager.swift
//  GeoTracker
//
//  Created by iOS Developer on 29/07/25.
//

import Foundation

class NetworkManager{
    //MARK: - Static constant
    static let shared = NetworkManager()
    
    //MARK: - Initializer
    private init(){}
    
    //MARK: - FetchCountries Function
    func fetchCountries(completion: @escaping ( Result<[Country], Error>) -> Void){
        guard let url = URL(string: "https://restcountries.com/v3.1/all?fields=name,capital,region,population,area,languages,flags,latlng") else {
            completion(.failure(CountryError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            if let error = error{
                completion(.failure(CountryError.networkError(error)));
                return
            }
            
            guard let data = data else {
                completion(.failure(CountryError.noData))
                return
            }
            
            do{
                let countries = try JSONDecoder().decode([Country].self, from: data)
                completion(.success(countries))
            } catch{
                completion(.failure(error))
            }
        }.resume()
    }
    
    
}
