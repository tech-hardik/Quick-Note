//
//  Quick_NoteApp.swift
//  Quick Note
//
//  Created by HARDIK SHARMA on 07/07/23.
//

import SwiftUI

struct Note: Identifiable, Equatable {
    var id = UUID()
    var task: String
}

class NotesList: ObservableObject {
    @Published var notes: [Note] = []
    @Published var showAddNoteview = false
    
    func addNote(task: String){
        notes.append(Note(task: task))
    }
    
    func deleteNote(note: Note){
        if let index = notes.firstIndex(of: note) {
            notes.remove(at: index)
        }
    }
}

@main
struct Quick_NoteApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
