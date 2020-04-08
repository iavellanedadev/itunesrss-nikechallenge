//
//  AlbumTableViewCell.swift
//  NikeChallenge
//
//  Created by Avellaneda on 4/3/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    let albumNameLabel = UILabel()
    let albumArtistLabel = UILabel()
    let albumArtImageView = UIImageView()
    
    static let identifier = "AlbumTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        
        setupCellView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented, please use initWithStyle:andReuseIdentifier")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        albumArtImageView.image = #imageLiteral(resourceName: "placeholdermusic")
        albumArtImageView.cancelImageLoad()
    }
    
    func setupCellView() {
        let contentHeightAnchor = contentView.heightAnchor.constraint(equalToConstant: 200)
        
        contentHeightAnchor.priority = UILayoutPriority(rawValue: 750)
        contentHeightAnchor.isActive = true

        albumArtImageView.contentMode = .scaleToFill
        
        albumNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        albumNameLabel.numberOfLines = 0
        albumNameLabel.textAlignment = .center
        albumNameLabel.adjustsFontSizeToFitWidth = true
        albumNameLabel.minimumScaleFactor = 0.75
        
        albumArtistLabel.font = UIFont.boldSystemFont(ofSize: 16)
        albumArtistLabel.numberOfLines = 0
        albumArtistLabel.textAlignment = .center
        
        let completeView = UIView()
        completeView.clipsToBounds = true
        completeView.layer.cornerRadius = 1
        contentView.addSubview(completeView)
        
        let verticalStackView = UIStackView()
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .center
        verticalStackView.distribution = .fillEqually
        verticalStackView.addArrangedSubview(albumNameLabel)
        verticalStackView.addArrangedSubview(albumArtistLabel)
                
        let horizontalStackView = UIStackView()
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fill
        horizontalStackView.alignment = .center
        horizontalStackView.spacing = 16
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(albumArtImageView)
        
        //add constraints to completeView
        let margins = contentView.layoutMarginsGuide
        completeView.translatesAutoresizingMaskIntoConstraints = false
        completeView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        completeView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        completeView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        completeView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        
        //vertical stack constraints
        verticalStackView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: horizontalStackView.leadingAnchor).isActive = true
        verticalStackView.centerYAnchor.constraint(equalTo: horizontalStackView.centerYAnchor, constant: 0).isActive = true
        
        //add image constraints
        albumArtImageView.translatesAutoresizingMaskIntoConstraints = false
        albumArtImageView.trailingAnchor.constraint(equalTo: horizontalStackView.trailingAnchor, constant: 0).isActive = true
        albumArtImageView.topAnchor.constraint(equalTo: horizontalStackView.topAnchor, constant: 10).isActive = true
        albumArtImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        albumArtImageView.widthAnchor.constraint(equalToConstant: 175).isActive = true

        completeView.addSubview(horizontalStackView)
        
        //horizontal stack constraints
        horizontalStackView.leadingAnchor.constraint(equalTo: completeView.leadingAnchor, constant: 0).isActive = true
        horizontalStackView.trailingAnchor.constraint(equalTo: completeView.trailingAnchor, constant: 0).isActive = true
        horizontalStackView.topAnchor.constraint(equalTo: completeView.topAnchor, constant: 10).isActive = true
    }
    
    func configureCellWith(albumName: String, artistName: String, artworkUrl: String) {
        self.albumNameLabel.text = albumName
        self.albumArtistLabel.text = artistName
        self.albumArtImageView.loadImage(at: artworkUrl)
    }
}
