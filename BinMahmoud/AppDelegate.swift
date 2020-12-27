//
//  AppDelegate.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 26/11/2020.
//

import UIKit
import CoreData
import Swinject
import SideMenu

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var appCoordinator: AppCoordinator!
    
    static let container = Container()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        

        Container.loggingFunction = nil
        AppDelegate.container.registerDependencies()
        
        setUpSideMenu()
        appCoordinator = AppDelegate.container.resolve(AppCoordinator.self)!
        appCoordinator?.start()
        
        return true
    }
    
    
    private func setUpSideMenu() {
        // Define the menus
        let rightMenuNavigationController = SideMenuNavigationController(rootViewController: CategoriesSideMenu.instantiate())
        SideMenuManager.default.rightMenuNavigationController = rightMenuNavigationController
        rightMenuNavigationController.navigationBar.isHidden = true

        let style = SideMenuPresentationStyle.menuSlideIn
        style.backgroundColor = .black
        style.presentingEndAlpha = 0.65
        style.onTopShadowColor = .black
        style.onTopShadowRadius = 4.0
        style.onTopShadowOpacity = 0.2
        style.onTopShadowOffset = CGSize(width: 2.0, height: 0.0)

        var settings = SideMenuSettings()
        settings.presentationStyle = style
        settings.menuWidth = max(round(min((UIScreen.main.bounds.width), (UIScreen.main.bounds.height)) * 0.80), 240)
        settings.statusBarEndAlpha = 0.0

        rightMenuNavigationController.settings = settings
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "BinMahmoud")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

