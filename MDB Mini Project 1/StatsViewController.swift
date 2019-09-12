//
//  StatsViewController.swift
//  MDB Mini Project 1
//
//  Created by Matthew Lacayo on 9/11/19.
//  Copyright © 2019 Matthew Lacayo. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    var last3Results = [String]()
    var longestStreak = 0
    
    @IBOutlet weak var last3ResultsLabel: UILabel!
    
    @IBOutlet weak var longestStreakLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        last3ResultsLabel.text = "Last Results: \( last3Results.description)"
        longestStreakLabel.text = "Longest Streak: \( String(longestStreak))"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
