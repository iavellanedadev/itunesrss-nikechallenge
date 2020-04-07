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
    func makeAlbumViewModel(for index: Int) -> AlbumViewModel {
        let album = albums[index]
        return AlbumViewModel(album: album)
    }
}

