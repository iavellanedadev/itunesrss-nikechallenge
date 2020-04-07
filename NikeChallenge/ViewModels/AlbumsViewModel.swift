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
    
    let imgCache = NSCache<NSString, AnyObject>()
    var albums = [Album]() {
        didSet{
            delegate?.update()
        }
    }
}

extension AlbumsViewModel {
    /**
     Tell our service(DJ) class to grab the data(music)!

     Calling this method fetches the music to display in our list
     */
    func getMusic() {
        AppleiTunesService().getAlbums(for: URLMusicFeed.oneHundred.url) { [weak self] response in
            switch response {
            case .success(let albums):
                print("Music Count: \(albums.count)")
                self?.albums = albums
                
            case .failure(let err):
                print("Failed Grabbing Albums: \(err.errorDescription ?? err.localizedDescription)")
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

