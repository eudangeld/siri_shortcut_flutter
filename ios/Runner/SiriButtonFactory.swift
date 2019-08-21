//
//  SiriButtonFactory.swift
//  Runner
//
//  Created by dan on 21/08/19.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import Foundation
import Flutter
import IntentsUI

public class SiriButtonFactory:NSObject,FlutterPlatformViewFactory{
    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return SiriButton(frame,viewId:viewId,args:args)
    }
}

public class SiriButton: NSObject,FlutterPlatformView{
    
    let frame:CGRect
    let viewId:Int64
    
    init(_ frame:CGRect, viewId:Int64, args:Any?){
        self.frame = frame
        self.viewId = viewId
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func view() -> UIView {
        let siriButton = INUIAddVoiceShortcutButton(style: .whiteOutline)
        siriButton.delegate = SiriButonDelegate() as! INUIAddVoiceShortcutButtonDelegate
        siriButton.frame = frame
        siriButton.translatesAutoresizingMaskIntoConstraints = false
        return siriButton
    }
}


