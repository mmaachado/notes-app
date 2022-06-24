//
//  CreditsView.swift
//  Notes App WatchKit Extension
//
//  Created by Marcelo Machado on 24/06/22.
//

import SwiftUI

struct CreditsView: View {
    
    @State private var randomNumber:Int = Int.random(in: 1..<4)
    
    private var randomImage:String {
        return "developer-no\(randomNumber)"
    }
    
    var body: some View {
        VStack(spacing: 3) {
            // profile img
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            // header
            HeaderView(title: "Credits")
            
            // content
            Text("Marcelo Machado")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        } //: vstack
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
