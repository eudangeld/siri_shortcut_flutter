//
//  IntentHandler.swift
//  Siri
//
//  Created by dan on 21/08/19.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        print("Intent handler")
        return self
    }
   
}
