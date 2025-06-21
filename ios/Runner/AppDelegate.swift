import Flutter
import UIKit
import CastarSDK

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    print("AppDelegate: Starting application initialization...")
    
    // Register Flutter plugins first to ensure basic functionality
    print("AppDelegate: Registering Flutter plugins...")
    GeneratedPluginRegistrant.register(with: self)
    print("AppDelegate: Flutter plugins registered successfully")
    
    // Initialize CastarSDK with comprehensive error handling
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
      self.initializeCastarSDK()
    }
    
    print("AppDelegate: Application initialization completed")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  private func initializeCastarSDK() {
    print("AppDelegate: Starting CastarSDK initialization...")
    
    do {
      print("AppDelegate: Attempting to initialize CastarSDK...")
      
      let result = Castar.createInstance(withDevKey: "CSK****FHQlUQZ")
      
      // Handle the result based on its type
      if let castar = result as? Castar {
        print("AppDelegate: CastarSDK initialized successfully")
        castar.start()
        print("AppDelegate: CastarSDK started successfully")
      } else if let error = result as? Error {
        print("AppDelegate: CastarSDK init error: \(error.localizedDescription)")
      } else {
        print("AppDelegate: CastarSDK initialization completed with unknown result type: \(type(of: result))")
      }
      
    } catch {
      print("AppDelegate: CastarSDK startup crash: \(error.localizedDescription)")
      print("AppDelegate: Error details: \(error)")
    }
  }
}
