//
//  CountryListInteractorProtocol.swift
//  GeoTracker
//
//  Created by iOS Developer on 30/07/25.
//

import Foundation
import UIKit

protocol CountryListInteractorProtocol: AnyObject{
    func fetchCountries()
    func fetchFlagImage(from url: URL, completion: @escaping (UIImage?) -> Void)
}
