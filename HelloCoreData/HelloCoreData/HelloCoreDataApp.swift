//
//  HelloCoreDataApp.swift
//  HelloCoreData
//
//  Created by KIRILL SIMAGIN on 20/03/2023.
//

import SwiftUI

@main
struct HelloCoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(storageProvider: StorageProvider())
        }
    }
}
