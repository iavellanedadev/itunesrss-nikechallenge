//
//  AlbumViewModel.swift
//  NikeChallenge
//
//  Created by Avellaneda on 4/3/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import Foundation

class AlbumsViewModel {
    weak var delegate: AlbumDelegate?
    
    private var albums = [Album]()
    private let service: GetAlbums
    
    private(set) var state: AlbumsViewModelState = .empty {
        didSet {
            delegate?.update(state)
        }
    }
    
    init(service: GetAlbums = AppleiTunesService()) {
        self.service = service
    }
}

extension AlbumsViewModel {
    /**
     Tell our service(DJ) class to grab the data(music)!

     Calling this method fetches the music to display in our list
     */
    func getMusic() {
        service.getAlbums(for: WebURL.buildURLWithQueryOf(.fifty)) { [weak self] response in
            switch response {
            case .success(let albums):
                if albums.isEmpty == false {
                    self?.albums = albums
                    self?.state = .loaded
                } else {
                    self?.state = .empty
                }
            case .failure(let err):
                let errorString = "Failed Grabbing Albums: \(err.errorDescription ?? err.localizedDescription)"
                self?.state = .error(errorString)
            }
        }
    }
}

extension AlbumsViewModel {
    /**
     Make a single album view model!

     Calling this method creates an instance of a separate view model for our detailed Album view

     - Parameter index: the index of the `album` in our `Album` array
     */
    func makeAlbumViewModel(for index: Int) -> AlbumViewModel {
        let album = albums[index]
        return AlbumViewModel(album: album)
    }
}

extension AlbumsViewModel {

    var count: Int {
        albums.count
    }
    
    func albumInfo(for index: Int) -> (name: String, artistName: String, artworkUrl: String) {
        let album = albums[index]
        return (name: album.name, artistName: album.artistName, artworkUrl: album.artworkUrl100)
    }
    
}

