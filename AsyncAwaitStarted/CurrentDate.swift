//
//  CurrentDate.swift
//  AsyncAwaitStarted
//
//  Created by joe on 2/13/24.
//

import Foundation

struct CurrentDate: Decodable, Identifiable {
    let id = UUID()
    let date: String
    
    private enum CodingKeys: String, CodingKey {
        case date = "date"
    }
}
