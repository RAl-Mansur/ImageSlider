//
//  ViewController.swift
//  ImageSlider
//
//  Created by Ridwan Al-Mansur on 27/09/2018.
//  Copyright © 2018 Ridwan Al-Mansur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.view.safeAreaLayoutGuide.topAnchor
        } else {
            return self.view.topAnchor
        }
    }

    let sliderView: ImageSliderView = {
        let view = ImageSliderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(sliderView)
        setupLayout()
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            sliderView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            sliderView.heightAnchor.constraint(equalToConstant: (self.view.frame.height / 2)),
            sliderView.topAnchor.constraint(equalTo: safeTopAnchor),
            sliderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            sliderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }

}


