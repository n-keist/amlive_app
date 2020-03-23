//
//  LiveViewFactory.swift
//  Runner
//
//  Created by Nikolaj Keist on 23.03.20.
//

import Foundation

public class LiveViewFactory : NSObject, FlutterPlatformViewFactory {
    let controller: FlutterViewController
    
    init(controller: FlutterViewController) {
        self.controller = controller
    }
    
    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        let channel = FlutterMethodChannel(name: "amlive.live", binaryMessenger: controller as! FlutterBinaryMessenger)
        return LiveView(frame, viewId: viewId, channel: channel, args: args)
    }
}
