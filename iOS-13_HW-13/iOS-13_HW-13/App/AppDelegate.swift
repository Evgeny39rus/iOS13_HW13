import UIKit
import SnapKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
            // Вызывается, когда приложение переходит в фоновый режим
        }

        func applicationWillEnterForeground(_ application: UIApplication) {
            // Вызывается, когда приложение собирается вернуться на передний план
        }

        func applicationDidBecomeActive(_ application: UIApplication) {
            // Вызывается, когда приложение становится активным
        }

        func applicationWillResignActive(_ application: UIApplication) {
            // Вызывается, когда приложение собирается перейти из активного в неактивное состояние
        }

        func applicationWillTerminate(_ application: UIApplication) {
            // Вызывается, когда приложение собирается завершиться
        }
    }

