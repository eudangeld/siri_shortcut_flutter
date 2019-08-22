//
//  VoucherIntentHandler.swift
//  Siri
//
//  Created by dan on 22/08/19.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import Foundation
class VoucherIntentHandler:NSObject,VoucherIntentHandling{
    func handle(intent: VoucherIntent, completion: @escaping (VoucherIntentResponse) -> Void) {
        completion(VoucherIntentResponse.success(restaurants: "nome do(s) restaurante(s)"))
    }
}
