//
//  ImageSliderView.swift
//  ImageSlider
//
//  Created by Ridwan Al-Mansur on 01/10/2018.
//  Copyright © 2018 Ridwan Al-Mansur. All rights reserved.
//

import UIKit

class ImageSliderView: UIView {

    let images: [UIImage] = [
        UIImage(named: "Num1")!,
        UIImage(named: "Num2")!,
        UIImage(named: "Num3")!,
        UIImage(named: "Num4")!
    ]

    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView.init(frame: self.frame, collectionViewLayout: ImageSliderLayout())
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.isPagingEnabled = true
        cv.isUserInteractionEnabled = false
        cv.dataSource = self
        cv.delegate = self
        cv.register(ImageSliderCell.self, forCellWithReuseIdentifier: ImageSliderCell.id)
        return cv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }

    override var bounds: CGRect {
        didSet {
            collectionView.frame = bounds
        }
    }

    func commonSetup() {
        self.backgroundColor = .white
        self.addSubview(collectionView)
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
    }
}

// MARK:- Automate scroll
extension ImageSliderView {
    @objc func autoScroll(_ timer: Timer) {
        for cell in collectionView.visibleCells {
            guard let indexPath = collectionView.indexPath(for: cell) else { return }
            if indexPath.row < (images.count - 1) {
                let nextIndexPath = IndexPath.init(row: indexPath.row + 1, section: indexPath.section)
                collectionView.scrollToItem(at: nextIndexPath, at: .right, animated: true)
            } else {
                // start again
                let nextIndexPath = IndexPath.init(row: 0, section: indexPath.section)
                collectionView.scrollToItem(at: nextIndexPath, at: .right, animated: true)
            }
        }
    }
}


// MARK:- Collection View functions
extension ImageSliderView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageSliderCell.id, for: indexPath) as? ImageSliderCell else {
            return UICollectionViewCell()
        }
        cell.imageView.image = images[indexPath.row]
        cell.layer.shouldRasterize = true
        cell.layer.rasterizationScale = UIScreen.main.scale
        cell.imageView.setNeedsDisplay()
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

    }
}
