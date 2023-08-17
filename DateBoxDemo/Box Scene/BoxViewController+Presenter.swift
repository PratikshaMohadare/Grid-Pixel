//
//  BoxViewController+Presenter.swift
//  DateBoxDemo
//
//  Created by Pratiksha Mohadare on 28/07/23.
//

import Foundation
import UIKit

extension BoxViewController {
    func loadViewData() {
        
        if let hours = self.loadJson(fileName: "grid-render-test") {
            
            self.arrMainData = hours
            self.sortArrayDatewise()
            self.collectionView.reloadData()
        }
    }
}
