import UIKit
import Flutter
import Intents

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    initFlutterChannel()
    setSiritButton()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    public func setSiritButton(){
        let viewFactory = SiriButtonFactory()
        registrar(forPlugin: "SomePlugin").register(viewFactory, withId: "SiriButton")
    }
    
    
    public func initFlutterChannel(){
        let controller :FlutterViewController = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: "dan.flutter.intent/siri", binaryMessenger: controller as! FlutterBinaryMessenger)
        channel.setMethodCallHandler({
            (call:FlutterMethodCall, result:FlutterResult)-> Void in
            if call.method=="donateShortCut"{
                self.doneteShortCut()
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
