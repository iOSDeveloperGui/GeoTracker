//
//  CountryViewControllerExtension.swift
//  GeoTracker
//
//  Created by iOS Developer on 30/07/25.
//

import Foundation
import UIKit

extension ContryListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredCountries.count : countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.identifier, for: indexPath) as? CountryCell else{
            return UITableViewCell()
        }
        let country = isSearching ? filteredCountries[indexPath.row] : countries[indexPath.row]
        cell.configure(with: country)
        return cell 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = isSearching ? filteredCountries[indexPath.row] : countries[indexPath.row]
        presenter?.didSelectCountry(selectedCountry)
    }
    
}

extension ContryListViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            isSearching = false
            filteredCountries = countries
        } else{
            isSearching = true
            filteredCountries = countries.filter{ $0.name.common.lowercased().contains(searchText.lowercased())}
        }
        tableView.reloadData()
        
    }
}
