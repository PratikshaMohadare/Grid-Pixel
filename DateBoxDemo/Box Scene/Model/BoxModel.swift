//
//  BoxModel.swift
//  DateBoxDemo
//
//  Created by Pratiksha Mohadare on 28/07/23.
//

import Foundation

struct MainData {
    let hours: [Hours]
    let day: String
}

extension MainData: Decodable {
    
    private enum Key: String, CodingKey {
        case hours = "hours"
        case day = "day"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        
        self.hours = try container.decode([Hours].self, forKey: .hours)
        self.day = try container.decode(String.self, forKey: .day)
        
    }
}
