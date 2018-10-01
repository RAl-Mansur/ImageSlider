//
//  ImageSliderCell.swift
//  ImageSlider
//
//  Created by Ridwan Al-Mansur on 01/10/2018.
//  Copyright © 2018 Ridwan Al-Mansur. All rights reserved.
//

import UIKit

class ImageSliderCell: UICollectionViewCell {

    static let id = "imageSliderCell"

    let imageView: UIImageView = {
        let iv = UIImageView(frame: CGRect.zero)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.layer.masksToBounds = true
        iv.backgroundColor = .white
        return iv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: widthAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
