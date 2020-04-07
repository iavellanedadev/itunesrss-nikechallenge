//
//  SceneDelegate.swift
//  NikeChallenge
//
//  Created by Avellaneda on 4/3/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if let windowScene = scene as? UIWindowScene {
            self.window = UIWindow(windowScene: windowScene)
            self.window?.backgroundColor = .white
            // Embedding NavigationController to RootViewController

            let rootViewController = AlbumsTableViewController()

            let navigationController = UINavigationController(rootViewController: rootViewController)

            self.window?.rootViewController = navigationController
            self.window?.makeKeyAndVisible()
            
                }
    }




}

