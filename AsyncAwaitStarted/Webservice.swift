//
//  Webservice.swift
//  AsyncAwaitStarted
//
//  Created by joe on 2/12/24.
//

import Foundation

class Webservice {
    func getDate() async throws -> CurrentDate? {
        guard let url = URL(string: "https://ember-sparkly-rule.glitch.me/current-date") else {
            fatalError("Url is incorrect!")
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try? JSONDecoder().decode(CurrentDate.self, from: data)
    }
}
