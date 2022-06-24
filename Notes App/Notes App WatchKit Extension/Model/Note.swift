//
//  Note.swift
//  Notes App WatchKit Extension
//
//  Created by Marcelo Machado on 24/06/22.
//

import Foundation

struct Note:Identifiable, Codable {
    let id:UUID
    let text:String
}
