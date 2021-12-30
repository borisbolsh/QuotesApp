//
//  Quote.swift
//  QuotesApp
//
//  Created by Boris Bolshakov on 30.12.21.
//

import Foundation

struct Quote: Decodable {
    
    var quote: String?
    var character: String?
    var image: String?
    var characterDirection: String?
    
}

struct Quotes: Decodable {
    
    var quotes: [Quote]
    
}
