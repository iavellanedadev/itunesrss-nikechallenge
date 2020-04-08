//
//  AlbumViewModel.swift
//  NikeChallenge
//
//  Created by Avellaneda on 4/7/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import Foundation

class AlbumViewModel {
    weak var delegate: AlbumDelegate?
    
    var album: Album
    
    private(set) var state: AlbumsViewModelState = .loaded {
        didSet {
            delegate?.update(state)
        }
    }
    
    init(album: Album) {
        self.album = album
    }

}

extension AlbumViewModel {
    var url: URL? {
        URL(string: album.url)
    }
    
    var name: String {
        album.name
    }
    
    var artistName: String {
        album.artistName
    }
    
    var genres: String {
        album.genres.prefix(3).map({$0.name}).joined(separator: "/")
    }
    
}
