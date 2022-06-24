//
//  SettingsView.swift
//  Notes App WatchKit Extension
//
//  Created by Marcelo Machado on 24/06/22.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("lineCount") var lineCount:Int = 1
    @State private var value:Float = 1.0
    
    func update() {
        lineCount = Int(value)
    }
    
    var body: some View {
        VStack(spacing: 8) {
            // header
            HeaderView(title: "Settings")
            
            // actual line count
            Text("Lines \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            // slider
            Slider(value: Binding(get: {
                self.value
            }, set: {(newValue) in
                self.value = newValue
                self.update()
            }), in: 1...4, step: 1)
                .accentColor(.accentColor)
        } //: vstack
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
