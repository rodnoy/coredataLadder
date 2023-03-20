//
//  ContentView.swift
//  HelloCoreData
//
//  Created by KIRILL SIMAGIN on 20/03/2023.
//

import SwiftUI

struct ContentView: View {
    let storageProvider: StorageProvider
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(storageProvider: StorageProvider())
    }
}
