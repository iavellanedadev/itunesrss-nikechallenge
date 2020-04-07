//
//  AlbumsTableViewController.swift
//  NikeChallenge
//
//  Created by Consultant on 4/3/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import UIKit

class AlbumsTableViewController: UITableViewController {

    let viewModel = AlbumViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: AlbumTableViewCell.identifier)

        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorInset = .zero
        tableView.separatorStyle = .none
        tableView.backgroundColor = .gray
        tableView.tableFooterView = UIView(frame: .zero)
        
        viewModel.delegate = self
        viewModel.getMusic()
    
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.albums.count
    }

    //MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailsViewController = DetailsViewController()
        let album: Album = viewModel.albums[indexPath.row]
        viewModel.album = album
        detailsViewController.viewModel = viewModel
        navigationController?.pushViewController(detailsViewController, animated: false)
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.identifier, for: indexPath)
        guard let albumCell = tableViewCell as? AlbumTableViewCell else { return tableViewCell}
        let album: Album = viewModel.albums[indexPath.row]
        
        albumCell.configureCellWith(albumName: album.name, artistName: album.artistName, artworkUrl: album.artworkUrl100, imgCache: viewModel.imgCache)
        
        return albumCell
    }

}

extension AlbumsTableViewController: AlbumDelegate
{
    func update()
    {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

