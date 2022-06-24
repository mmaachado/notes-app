//
//  HeaderView.swift
//  Notes App WatchKit Extension
//
//  Created by Marcelo Machado on 24/06/22.
//

import SwiftUI

struct HeaderView: View {
    
    var title:String = ""
    
    var body: some View {
        
        VStack {
            // title
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            
            // separator
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            } //: hstack
            .foregroundColor(.accentColor)
        } //: vstack
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(title: "Credits")
            
            HeaderView()
        }
    }
}
