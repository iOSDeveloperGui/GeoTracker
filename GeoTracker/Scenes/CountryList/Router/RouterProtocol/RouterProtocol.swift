//
//  CountryListRouterProtocol.swift
//  GeoTracker
//
//  Created by iOS Developer on 30/07/25.
//

import Foundation
import UIKit

protocol RouterProtocol: AnyObject{
    static func createModule() -> UIViewController
    func presentCountryDetail(from view: UIViewController, country: Country)
}
