import UIKit
import Flutter
import Intents

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    
    override func application(_ application: UIApplication, handle intent: INIntent, completionHandler: @escaping (INIntentResponse) -> Void) {
        guard
            intent is VoucherIntent else{
                return
        }
        
        let siriButtoncontroller = SiriButtonDelegate()
        let rootViewController = window.rootViewController as? UINavigationController
        rootViewController!.pushViewController(siriButtoncontroller, animated: true)
        return
        
    }
    


    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    initFlutterChannel()

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    
    
    
    public func initFlutterChannel(){
        
        let flutterViewCOntroller :FlutterViewController = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: "dan.flutter.intent/siri", binaryMessenger: flutterViewCOntroller as FlutterBinaryMessenger)
        let navController = UINavigationController(rootViewController: flutterViewCOntroller)
        navController.isNavigationBarHidden = true
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        let siriButtoncontroller = SiriButtonDelegate()
        channel.setMethodCallHandler({
            (call:FlutterMethodCall, result:FlutterResult)-> Void in
            if call.method=="donateShortCut"{
                self.doneteShortCut()
                navController.pushViewController(siriButtoncontroller, animated: true)
            }
            else{
                result(FlutterMethodNotImplemented)
                return
            }
        })
    }
    
    public func doneteShortCut(){
        let intent =  VoucherIntent()
        intent.suggestedInvocationPhrase = "Hello Shortcut"
        let interaction = INInteraction(intent: intent, response: nil)
        
        interaction.donate { (error) in
            if error != nil {
                if let error = error as NSError? {
                    print("\(error)")
                } else {
                    print("Successfully donated interaction")
                }
            }
        }
    }
}



