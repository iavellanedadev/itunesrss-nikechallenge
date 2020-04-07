//
//  UIImageView+Utilities.swift
//  NikeChallenge
//
//  Created by Avellaneda on 4/7/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(at url: String) {
      UIImageLoader.loader.load(url, for: self)
    }

    func cancelImageLoad() {
      UIImageLoader.loader.cancel(for: self)
    }
}
