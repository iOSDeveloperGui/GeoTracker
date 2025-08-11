//
//  CountryListViewProtocol.swift
//  GeoTracker
//
//  Created by iOS Developer on 30/07/25.
//

import Foundation

protocol CountryListViewProtocol: AnyObject{
    func showCountries(_ countries: [Country])
    func showError(_ error: Error)
}
