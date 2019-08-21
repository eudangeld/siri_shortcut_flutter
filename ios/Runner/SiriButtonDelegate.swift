//
//  SiriButtonDelegate.swift
//  Runner
//
//  Created by dan on 21/08/19.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import Foundation
import IntentsUI

class INUIAddVoiceShortcutButtonDelegate:NSObject{
    public func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    public func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
