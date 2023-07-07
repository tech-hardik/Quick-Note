//
//  ContentView.swift
//  Quick Note
//
//  Created by HARDIK SHARMA on 07/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var noteslist: NotesList = NotesList()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(noteslist.notes) { note in HStack {
                        Text(note.task)
                        Spacer()
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                            .onTapGesture {
                                noteslist.deleteNote(note: note)
                            }
                    }
                    }
                }
                .navigationTitle("Notes")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            noteslist.showAddNoteview.toggle()
                        } label: {
                            Image(systemName: "square.and.pencil" )
                        }
                    }
                }
                .sheet(isPresented: $noteslist.showAddNoteview) {
                    AddNoteView(noteslist: noteslist)
                }
            }
        }
    }
    
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
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
