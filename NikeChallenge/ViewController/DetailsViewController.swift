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
    let albumLabel = UILabel()
    let artistLabel = UILabel()
    let artImageView = UIImageView()
    let genreLabel = UILabel()
    let releaseDateLabel = UILabel()
    let copyrightLabel = UILabel()
    let storeButton = UIButton(frame: CGRect(x: 200, y: 200, width: 100, height: 200))
    
    static let identifier = "DetailsViewController"
    
    var viewModel: AlbumViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        configureViewController()
    }
    
    /**
     Objective-C Selector function for external link opening

     Calling this method takes the `viewmodel.url` to externally open a url/link using safari

     - Parameter sender: the button that calls the function
     */
    @objc func goToStore(sender: UIButton) {
        if let url = viewModel.url {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    /**
     setups our View and Constraints for this view we're in

     Calling this method on viewDidLoad to ensure our UI is approprately set up and Auto Layout is correct
     */
    func setupView() {
        view.backgroundColor = .white
        
        albumLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title1)
        albumLabel.textAlignment = .center
        albumLabel.numberOfLines = 0
        
        artistLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title2)
        artistLabel.textAlignment = .center
        artistLabel.numberOfLines = 0
        
        genreLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title3)
        genreLabel.textAlignment = .center
        
        copyrightLabel.textAlignment = .center
        copyrightLabel.numberOfLines = 0
        
        releaseDateLabel.textAlignment = .center
        
        artImageView.image = #imageLiteral(resourceName: "placeholdermusic")
        artImageView.contentMode = .scaleToFill
        
        let attributedText = NSAttributedString(string: NSLocalizedString("Check Out On iTunes Store", comment: "open iTunes store text"),attributes: Text.attributes(.white, font: .boldSystemFont(ofSize: 18)))
        
        storeButton.backgroundColor = .systemGreen
        storeButton.layer.cornerRadius = 20
        storeButton.setAttributedTitle(attributedText, for: .normal)
        storeButton.addTarget(self, action: #selector(goToStore), for: .touchUpInside)
        
        view.addSubview(contentView)
        //main ui view constraints
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        view.addSubview(artImageView)
        view.addSubview(albumLabel)
        view.addSubview(artistLabel)
        view.addSubview(genreLabel)
        view.addSubview(releaseDateLabel)
        view.addSubview(copyrightLabel)
        view.addSubview(storeButton)
        
        //detail art image view constraints
        artImageView.translatesAutoresizingMaskIntoConstraints = false
        artImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        contentView.trailingAnchor.constraint(equalTo: artImageView.trailingAnchor, constant: 0).isActive = true
        artImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        artImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        //details album label constraints
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        albumLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        contentView.trailingAnchor.constraint(equalTo: albumLabel.trailingAnchor, constant: 8).isActive = true
        albumLabel.topAnchor.constraint(equalTo: artImageView.bottomAnchor, constant: 16).isActive = true
        
        //details artist label constraints
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        contentView.trailingAnchor.constraint(equalTo: artistLabel.trailingAnchor, constant: 8).isActive = true
        artistLabel.topAnchor.constraint(equalTo: albumLabel.bottomAnchor, constant: 16).isActive = true
        
        //details genre label constraints
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        contentView.trailingAnchor.constraint(equalTo: genreLabel.trailingAnchor, constant: 8).isActive = true
        genreLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 16).isActive = true
        
        //details copyright label constraints
        copyrightLabel.translatesAutoresizingMaskIntoConstraints = false
        copyrightLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        contentView.trailingAnchor.constraint(equalTo: copyrightLabel.trailingAnchor, constant: 8).isActive = true
        copyrightLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 8).isActive = true
        
        //details releasedate lable constraints
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        contentView.trailingAnchor.constraint(equalTo: releaseDateLabel.trailingAnchor, constant: 8).isActive = true
        releaseDateLabel.topAnchor.constraint(equalTo: copyrightLabel.bottomAnchor, constant: 8).isActive = true
        
        //details store button constraints
        storeButton.translatesAutoresizingMaskIntoConstraints = false
        storeButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        storeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        contentView.trailingAnchor.constraint(equalTo: storeButton.trailingAnchor, constant: 20).isActive = true
        contentView.bottomAnchor.constraint(equalTo: storeButton.bottomAnchor, constant: 20).isActive = true
        
    }
    
    /**
     Configure the viewController's UI elements with the appropriate data

     Calling this method sets the UI elements with the appropriate data from our `viewModel`
     */
    func configureViewController() {
        albumLabel.text = viewModel.album.name
        artistLabel.text = viewModel.album.artistName
        genreLabel.text = viewModel.genres
        releaseDateLabel.text = viewModel.album.releaseDate
        copyrightLabel.text = viewModel.album.copyright
     
        artImageView.loadImage(at: viewModel.album.artworkUrl100)
    }

}
