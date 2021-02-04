//
//  ViewController.swift
//  CollectionView
//
//  Created by Mykhailo Romanovskyi on 04.02.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionViewOne: UICollectionView!
    @IBOutlet weak var collectionViewTwo: UICollectionView!
    private let arrayTemperature = [
        "temp.green",
        "temp.blackGreen",
        "temp.lightYellow",
        "temp.darkYellow",
        "temp.orange",
        "temp.red"
    ]
    
    private let arraySmile = [
        "bad",
        "nice",
        "favorite",
        "notPleasant",
        "hate",
        "routine"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewOne.delegate = self
        collectionViewOne.dataSource = self
        collectionViewTwo.delegate = self
        collectionViewTwo.dataSource = self
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewOne {
          return arrayTemperature.count
        }
        if collectionView == collectionViewTwo {
          return arraySmile.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionViewOne{
          if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellOne", for: indexPath) as? Cell {
            let imageName = arrayTemperature[indexPath.item]
            cell.setTemperatureImage(tempName: imageName)
            return cell
          }
        }
        if collectionView == collectionViewTwo{
          if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellTwo", for: indexPath) as? Cell {
            let imageName = arraySmile[indexPath.item]
            cell.setSmileImage(smileName: imageName)
            return cell
          }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ShowImageVC") as? ShowImageViewController else { return }
        
        var currentSelectedImage: String!
        
        if collectionView == collectionViewOne{
          currentSelectedImage = arrayTemperature[indexPath.item]
        }
     
        if collectionView == collectionViewTwo{
          currentSelectedImage = arraySmile[indexPath.item]
        }
        
        vc.setImageName(name: currentSelectedImage)
        present(vc, animated: true, completion: nil)
    }
}
