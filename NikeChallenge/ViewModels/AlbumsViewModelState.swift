//
//  AlbumsViewModelState.swift
//  NikeChallenge
//
//  Created by Avellaneda on 4/8/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import Foundation

enum AlbumsViewModelState {
    case loaded
    case error(String)
    case loading
    case empty
}
