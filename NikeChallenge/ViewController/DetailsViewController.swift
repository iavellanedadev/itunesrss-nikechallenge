//
//  DetailsViewController.swift
//  NikeChallenge
//
//  Created by Consultant on 4/6/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    let detailsAlbumLabel = UILabel()
    let detailsArtistLabel = UILabel()
    let detailsArtImageView = UIImageView()
    
    static let identifier = "DetailsViewController"
    
    var album: Album!
    var imgCache: NSCache<NSString, AnyObject>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
      
    }
    
    func setupView() {
        detailsArtImageView.image = #imageLiteral(resourceName: "placeholdermusic")
        view.backgroundColor = .green
        let contentView = UIView()
        view.addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let mainViewMargins = view.layoutMarginsGuide
        
        contentView.topAnchor.constraint(equalTo: mainViewMargins.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: mainViewMargins.bottomAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: mainViewMargins.trailingAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: mainViewMargins.leadingAnchor).isActive = true
        
        view.addSubview(detailsArtImageView)
        view.addSubview(detailsArtistLabel)
        
        //detail art image view constraints
        detailsArtImageView.translatesAutoresizingMaskIntoConstraints = false
        detailsArtImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        detailsArtImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 15).isActive = true
        detailsArtImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        detailsArtImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        //details artist label constraints
        detailsArtistLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureViewController() {
        detailsAlbumLabel.text = album.name
        
        if let cachedImage = imgCache.object(forKey:
            NSString(string: album.artworkUrl100)) as? UIImage {
            detailsArtImageView.image = cachedImage
        }
    }

}
