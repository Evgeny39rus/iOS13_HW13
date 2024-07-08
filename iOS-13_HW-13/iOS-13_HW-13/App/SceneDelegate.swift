import UIKit
import SnapKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewController = ViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    func sceneDidDisconnect(_ scene: UIScene) {
           // Вызывается, когда сцена была отключена и больше не связана с окном приложения
       }

       func sceneDidBecomeActive(_ scene: UIScene) {
           // Вызывается, когда сцена перешла в активное состояние
       }

       func sceneWillResignActive(_ scene: UIScene) {
           // Вызывается, когда сцена перестаёт быть активной
       }

       func sceneWillEnterForeground(_ scene: UIScene) {
           // Вызывается, когда сцена переходит из фонового состояния в состояние на переднем плане
       }

       func sceneDidEnterBackground(_ scene: UIScene) {
           // Вызывается, когда сцена перешла в фоновое состояние
       }
   }
