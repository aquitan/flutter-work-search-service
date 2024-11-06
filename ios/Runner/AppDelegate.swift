import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
		YMKMapKit.setLocale("RU-ru") // Your preferred language. Not required, defaults to system language
    YMKMapKit.setApiKey("1418ab6d-5905-4ccd-a082-90d8695d7761") // Your generated API key
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
