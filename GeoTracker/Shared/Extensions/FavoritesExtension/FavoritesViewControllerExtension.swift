//
//  FavoritesViewControllerExtension.swift
//  GeoTracker
//
//  Created by iOS Developer on 08/08/25.
//

import Foundation
import UIKit

extension FavoritesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.identifier, for: indexPath) as? CountryCell else{
            return UITableViewCell()
        }
        let country = favorites[indexPath.row]
        cell.configure(with: country)
        return cell
    }
    
    
}
