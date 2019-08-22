//
//  SiriButtonDelegate.swift
//  Runner
//
//  Created by dan on 22/08/19.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import IntentsUI
import Foundation
class SiriButtonDelegate:UIViewController{
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addSiriButton(to: self.view)
        view.backgroundColor = UIColor.white
    }
    
    @objc func backToFlutter(_ sender: Any){
        navigationController?.popToRootViewController(animated: true)
    }
    
    func addSiriButton(to view: UIView) {
        let button = INUIAddVoiceShortcutButton(style: .blackOutline)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        view.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        button.addTarget(self, action: #selector(addToSiri(_:)), for: .touchUpInside)
        
        
        let backButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        backButton.setTitle("Back",for: .normal)
        backButton.setTitleColor(.blue, for: .normal)
        backButton.addTarget(self, action: #selector(backToFlutter(_:)), for: .touchUpInside)
        view.addSubview(backButton)
        
    }
    
    @objc
    func addToSiri(_ sender: Any) {
        let intent = VoucherIntent()
        intent.suggestedInvocationPhrase = "Buy voucher again"
        if let shortcut = INShortcut(intent: intent) {
            let viewController = INUIAddVoiceShortcutViewController(shortcut: shortcut)
            viewController.modalPresentationStyle = .formSheet
            viewController.delegate = self
            present(viewController, animated: true, completion: nil)
        }
    }
}


extension SiriButtonDelegate {
    func presentAddOpenBoardToSiriViewController() {
        guard let userActivity = self.userActivity else { return }
        let shortcut = INShortcut(userActivity: userActivity)
        let viewController = INUIAddVoiceShortcutViewController(shortcut: shortcut)
        viewController.modalPresentationStyle = .formSheet
        viewController.delegate = self
        present(viewController, animated: true, completion: nil)
    }
}


@available(iOS 12.0, *)
extension SiriButtonDelegate: INUIAddVoiceShortcutViewControllerDelegate {
    public func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    public func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
}

@available(iOS 12.0, *)
extension SiriButtonDelegate: INUIAddVoiceShortcutButtonDelegate {
    public func present(_ addVoiceShortcutViewController: INUIAddVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        addVoiceShortcutViewController.delegate = self
        addVoiceShortcutViewController.modalPresentationStyle = .formSheet
        present(addVoiceShortcutViewController, animated: true, completion: nil)
    }
    
    public func present(_ editVoiceShortcutViewController: INUIEditVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        editVoiceShortcutViewController.delegate = self
        editVoiceShortcutViewController.modalPresentationStyle = .formSheet
        present(editVoiceShortcutViewController, animated: true, completion: nil)
    }
}

@available(iOS 12.0, *)
extension SiriButtonDelegate: INUIEditVoiceShortcutViewControllerDelegate {
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

