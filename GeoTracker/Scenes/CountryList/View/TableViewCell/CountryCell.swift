//
//  CountryCell.swift
//  GeoTracker
//
//  Created by iOS Developer on 31/07/25.
//

import UIKit

class CountryCell: UITableViewCell {
    //MARK: - Identifier
    static let identifier = "CountryCell"
    
    //MARK: - UIElements
    private lazy var flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - AddSubView function
    private func addSubViews(){
        contentView.addSubview(flagImageView)
        contentView.addSubview(nameLabel)
    }
    
    //MARK: - SetupConstraints function
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            flagImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            flagImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            flagImageView.widthAnchor.constraint(equalToConstant: 52),
            flagImageView.heightAnchor.constraint(equalToConstant: 32),
            
            nameLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
        ])
    }
    
    //MARK: - Configure function
    func configure(with country: Country){
        nameLabel.text = country.name.common
        if let url = URL(string: country.flags.png){
            loadImage(from: url)
        }
    }
    
    //MARK: - LoadImage function
    func loadImage(from url: URL){
        flagImageView.image = nil
        
        
        URLSession.shared.dataTask(with: url){ data, _, error in
            
            guard let data = data, error == nil else { return }
            
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.flagImageView.image = image
            }
            
        }.resume()
    }
    
}

