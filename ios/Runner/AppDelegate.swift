import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let nativeViewFactory = NativeViewFactory()
    registrar(forPlugin: "Runner").register(nativeViewFactory, withId: "NativeView")
    
    let controller : FlutterViewController  = window?.rootViewController as! FlutterViewController
    
    let mediaPermissionChannel = FlutterMethodChannel(
        name: "media.permission",
        binaryMessenger: controller.binaryMessenger
    )
    
    mediaPermissionChannel.setMethodCallHandler { (call, result) in
        let mediaPermissionHandler: MediaPermissionHandler = MediaPermissionHandler()
        result([
            "video": mediaPermissionHandler.requestAccessVideo(),
            "audio": mediaPermissionHandler.requestAccessAudio(),
        ])
    }
    
    GeneratedPluginRegistrant.register(with: self)
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
