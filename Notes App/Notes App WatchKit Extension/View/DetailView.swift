//
//  DetailView.swift
//  Notes App WatchKit Extension
//
//  Created by Marcelo Machado on 24/06/22.
//

import SwiftUI

struct DetailView: View {
    // MARK: - PROPERTY
    
    let note:Note
    let count:Int
    let index:Int
    
    // MARK: - BODY
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            // header
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            } //: hstack
            .foregroundColor(.accentColor)
            
            // content
            Spacer()
            
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            // footer
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                
                Spacer()
                
                Text("\(count) /\(index + 1)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
            } //: hstack
            .foregroundColor(.secondary)
        } //: vstack
        .padding(3)
    }
}


    // MARK: - PREVIEW
struct DetailView_Previews: PreviewProvider {
    static var sampleData:Note = Note(id: UUID(), text: "Hello world")
    
    static var previews: some View {
        DetailView(note: sampleData, count: 5, index: 1)
    }
}
