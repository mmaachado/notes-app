//
//  ContentView.swift
//  Notes App WatchKit Extension
//
//  Created by Marcelo Machado on 24/06/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    
    @State private var notes:[Note] = [Note]()
    @State private var text:String = ""
    
    // MARK: - FUNCTION
    
    func save() {
        dump(notes)
    }
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6) {
                TextField("Add New Note", text: $text)
                
                Button {
                    // 1. run btn action when textfield isnt empty
                    guard text.isEmpty == false else { return }
                    
                    // 2. create a new note item && initialize it with text value
                    let note = Note(id: UUID(), text: text)
                    
                    // 3. add new note item to the notes array (append)
                    notes.append(note)
                    
                    // 4. make textfield empty
                    text = ""
                    
                    // 5. save the notes (func)
                    save()
                    
                    
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 42, weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)
//                .buttonStyle(BorderedButtonStyle(tint: .accentColor))
            } //: hstack
            
            Spacer()
            
            Text("\(notes.count)")
        } //: vstack
        .navigationTitle("Notes")
    }
}
    // MARK: - PREVIEW

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
