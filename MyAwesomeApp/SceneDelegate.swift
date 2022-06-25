//
//  SceneDelegate.swift
//  MyAwesomeApp
//
//  Created by digital.aurum on 10/06/22.
//

import Catalog
import Shared
import ProductDetail
import UIKit

/// NOTES
/// - uncheck inherit in xib files when move to framework -> Ini klo gak di uncheck, reference nya bakalan ngambil dari main app. sedangkan file nya sudah di pindahkan ke framework.
/// - ACL (Access Control List)
///
/// - Shared Example in Shared Framework
/// - Select App -> project: Shared
///
///
/// Untuk framework yang di embed & sign and do not embed will affect to size app. Perlu di buktikan.
///
/// Tokped full menggunakan static framework

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: windowScene)
    self.window = window
    let rootNavigationController = UINavigationController(rootViewController: CatalogPageViewController())
    window.rootViewController = rootNavigationController
    window.makeKeyAndVisible()
    
    Router.route = { destination in
      switch destination {
      case let .productDetailPage(product):
        let productDetailPage = ProductDetailPageViewController(product: product)
        UIApplication
          .topViewController()?
          .navigationController?
          .pushViewController(productDetailPage, animated: true)
      default:
        return
      }
    }
  }
  
  func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
  }
  
  func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
  }
  
  func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
  }
  
  func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
  }
  
  func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
  }
  
  
}

