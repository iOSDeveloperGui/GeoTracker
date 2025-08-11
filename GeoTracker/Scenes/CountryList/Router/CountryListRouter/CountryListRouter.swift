//
//  CountryListRouter.swift
//  GeoTracker
//
//  Created by iOS Developer on 30/07/25.
//

import Foundation
import UIKit

class CountryListRouter: RouterProtocol{
    
    //MARK: - CreateModule static func
    static func createModule() -> UIViewController {
        let view = ContryListViewController()
        let presenter = CountryListPresenter()
        let interactor = CountryListInteractor()
        let router = CountryListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    //MARK: - PresentCountryDetail
    func presentCountryDetail(from view: UIViewController, country: Country){
        let detailVC = CountryDetailRouter.createModule(with: country)
        if let sheet = detailVC.sheetPresentationController{
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true 
        }
        view.present(detailVC, animated: true)
    }
    
}
