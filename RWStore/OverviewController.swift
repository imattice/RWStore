//
//  OverviewController.swift
//  RWStore
//
//  Created by Ike Mattice on 3/30/17.
//  Copyright © 2017 Ike Mattice. All rights reserved.
//

import Cocoa

class OverviewController: NSViewController {
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var priceLabel: NSTextField!
    @IBOutlet weak var descriptionLabel: NSTextField!
    @IBOutlet weak var productImageView: NSImageView!

    let numberFormatter = NumberFormatter()
    
    var selectedProduct: Product? {
        didSet {
            updateUI()
        }
    }
    private func updateUI() {
        if isViewLoaded {
            if let product = selectedProduct {
                productImageView.image = product.image
                titleLabel.stringValue = product.title
                priceLabel.stringValue = numberFormatter.string(from: product.price) ?? "n/a"
                descriptionLabel.stringValue = product.descriptionText
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        numberFormatter.numberStyle = .currency
    }
    override func viewWillAppear() {
        super.viewWillAppear()
        updateUI()
    }
}
