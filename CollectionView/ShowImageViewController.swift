//
//  ShowImageViewController.swift
//  CollectionView
//
//  Created by Mykhailo Romanovskyi on 04.02.2021.
//

import UIKit

class ShowImageViewController: UIViewController {

    @IBOutlet weak var currentImage: UIImageView!
    private var imageName: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentImage.image = UIImage(named: imageName)
    }
    
    func setImageName(name: String) {
        imageName = name
    }
}
