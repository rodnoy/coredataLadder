//
//  ContentView.swift
//  HelloCoreData
//
//  Created by KIRILL SIMAGIN on 20/03/2023.
//

import SwiftUI

fileprivate struct Pal{
    static let alertTitle: String = "Hey"
    static let alertMessage: String = "Movie name should not be empty"
    static let alertButtonText: String = "Ok"
}
struct ContentView: View {
    @State private var showingAlert: Bool = false
    
    let storageProvider: StorageProvider
    @State private var text: String = ""
    var body: some View {
        dataList
            .alert(Text(Pal.alertTitle), isPresented: $showingAlert) {
                Button(Pal.alertButtonText, role: .cancel){}
            }message: {
                Text(Pal.alertMessage)
            }
    }
    private func onTap(text: Binding<String>?){
        guard let value = text?.wrappedValue,
              !value.isEmpty else {
            showingAlert = true;
            return
        }
        storageProvider.saveMovie(named: value)
        $text.wrappedValue = ""
    }
    
    var header: some View {
        VStack {
            HStack {
                TextField("Placeholder", text: $text)
                Button("add") {
                    onTap(text: $text)
                }
            }
        }
    }
    var dataList: some View {
        List{
            Section {
                ForEach(storageProvider.getAllMovies(),id: \.self){ movie in
                    listElemet(movie: movie)
                }.onDelete(perform: delete)
            } header: {
                header
            }
        }
        .listStyle(.automatic)
    }
    
    @ViewBuilder func listElemet(movie: Movie) -> some View{
        Text(movie.name ?? "empty movie")
    }
    
    private func delete(at offsets: IndexSet) {
        // delete the objects here
        let movies = storageProvider.getAllMovies()
        let toDelete = offsets.compactMap{movies[$0]}
        toDelete.forEach{
            storageProvider.deleteMovie($0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(storageProvider: StorageProvider())
    }
}
