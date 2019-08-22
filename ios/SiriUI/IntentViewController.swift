//
//  IntentViewController.swift
//  SiriUI
//
//  Created by dan on 21/08/19.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import IntentsUI
class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func configureView(for parameters: Set<INParameter>, of interaction: INInteraction, interactiveBehavior: INUIInteractiveBehavior, context: INUIHostedViewContext, completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
        guard interaction.intent is VoucherIntent else {
            completion(false, Set(), .zero)
            return
        }
        
        let width = self.extensionContext?.hostedViewMaximumAllowedSize.width ?? 320
        let desiredSize = CGSize(width: width, height: 300)
        activityIndicator.startAnimating()
        completion(true, parameters, self.desiredSize)
    }
    
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
    
}
