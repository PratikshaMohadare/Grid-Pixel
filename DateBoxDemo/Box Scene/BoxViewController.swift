//
//  BoxViewController.swift
//  DateBoxDemo
//
//  Created by Pratiksha Mohadare on 28/07/23.
//

import UIKit

class BoxViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var arrMainData = [MainData]()
    
    var kInterimCellPadding : CGFloat = 2.0
    var kLeftPadding : CGFloat = 40.0
    var kTopPadding : CGFloat = 20.0
    var kFirstColnWidthDiff : CGFloat = 15.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadViewData()
    }
}

extension BoxViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // For 15*24 matrix, add 1 column for legends i.e. 16
        if arrMainData.count > 15 {
            return 16
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // For 24 hours + 1 for legend
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Top Row UI Configuration
        if indexPath.section == 0 {
            let cell : TopCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCollectionViewCell", for: indexPath) as! TopCollectionViewCell
            cell.indexPath = indexPath
            cell.setLabelText()
            
            return cell
        } else {
            // First Column UI Configuration
            if indexPath.row == 0 {
                let cell : TextCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TextCollectionViewCell", for: indexPath) as! TextCollectionViewCell
                
                if arrMainData.count > indexPath.section {
                    cell.data = arrMainData[indexPath.section - 1]
                    cell.indexPath = indexPath
                    cell.setLabelText()
                }
                return cell

            } else {
                let cell : BoxCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoxCollectionViewCell", for: indexPath) as! BoxCollectionViewCell
                if arrMainData.count > indexPath.section {
                    
                    let sectionObj = arrMainData[indexPath.section - 1]
                    if sectionObj.hours.count >= indexPath.row {
                        let cellObj = sectionObj.hours[indexPath.row - 1]
                        cell.indexPath = indexPath
                        cell.recordCount = cellObj.recordCount
                        cell.setGridColor()
                    } else {
                        cell.indexPath = indexPath
                        cell.recordCount = 0
                        cell.setGridColor()
                    }
                }
                return cell
            }
        }
    }
}

extension BoxViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Top Row 
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cellsAcross: CGFloat = 24
                let spaceBetweenCells: CGFloat = 2
                let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross
                
                return CGSize(width: dim + 10, height: dim)
            }
            let cellsAcross: CGFloat = 25
            let spaceBetweenCells: CGFloat = 2
            let dim = (collectionView.bounds.width - kFirstColnWidthDiff - (cellsAcross) * spaceBetweenCells) / cellsAcross
            
            return CGSize(width: dim, height: dim)
        } else {
            // Left Column
            if indexPath.row == 0 {
                let sectionObj = arrMainData[indexPath.section - 1]
                let count = CGFloat(sectionObj.day.count) //[indexPath.row]

                let cellSize = kLeftPadding - (count * kInterimCellPadding)

                return CGSize(width:kLeftPadding, height: cellSize)
            } else {
                
                let cellsAcross: CGFloat = CGFloat(25)
                let spaceBetweenCells: CGFloat = kInterimCellPadding
                let dim = (collectionView.bounds.width - kFirstColnWidthDiff - cellsAcross * spaceBetweenCells) / cellsAcross
                
                return CGSize(width: dim, height: dim + 16)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return kInterimCellPadding
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return kInterimCellPadding
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        self.legendsCollectionHeight.constant = self.legendsCollectionView.contentSize.height
    }
}

