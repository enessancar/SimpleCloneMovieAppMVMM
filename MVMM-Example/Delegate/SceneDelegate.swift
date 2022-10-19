//
//  SceneDelegate.swift
//  MVMM-Example
//
//  Created by Enes Sancar on 13.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
     
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        window?.rootViewController = UINavigationController(rootViewController: HomeScreen())
        window?.makeKeyAndVisible()
    }



}

