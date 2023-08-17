//
//  BoxViewController+Interacter.swift
//  DateBoxDemo
//
//  Created by Pratiksha Mohadare on 28/07/23.
//

import Foundation
import UIKit

extension BoxViewController {
    // Sort the data Datewise
    func sortArrayDatewise() {
        self.arrMainData = self.arrMainData.sorted(by: { obj1, obj2 in
            return obj1.day > obj2.day
        })
    } 
}
