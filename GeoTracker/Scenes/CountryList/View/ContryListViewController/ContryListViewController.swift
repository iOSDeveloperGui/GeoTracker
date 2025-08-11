//
//  ContryListViewController.swift
//  GeoTracker
//
//  Created by iOS Developer on 30/07/25.
//

import Foundation
import UIKit

class ContryListViewController: UIViewController, CountryListViewProtocol{
    
    //MARK: - Reference & Countries array
    var presenter: CountryListPresenterProtocol?
    public var countries: [Country] = []
    public var filteredCountries: [Country] = []
    public var isSearching = false
    
    //MARK: - UILayers
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search Country"
        searchBar.delegate = self
        searchBar.sizeToFit()
        return searchBar
    }()
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.identifier)
        tableView.rowHeight = 60
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    //MARK: - AppLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupConstraints()
        setupUI()
        presenterViewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //MARK: - setupUI
    private func setupUI(){
        navigationItem.title = "Countries 🌍"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .black
        tableView.tableHeaderView = searchBar
    }
    
    //MARK: - AddSubViews
    private func addSubViews(){
        view.addSubview(tableView)
    }
    
    private func presenterViewDidLoad(){
        presenter?.viewDidLoad()
    }
    
    //MARK: - SetupConstraints
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
        
    //MARK: - Protocol functions
    func showCountries(_ countries: [Country]) {
        self.countries = countries.sorted { $0.name.common < $1.name.common }
        self.filteredCountries = countries
        tableView.reloadData()
    }
    
    func showError(_ error: Error) {
        print(CountryError.decodingError(error))
    }
    
    
}
