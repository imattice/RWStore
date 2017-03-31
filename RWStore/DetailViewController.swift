//
//  DetailViewController.swift
//  RWStore
//
//  Created by Ike Mattice on 3/31/17.
//  Copyright © 2017 Ike Mattice. All rights reserved.
//

import Cocoa

class DetailViewController: NSViewController {

    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var descriptionLabel: NSTextField!
    @IBOutlet weak var audienceLabel: NSTextField!
    @IBOutlet weak var productImageView: NSImageView!
    
    var selectedProduct: Product? {
        didSet {
            updateUI()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    override func viewWillAppear() {
        super.viewWillAppear()
        updateUI()
    }
    
    private func updateUI() {
        if isViewLoaded {
            if let product = selectedProduct {
                productImageView.image = product.image
                titleLabel.stringValue = product.title
                descriptionLabel.stringValue = product.descriptionText
                audienceLabel.stringValue = product.audience
            }
        }
    }
    
}
