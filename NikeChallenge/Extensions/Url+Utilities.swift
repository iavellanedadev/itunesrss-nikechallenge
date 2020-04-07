//
//  Url+Extension.swift
//  NikeChallenge
//
//  Created by Consultant on 4/6/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import Foundation
import UIKit

extension URL {
    func getImage(completion: @escaping (UIImage?) -> Void)
    {
        URLSession.shared.dataTask(with: self){ (dat, _, err)
            in
            
            if let error = err {
                print("Error Fetching Image: \(error.localizedDescription)")
                completion(nil)
            }
            if let data = dat {
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    completion(image)
                }
            }
            
        }.resume()
    }
}
