//
//  TopCollectionViewCell.swift
//  DateBoxDemo
//
//  Created by Pratiksha Mohadare on 28/07/23.
//

import UIKit

class TopCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblText: UILabel!
    var indexPath = IndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setLabelText() {
        if indexPath.row == 0 {
            self.lblText.text = "hour"
        } else {
            if indexPath.row % 2 == 1 {
                self.lblText.text = "\(indexPath.row - 1)"
            } else {
                self.lblText.text = ""
            }
        }
    }
}
