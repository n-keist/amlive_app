//
//  NativeViewFactory.swift
//  Runner
//
//  Created by Nikolaj Keist on 03.03.20.
//

import Foundation
import LFLiveKit

class NativeViewFactory : NSObject, FlutterPlatformViewFactory {
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return NativeView(frame, viewId: viewId, args: args)
    }
}

public class NativeView : NSObject, FlutterPlatformView {
    let frame : CGRect
    let viewId : Int64
    let session : LFLiveSession
    
    init(_ frame:CGRect, viewId:Int64, args: Any?) {
        self.frame = frame
        self.viewId = viewId
        self.session = LFLiveSession()!
    }
    
    public func view() -> UIView {
        let view : UIView = UIView(frame: self.frame)
        view.backgroundColor = UIColor.lightGray
        return session.preView
    }
}
