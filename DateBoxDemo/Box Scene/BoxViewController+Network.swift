//
//  BoxViewController+Network.swift
//  DateBoxDemo
//
//  Created by Pratiksha Mohadare on 28/07/23.
//

import Foundation
import Alamofire

extension BoxViewController {
    func loadJson(fileName: String) -> [MainData]? {
        let decoder = JSONDecoder()
        let url = Bundle.main.url(forResource: fileName, withExtension: "json")!
        do {
            let data = try Data(contentsOf: url)
            do {
                let person = try decoder.decode([MainData].self, from: data)
                return person
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
        
        return nil
    }
}
