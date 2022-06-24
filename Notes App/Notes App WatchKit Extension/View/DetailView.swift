//
//  DetailView.swift
//  Notes App WatchKit Extension
//
//  Created by Marcelo Machado on 24/06/22.
//

import SwiftUI

struct DetailView: View {
    
    let note:Note
    let count:Int
    let index:Int
    
    @State private var isCreditPresented:Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            // header
            HeaderView(title: "")
            
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
                    .onTapGesture {
                        isCreditPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditPresented, content: {
                        CreditsView()
                    })
            } //: hstack
            .foregroundColor(.secondary)
        } //: vstack
        .padding(3)
    }
}


struct DetailView_Previews: PreviewProvider {
    static var sampleData:Note = Note(id: UUID(), text: "Hello world")
    
    static var previews: some View {
        DetailView(note: sampleData, count: 5, index: 1)
    }
}
