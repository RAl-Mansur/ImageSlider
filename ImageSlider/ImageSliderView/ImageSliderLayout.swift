//
//  ImageSliderLayout.swift
//  ImageSlider
//
//  Created by Ridwan Al-Mansur on 01/10/2018.
//  Copyright © 2018 Ridwan Al-Mansur. All rights reserved.
//

import UIKit

class ImageSliderLayout: UICollectionViewFlowLayout {

    let innerSpacing: CGFloat = 0.0

    override init() {
        super.init()
        self.scrollDirection = .horizontal
        self.minimumLineSpacing = innerSpacing
        self.minimumInteritemSpacing = innerSpacing
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override var itemSize: CGSize {
        set {
            self.itemSize = CGSize(width: collectionView!.frame.size.width, height: collectionView!.frame.size.height)
        }
        get {
            return CGSize(width: collectionView!.frame.size.width, height: collectionView!.frame.size.height)
        }
    }

}
