//
//  ContentView.swift
//  OneStepFarther
//
//  Created by KIRILL SIMAGIN on 21/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SectionGroupView(sectionTitle: "Content View") {
            VStack {
                Image(systemName: "command")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
