import UIKit
import Flutter
import CastarSDK

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let result = Castar.createInstance(devKey: "CSK****FHQlUQZ")
    switch result {
      case .success(let castar): castar.start()
      case .failure(let e): print("Castar init error: \(e.localizedDescription)")
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
} 