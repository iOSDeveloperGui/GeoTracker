//
//  CountryListPresenterProtocol.swift
//  GeoTracker
//
//  Created by iOS Developer on 30/07/25.
//

import Foundation
import UIKit

protocol CountryListPresenterProtocol: AnyObject{
    func viewDidLoad()
    func didFetchCountries(_ countries: [Country])
    func didFailFetching(error: Error)
    func didSelectCountry(_ country: Country)
}
