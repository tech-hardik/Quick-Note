//
//  AddNoteView.swift
//  Quick Note
//
//  Created by HARDIK SHARMA on 07/07/23.
//

import SwiftUI

struct AddNoteView: View {
    
    @State private var task = ""
    
    var body: some View {
        NavigationView{
            VStack{
                RoundedRectangle(cornerRadius: 15)
                    .frame(width:300,height:50)
                    .shadow(color:.gray, radius: 2, x:0, y:2)
                    .foregroundColor(.white)
                    .overlay{
                        TextField("What would you like to add?", text: $task)
                            .multilineTextAlignment(.center)
                    }
                Button{
                    //
                } label: {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width:250,height:50)
                        .overlay{
                            Text("Take Note")
                                .foregroundColor(.white)
                                .font(.title2)
                                .bold()
                        }
                }
                .padding()
                
                Spacer()
            }
            .padding(35)
            .navigationTitle("Add a note 📝")
        }
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView()
    }
}
