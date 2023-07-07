//
//  ContentView.swift
//  Quick Note
//
//  Created by HARDIK SHARMA on 07/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(0...3, id: \.self) { note in Text("Hello")}
                }
            }
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
                    } label: {
                        Image(systemName: "square.and.pencil" )
                    }
                }
            }
        }
    }
}

struct note: Identifiable, Equatable {
    var id = UUID()
    var task: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
