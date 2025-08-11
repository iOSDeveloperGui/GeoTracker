//
//  FavoritesRouter.swift
//  GeoTracker
//
//  Created by iOS Developer on 08/08/25.
//

import Foundation
import UIKit

class FavoritesRouter{
    static func createModule() -> UIViewController{
        let view = FavoritesViewController()
        let presenter = FavoritesPresenter()
        let router = FavoritesRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        
        return view
    }
}
