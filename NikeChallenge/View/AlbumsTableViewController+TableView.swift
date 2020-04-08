//
//  AlbumsTableViewController+TableView.swift
//  NikeChallenge
//
//  Created by Avellaneda on 4/7/20.
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
        let albumViewModel = viewModel.makeAlbumViewModel(for: indexPath.row)
        detailsViewController.viewModel = albumViewModel
        
        navigationController?.present(detailsViewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.identifier,for: indexPath) as? AlbumTableViewCell else { return UITableViewCell() }
        
        let album = viewModel.albums[indexPath.row]
        cell.configureCellWith(albumName: album.name, artistName: album.artistName, artworkUrl: album.artworkUrl100)
        
        return cell
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
