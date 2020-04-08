//
//  AlbumsTableViewController+TableView.swift
//  NikeChallenge
//
//  Created by Avellaneda on 4/7/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import UIKit

extension AlbumsTableViewController: UITableViewDelegate {
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
        
        let album = viewModel.albumInfo(for: indexPath.row)
        cell.configureCellWith(albumName: album.name, artistName: album.artistName, artworkUrl: album.artworkUrl)
        
        return cell
    }
}

extension AlbumsTableViewController: UITableViewDataSource {
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
}

extension AlbumsTableViewController: AlbumDelegate {
    func update(_ state: AlbumsViewModelState) {
        DispatchQueue.main.async {
            switch state {
            case .loaded:
                self.tableView.reloadData()
            case .error(let errorString):
                self.showErrorDialog(message: errorString)
            case .empty:
                self.showErrorDialog(message: "Error - NO DATA RETURNED")
            case .loading:
                print("Not implemented for loading state")
            }
        }
    }
}

