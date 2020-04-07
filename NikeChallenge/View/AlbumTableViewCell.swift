//
//  AlbumTableViewCell.swift
//  NikeChallenge
//
//  Created by Consultant on 4/3/20.
//  Copyright © 2020 Consultant. All rights reserved.
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
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellView() {
        let contentHeightAnchor = contentView.heightAnchor.constraint(equalToConstant: 200)
        
        contentHeightAnchor.priority = UILayoutPriority(rawValue: 750)
        contentHeightAnchor.isActive = true
        
        albumArtImageView.contentMode = .scaleToFill
        albumNameLabel.font = UIFont.systemFont(ofSize: 24)
        albumNameLabel.numberOfLines = 0
        albumArtistLabel.numberOfLines = 0
        let completeView = UIView()
        completeView.clipsToBounds = true
        completeView.layer.cornerRadius = 1
        contentView.addSubview(completeView)
        
        //add constraints to completeView
        let margins = contentView.layoutMarginsGuide
        
        completeView.translatesAutoresizingMaskIntoConstraints = false
        completeView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        completeView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        completeView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        completeView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        
        let verticalStackView = UIStackView()
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .equalSpacing
        verticalStackView.spacing = 10
        verticalStackView.addArrangedSubview(albumNameLabel)
        verticalStackView.addArrangedSubview(albumArtistLabel)
     
                
        let horizontalStackView = UIStackView()
        
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fill
        horizontalStackView.alignment = .center
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(albumArtImageView)
        
        //vertical stack constraints
        verticalStackView.topAnchor.constraint(equalTo: horizontalStackView.topAnchor, constant: 10).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: horizontalStackView.leadingAnchor).isActive = true
        
        //add image constraints
        albumArtImageView.translatesAutoresizingMaskIntoConstraints = false
        albumArtImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        albumArtImageView.widthAnchor.constraint(equalToConstant: 175).isActive = true
        albumArtImageView.topAnchor.constraint(equalTo: horizontalStackView.topAnchor, constant: 10).isActive = true
        let albumTrailingAnchor = albumArtImageView.trailingAnchor.constraint(equalTo: horizontalStackView.trailingAnchor, constant: 10)
        albumTrailingAnchor.priority = UILayoutPriority(rawValue: 750)
        albumTrailingAnchor.isActive = true
        
        completeView.addSubview(horizontalStackView)
        //horizontal stack constraints
        horizontalStackView.leadingAnchor.constraint(equalTo: completeView.leadingAnchor, constant: 10).isActive = true
        horizontalStackView.trailingAnchor.constraint(equalTo: completeView.trailingAnchor, constant: 10).isActive = true
        horizontalStackView.topAnchor.constraint(equalTo: completeView.topAnchor, constant: 10).isActive = true
    }
    
    func configureCellWith(albumName: String, artistName: String, artworkUrl: String, imgCache: NSCache<NSString, AnyObject>) {
            self.albumNameLabel.text = albumName
            self.albumArtistLabel.text = artistName
        
            if let cachedImage = imgCache.object(forKey:
                NSString(string: artworkUrl)) as? UIImage {
                albumArtImageView.image = cachedImage
            }else{
                guard let imageUrl = URL(string: artworkUrl) else {return}
                
                imageUrl.getImage{ [weak self] img in
                    guard let image = img else {return}
                    imgCache.setObject(image, forKey: NSString(string: artworkUrl))

                    self?.albumArtImageView.image = image
                    
                }
            }


        
        
            
       
    }
}