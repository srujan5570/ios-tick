import Flutter
import UIKit
import CastarSDK

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Try to initialize CastarSDK
    let result = Castar.createInstance(withDevKey: "CSK****FHQlUQZ")
    
    // Handle the result based on its type
    if let castar = result as? Castar {
      castar.start()
    } else if let error = result as? Error {
      print("Castar init error: \(error.localizedDescription)")
    } else {
      print("Castar initialization completed")
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
