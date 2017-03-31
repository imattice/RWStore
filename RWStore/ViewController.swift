//
//  ViewController.swift
//  RWStore
//
//  Created by Ike Mattice on 3/30/17.
//  Copyright © 2017 Ike Mattice. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var productsButton: NSPopUpButton!
    
    private var products = [Product]()
    var selectedProduct: Product?
    
    private var overviewViewController: OverviewController?
    private var detailViewController: DetailViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let filePath = Bundle.main.path(forResource: "Products", ofType: "plist") {
            products = Product.productsList(filePath)
        }
        
        productsButton.removeAllItems()
        
        for product in products {
            productsButton.addItem(withTitle: product.title)
        }
        
        selectedProduct = products[0]
        productsButton.selectItem(at: 0)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        guard let tabViewController = segue.destinationController as? NSTabViewController else {return}
        
        for controller in tabViewController.childViewControllers {
            if let controller  = controller as? OverviewController {
                overviewViewController = controller
                overviewViewController?.selectedProduct = selectedProduct
            } else if let controller = controller as? DetailViewController {
                detailViewController = controller
                detailViewController?.selectedProduct = selectedProduct
            }
        }
    }


    @IBAction func valueChanged(_ sender: NSPopUpButton) {
        if let bookTitle = sender.selectedItem?.title,
            let index = products.index(where: {$0.title == bookTitle}) {
            selectedProduct = products[index]
            
            overviewViewController?.selectedProduct = selectedProduct
            detailViewController?.selectedProduct = selectedProduct
        }
    }
}

