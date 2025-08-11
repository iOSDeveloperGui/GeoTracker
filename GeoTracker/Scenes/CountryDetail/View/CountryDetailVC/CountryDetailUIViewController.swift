//
//  CountryDetailUIViewController.swift
//  GeoTracker
//
//  Created by iOS Developer on 06/08/25.
//

import UIKit

class CountryDetailViewController: UIViewController, CountryDetailViewProtocol {
    
    //MARK: - References
    var presenter: CountryDetailPresenter?
    
    //MARK: - UIElements
    private lazy var flagImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var capitalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var populationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add to Favorites", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(favoriteTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - AppLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubViews()
        setupConstraints()
        presenterViewDidLoad()
    }
    
    //MARK: - AddSubViews
    private func addSubViews(){
        view.addSubview(flagImageView)
        view.addSubview(nameLabel)
        view.addSubview(capitalLabel)
        view.addSubview(populationLabel)
        view.addSubview(favoriteButton)
    }
    
    //MARK: - SetupConstraints
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            flagImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            flagImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            flagImageView.widthAnchor.constraint(equalToConstant: 120),
            flagImageView.heightAnchor.constraint(equalToConstant: 80),
            
            nameLabel.topAnchor.constraint(equalTo: flagImageView.bottomAnchor, constant: 16),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            capitalLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            capitalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            populationLabel.topAnchor.constraint(equalTo: capitalLabel.bottomAnchor, constant: 16),
            populationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            favoriteButton.topAnchor.constraint(equalTo: populationLabel.bottomAnchor, constant: 20),
            favoriteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            favoriteButton.widthAnchor.constraint(equalToConstant: 200),
            favoriteButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    //MARK: - PresenterViewDidLoad function
    func presenterViewDidLoad(){
        presenter?.viewDidLoad()
    }
    
    //MARK: - Implementing protocol
    func showCountry(_ country: Country) {
        nameLabel.text = country.name.common
        capitalLabel.text = "Capital: \(country.capital?.first ?? "N/A")"
        populationLabel.text = "Population: \(country.population)"
    }
    
    func showFlagImage(_ image: UIImage?) {
        flagImageView.image = image
    }
    
    
    //MARK: - Button function 
    @objc private func favoriteTapped() {
        presenter?.didTapFavorite()
        showCountryAlertAdded()
    }
    
    //MARK: - ShowCountryAlertAdded
    private func showCountryAlertAdded(){
        let alert = UIAlertController(title: "Success", message: "The country was added successfully!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}

