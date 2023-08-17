//
//  HoursModel.swift
//  DateBoxDemo
//
//  Created by Pratiksha Mohadare on 28/07/23.
//

import Foundation

struct Hours {
    let hour: String
    let recordCount: Int
}

extension Hours: Decodable {
    
    private enum Key: String, CodingKey {
        case hour = "hour"
        case recordCount = "record_count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        
        self.hour = try container.decode(String.self, forKey: .hour)
        self.recordCount = try container.decode(Int.self, forKey: .recordCount)
        
    }
}
