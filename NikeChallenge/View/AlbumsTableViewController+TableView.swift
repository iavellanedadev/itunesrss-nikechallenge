//
//  AlbumsTableViewController+TableView.swift
//  NikeChallenge
//
//  Created by Consultant on 4/7/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import Foundation
import UIKit

extension AlbumsTableViewController: UITableViewDelegate
{
    //MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailsViewController = DetailsViewController()
        let album: Album = viewModel.albums[indexPath.row]
        viewModel.album = album
        detailsViewController.viewModel = viewModel
        navigationController?.pushViewController(detailsViewController, animated: false)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.identifier, for: indexPath)
        guard let albumCell = tableViewCell as? AlbumTableViewCell else { return tableViewCell}
        let album: Album = viewModel.albums[indexPath.row]
        
        albumCell.configureCellWith(albumName: album.name, artistName: album.artistName, artworkUrl: album.artworkUrl100, imgCache: viewModel.imgCache)
        
        return albumCell
    }
}

extension AlbumsTableViewController: UITableViewDataSource {
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.albums.count
    }
}

extension AlbumsTableViewController: AlbumDelegate {
    func update() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
