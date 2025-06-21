import Flutter
import UIKit
import CastarSDK

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let result = Castar.createInstance(withDevKey: "CSK****FHQlUQZ")
    switch result {
      case .success(let castar): castar.start()
      case .failure(let e): print("Castar init error: \(e.localizedDescription)")
    }
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
