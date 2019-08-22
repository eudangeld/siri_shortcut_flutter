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
        siriButton.delegate = self
        siriButton.frame = frame
        siriButton.translatesAutoresizingMaskIntoConstraints = false
        return siriButton
    }
    
}
@available(iOS 12.0, *)
extension SiriButton: INUIAddVoiceShortcutViewControllerDelegate {
    public func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    public func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
   
    
}

@available(iOS 12.0, *)
extension SiriButton: INUIAddVoiceShortcutButtonDelegate {
    public func present(_ addVoiceShortcutViewController: INUIAddVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        addVoiceShortcutViewController.delegate = self
        addVoiceShortcutViewController.modalPresentationStyle = .formSheet
        present(addVoiceShortcutViewController,for:addVoiceShortcutButton)
    }
    
    public func present(_ editVoiceShortcutViewController: INUIEditVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        editVoiceShortcutViewController.delegate = self
        editVoiceShortcutViewController.modalPresentationStyle = .formSheet
        present(editVoiceShortcutViewController,for: addVoiceShortcutButton)
    }
}

@available(iOS 12.0, *)
extension SiriButton: INUIEditVoiceShortcutViewControllerDelegate {
    public func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didUpdate voiceShortcut: INVoiceShortcut?, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    public func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didDeleteVoiceShortcutWithIdentifier deletedVoiceShortcutIdentifier: UUID) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    public func editVoiceShortcutViewControllerDidCancel(_ controller: INUIEditVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}

