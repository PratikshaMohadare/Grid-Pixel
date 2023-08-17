//
//  BoxCollectionViewCell.swift
//  DateBoxDemo
//
//  Created by Pratiksha Mohadare on 28/07/23.
//

import UIKit

class BoxCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewColor: UIView!
    var recordCount = 0
    var indexPath = IndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setGridColor()
    }
    
    func setGridColor() {
        self.viewColor.backgroundColor = createColor(recordCount: CGFloat(recordCount), maxCount: CGFloat(1000))
        self.viewColor.layer.cornerRadius = 10.0
        self.viewColor.clipsToBounds = true
    }
    
    func createColor(recordCount: CGFloat, maxCount: CGFloat) -> UIColor {
        if recordCount == 0 {
            let color = UIColor.init(red: 219/255, green: 219/255, blue: 219/255, alpha: 1.0)
            return color
        }
        
        let alpha : CGFloat = recordCount / maxCount // * 100
        var color = UIColor(named: "Green Color")?.withAlphaComponent(CGFloat(alpha)) ?? .white
        
        return color
    }
}
