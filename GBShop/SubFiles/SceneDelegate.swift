//
//  SceneDelegate.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 07.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let tabBar = UITabBarController()
        let viewController = FirstSceneAssembly.build()
        let goodVC = GoodsSceneAssembly.build()
        viewController.title = "Auth"
        goodVC.title = "GoodsVC"
        tabBar.setViewControllers([viewController, goodVC], animated: true)
        guard let items = tabBar.tabBar.items else { return }
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: "gear")
        }
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

