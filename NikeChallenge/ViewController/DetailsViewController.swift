//
//  DetailsViewController.swift
//  NikeChallenge
//
//  Created by Avellaneda on 4/6/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    let contentView = UIView()
    let detailsAlbumLabel = UILabel()
    let detailsArtistLabel = UILabel()
    let detailsArtImageView = UIImageView()
    let detailsGenreLabel = UILabel()
    let detailsReleaseDateLabel = UILabel()
    let detailsCopyrightLabel = UILabel()
    let detailsStoreButton = UIButton(frame: CGRect(x: 200, y: 200, width: 100, height: 200))
    
    static let identifier = "DetailsViewController"
    
    var viewModel: AlbumViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        configureViewController()
    }
    
    @objc func goToStore(sender: UIButton) {
        if let url = viewModel.url {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    func setupView() {
       
        detailsAlbumLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title1)
        detailsAlbumLabel.textAlignment = .center
        detailsAlbumLabel.numberOfLines = 0
        
        detailsArtistLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title2)
        detailsArtistLabel.textAlignment = .center
        detailsArtistLabel.numberOfLines = 0
        
        detailsGenreLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title3)
        detailsGenreLabel.textAlignment = .center
        
        detailsCopyrightLabel.textAlignment = .center
        detailsCopyrightLabel.numberOfLines = 0
        
        detailsReleaseDateLabel.textAlignment = .center
        
        detailsArtImageView.image = #imageLiteral(resourceName: "placeholdermusic")
        detailsArtImageView.contentMode = .scaleToFill
        
        detailsStoreButton.backgroundColor = .systemGreen
        detailsStoreButton.setTitle("Check Out On iTunes Store", for: .normal)
        detailsStoreButton.addTarget(self, action: #selector(goToStore), for: .touchUpInside)
        
        view.addSubview(contentView)
        //main ui view constraints
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -0).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0).isActive = true
        contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: -0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -0).isActive = true
        
        view.addSubview(detailsArtImageView)
        view.addSubview(detailsAlbumLabel)
        view.addSubview(detailsArtistLabel)
        view.addSubview(detailsGenreLabel)
        view.addSubview(detailsReleaseDateLabel)
        view.addSubview(detailsCopyrightLabel)
        view.addSubview(detailsStoreButton)
        
        //detail art image view constraints
        detailsArtImageView.translatesAutoresizingMaskIntoConstraints = false
        detailsArtImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -0).isActive = true
        detailsArtImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0).isActive = true
        detailsArtImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -0).isActive = true
        detailsArtImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        //details album label constraints
        detailsAlbumLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsAlbumLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -0).isActive = true
        detailsAlbumLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0).isActive = true
        detailsAlbumLabel.topAnchor.constraint(equalTo: detailsArtImageView.bottomAnchor, constant: 15).isActive = true
        //details artist label constraints
        detailsArtistLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsArtistLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -0).isActive = true
        detailsArtistLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0).isActive = true
        detailsArtistLabel.topAnchor.constraint(equalTo: detailsAlbumLabel.bottomAnchor, constant: 15).isActive = true
        //details genre label constraints
        detailsGenreLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsGenreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -0).isActive = true
        detailsGenreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0).isActive = true
        detailsGenreLabel.topAnchor.constraint(equalTo: detailsArtistLabel.bottomAnchor, constant: 15).isActive = true
        //details copyright label constraints
        detailsCopyrightLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsCopyrightLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -0).isActive = true
        detailsCopyrightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0).isActive = true
        detailsCopyrightLabel.topAnchor.constraint(equalTo: detailsGenreLabel.bottomAnchor, constant: 15).isActive = true
        //details releasedate lable constraints
        detailsReleaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsReleaseDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -0).isActive = true
        detailsReleaseDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0).isActive = true
        detailsReleaseDateLabel.topAnchor.constraint(equalTo: detailsCopyrightLabel.bottomAnchor, constant: 15).isActive = true
        //details store button constraints
        detailsStoreButton.translatesAutoresizingMaskIntoConstraints = false
        detailsStoreButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        contentView.trailingAnchor.constraint(equalTo: detailsStoreButton.trailingAnchor, constant: 20).isActive = true
        contentView.bottomAnchor.constraint(equalTo: detailsStoreButton.bottomAnchor, constant: 20).isActive = true
        
    }
    
    func configureViewController() {
        detailsAlbumLabel.text = viewModel.album.name
        detailsArtistLabel.text = viewModel.album.artistName
        detailsGenreLabel.text = viewModel.genres
        detailsReleaseDateLabel.text = viewModel.album.releaseDate
        detailsCopyrightLabel.text = viewModel.album.copyright
     
        detailsArtImageView.loadImage(at: viewModel.album.artworkUrl100)
    }

}
