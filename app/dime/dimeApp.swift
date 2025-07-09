//
//  dimeApp.swift
//  dime
//
//  Created by Rafael Soh on 11/7/22.
//

import SwiftUI

@main
struct dimeApp: App {
    @StateObject var dataController: DataController
    @StateObject var unlockManager: UnlockManager
    @StateObject var appLockVM = AppLockViewModel()
    @StateObject var tabBarManager = TabBarManager()

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(appLockVM)
                .environmentObject(dataController)
                .environmentObject(unlockManager)
                .environmentObject(tabBarManager)
        }
    }

    init() {
        let dataController = DataController.shared
        let userDefaults = UserDefaults(suiteName: groupId)!
        
        if CommandLine.arguments.contains("-Test") {
            dataController.deleteAll()
            dataController.save()
            
            userDefaults.removePersistentDomain(forName: groupId)
            userDefaults.synchronize()
        }
        
        if CommandLine.arguments.contains("-SkipOnboarding") {
            userDefaults.set(true, forKey: "onboardingComplete")
        }
        
        if CommandLine.arguments.contains("-SeedCategories") {
            let categories = SuggestedCategory.expenses.prefix(3) + SuggestedCategory.incomes.prefix(1)
            for (i, category) in categories.enumerated() {
                let suggestedCategory = Category(context: dataController.container.viewContext)
                suggestedCategory.name = NSLocalizedString(category.name, comment: "category name")
                suggestedCategory.emoji = category.emoji
                suggestedCategory.dateCreated = Date.now
                suggestedCategory.id = UUID()
                suggestedCategory.colour = "1"
                suggestedCategory.order = Int64(i)
                suggestedCategory.income = category.income
                dataController.save()
            }
        }
        
        if CommandLine.arguments.contains("-SeedTransactions") {
            // TODO: seed
        }
        
        
//        let dataController = DataController()
        let unlockManager = UnlockManager(dataController: dataController)

        _dataController = StateObject(wrappedValue: dataController)
        _unlockManager = StateObject(wrappedValue: unlockManager)

        UITableView.appearance().backgroundColor = .clear
    }
}
