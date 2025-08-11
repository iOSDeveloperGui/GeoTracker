//
//  CountryDetailPresenterProtocol.swift
//  GeoTracker
//
//  Created by iOS Developer on 06/08/25.
//

import Foundation
import UIKit

protocol CountryDetailPresenterProtocol: AnyObject{
    func viewDidLoad()
    func didTapFavorite()
    func didFetchFlag(_ image: UIImage?)
}
