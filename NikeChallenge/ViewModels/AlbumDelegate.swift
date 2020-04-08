//
//  AlbumDelegate.swift
//  NikeChallenge
//
//  Created by Avellaneda on 4/7/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import Foundation

protocol AlbumDelegate: AnyObject {
    func update(_ state: AlbumsViewModelState)
}
