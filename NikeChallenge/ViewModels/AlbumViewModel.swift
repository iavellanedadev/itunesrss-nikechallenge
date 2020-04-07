//
//  AlbumViewModel.swift
//  NikeChallenge
//
//  Created by Consultant on 4/3/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import Foundation

protocol AlbumDelegate: class {
    func update()
}

class AlbumViewModel {
    weak var delegate: AlbumDelegate?
    
    let imgCache = NSCache<NSString, AnyObject>()
    var albums = [Album]()
    {
        didSet{
            delegate?.update()
        }
    }
}

extension AlbumViewModel {
    
    func getMusic()
    {
        AppleiTunesService().getAlbums { [weak self] resp in
            switch resp {
            case .success(let music):
                guard let albums = music as? [Album] else {return}
                print("Music Count: \(albums.count)")
                self?.albums = albums
            case .failure(let err):
                print("Failed Grabbing Albums: \(err.errorDescription ?? err.localizedDescription)")
            }
        }
    }
}

