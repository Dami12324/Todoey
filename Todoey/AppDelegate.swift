import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    /****************************************************************************************************************************************************************/
    // This method gets called when the app gets loaded up. It doesn't matter of the rest of the app is going to crash. This is the first thing that happens(even before the "override viewDidLoad()" function inside the "ToDoListViewController" class).......................................................................
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    
    
    

    /****************************************************************************************************************************************************************/
    // This method gets called when something happens to the phone while the app is open in the background (I.E when the user receives a call or something.) This is the method that you can do something to prevent the user from loosing data. EX- Saying that they were filling a form on our app and they get a call from somebody. It will be really annoying if after the phone call, when they get back to our app, the app had already been terminated and they've lost all the data..........................................................................................................................................................
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    
    
    

    /****************************************************************************************************************************************************************/
    // This method gets called when our app disappears off the screen. IE- The user presses the home button for example or when they open up a different app. In this case, our app is no longer visible and it's entered the background............................................................................................
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        print("applicationDidEnterBackground")
        
    }

    
    
    
    
    /****************************************************************************************************************************************************************/
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    
    
    
    
    
    /****************************************************************************************************************************************************************/
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    
    
    
    
    /****************************************************************************************************************************************************************/
    // This method gets called when the app is going to be terminated. This can be user triggered or system triggered. EX - If a user presses the home button on our app and decides to click another app, if this new app that they clicked happens to be resource intensive like a game or something then the phone might reclaim some of the resources that our app is using even though it's in the background and the phone will terminate our app. Another example is when a user decides to force quit our app for some reason or the other...............................................................................................................
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        print("applicationWillTerminate")
    }

    

}

