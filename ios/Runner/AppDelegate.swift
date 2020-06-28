import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    //MARK: - Media Permission Channel
    
    let controller : FlutterViewController  = window?.rootViewController as! FlutterViewController
    
    let liveViewFactory = LiveViewFactory(controller: controller)
    registrar(forPlugin: "Runner")!.register(liveViewFactory, withId: "LiveView")
    
    let mediaPermissionChannel = FlutterMethodChannel(
        name: "media.permission",
        binaryMessenger: controller.binaryMessenger
    )
    
    mediaPermissionChannel.setMethodCallHandler { (call, result) in
        if(call.method == "requestAccess") {
            let mediaPermissionHandler: MediaPermissionHandler = MediaPermissionHandler()
            result([
                "video": mediaPermissionHandler.requestAccessVideo(),
                "audio": mediaPermissionHandler.requestAccessAudio(),
            ])
        }
        
    }
    
    GeneratedPluginRegistrant.register(with: self)
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
