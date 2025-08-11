//
//  FavoritesViewController.swift
//  GeoTracker
//
//  Created by iOS Developer on 08/08/25.
//

import UIKit

class FavoritesViewController: UIViewController, FavoritesViewProtocol {
    //MARK: - Reference & Array
    var presenter: FavoritesPresenter?
    public var favorites: [Country] = []
    
    //MARK: - UIElements
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.identifier)
        tableView.rowHeight = 60
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - AppLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
    
    //MARK: - AddSubViews
    private func addSubViews(){
        view.addSubview(tableView)
    }
    

    //MARK: - SetupUI
    private func setupUI(){
        view.backgroundColor = .systemBackground
        navigationItem.title = "Favorites"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func showFavorites(_ favorites: [Country]) {
        self.favorites = favorites
        tableView.reloadData()
    }
}
