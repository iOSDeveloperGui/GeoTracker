//
//  CountryDetailRouter.swift
//  GeoTracker
//
//  Created by iOS Developer on 07/08/25.
//

import Foundation
import UIKit

class CountryDetailRouter{
    
    //MARK: - Static function
    static func createModule(with country: Country) -> UIViewController{
        let view = CountryDetailViewController()
        let interactor = CountryDetailInteractor(country: country)
        let presenter = CountryDetailPresenter(country: country, interactor: interactor)
        let router = CountryDetailRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        interactor.presenter = presenter 

        return view
    }
}
