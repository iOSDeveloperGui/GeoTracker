//
//  CountryDetailInteractorProtocol.swift
//  GeoTracker
//
//  Created by iOS Developer on 06/08/25.
//

import Foundation
import UIKit

protocol CountryDetailInteractorInputProtocol: AnyObject{
    func fetchFlagImage(from urlString: String)
}

protocol CountryDetailInteractorOutputProtocol: AnyObject{
    func didFetchFlag(_ image: UIImage?)
}
