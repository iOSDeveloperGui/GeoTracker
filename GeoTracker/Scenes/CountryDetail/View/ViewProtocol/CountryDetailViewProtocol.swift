//
//  CountryDetailViewProtocol.swift
//  GeoTracker
//
//  Created by iOS Developer on 07/08/25.
//

import Foundation
import UIKit

protocol CountryDetailViewProtocol: AnyObject{
    func showCountry(_ country: Country)
    func showFlagImage(_ image: UIImage?)
}
