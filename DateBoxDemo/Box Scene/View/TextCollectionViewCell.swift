//
//  TextCollectionViewCell.swift
//  DateBoxDemo
//
//  Created by Pratiksha Mohadare on 28/07/23.
//

import UIKit

class TextCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblText: UILabel!
    var data : MainData?
    var indexPath = IndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setLabelText() {
        if let sectionObj = data {
            if sectionObj.hours.count > indexPath.row {
                let cellObj = sectionObj.hours[indexPath.row]
                self.lblText.text = calculateDate(hourText: cellObj.hour)
            }
        }
    }
    
    func calculateDate(hourText: String) -> String {
        let arrHour = Array(hourText)
        
        var year : String = ""
        year.append(arrHour[0])
        year.append(arrHour[1])
        year.append(arrHour[2])
        year.append(arrHour[3])

        var month : String = ""
        month.append(arrHour[4])
        month.append(arrHour[5])
        
        var date : String = ""
        if arrHour[6] != "0" {
            date.append(arrHour[6])
        }
        date.append(arrHour[7])
        
        let finalString = date + getSuffix(day: Int(date) ?? 0)
        return finalString
    }

    func getSuffix(day: Int) -> String {
        switch day {
        case 11...13: return "th"
        default:
            switch day % 10 {
            case 1: return "st"
            case 2: return "nd"
            case 3: return "rd"
            default: return "th"
            }
        }
    }
}
