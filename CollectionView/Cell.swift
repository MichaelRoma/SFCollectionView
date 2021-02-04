//
//  Cell.swift
//  CollectionView
//
//  Created by Mykhailo Romanovskyi on 04.02.2021.
//

import UIKit

class Cell: UICollectionViewCell {
    @IBOutlet weak var tempImageView: UIImageView!
    @IBOutlet weak var smileImageView: UIImageView!
    
    func setTemperatureImage(tempName: String) {
        tempImageView.image = UIImage(named: tempName)
    }
    
    func setSmileImage(smileName: String) {
        smileImageView.image = UIImage(named: smileName)
    }
}
