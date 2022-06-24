//
//  ContentView.swift
//  Notes App WatchKit Extension
//
//  Created by Marcelo Machado on 24/06/22.
//

import SwiftUI

struct ContentView: View {
  
    @State private var notes:[Note] = [Note]()
    @State private var text:String = ""
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save() {
//        dump(notes)
        do {
            // 1. convert the notes array to data using JSONEncoder
            let data = try JSONEncoder().encode(notes)
            
            // 2. create a new URL to save the file using getDocumentDirectory
            let url = getDocumentDirectory().appendingPathComponent("notes")
            
            // 3. write data to the given URL
            try data.write(to: url)
            
        } catch {
            print("Saving data has failed 👻")
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                // 1. get the notes URL path
                let url = getDocumentDirectory().appendingPathComponent("notes")
                
                // 2. create a new property for the data
                let data = try Data(contentsOf: url)
                
                // 3. decode the data
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                // do nothing
            }
        }
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    
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
                        .font(.system(size: 35, weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)
//                .buttonStyle(BorderedButtonStyle(tint: .accentColor))
            } //: hstack
            
            Spacer()
            
            if notes.count >= 1 {
                List {
                    ForEach(0..<notes.count, id: \.self) { i in
                        NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i)) {
                            HStack {
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundColor(.accentColor)
                                Text(notes[i].text)
                                    .lineLimit(1)
                                    .padding(.leading, 5)
                            }
                        } //: hstack
                    } //: loop
                    .onDelete(perform: delete)
                }
            } else {
                Spacer()
                Image(systemName: "note.text.badge.plus")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.25)
                    .padding(25)
                Spacer()
            } //: list
        } //: vstack
        .navigationTitle("Notes")
        .onAppear(perform: {
            load()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
