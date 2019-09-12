//
//  ViewController.swift
//  MDB Mini Project 1
//
//  Created by Matthew Lacayo on 9/11/19.
//  Copyright © 2019 Matthew Lacayo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toMainScreen", sender: nil)
    }
    
}

