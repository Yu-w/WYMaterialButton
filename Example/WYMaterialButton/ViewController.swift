//
//  ViewController.swift
//  WYMaterialButton
//
//  Created by Yu Wang on 09/24/2015.
//  Copyright (c) 2015 Yu Wang. All rights reserved.
//

import UIKit
import WYMaterialButton

class ViewController: UIViewController {

    @IBOutlet weak var blueButton: WYMaterialButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blueButton.addTarget(self, action: #selector(ViewController.buttonClicked), for: .touchUpInside)
    }
    
    func buttonClicked() {
        print("Thanks for playing the demo, plz give a star if you like!")
    }
    
}

