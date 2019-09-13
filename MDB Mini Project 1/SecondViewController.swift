//
//  SecondViewController.swift
//  MDB Mini Project 1
//
//  Created by Matthew Lacayo on 9/11/19.
//  Copyright © 2019 Matthew Lacayo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var currentImage = Constants.getImageFor(name: Constants.names[0])
    
    var timer: Timer?
    var runCount = 0
    var currentName = "none"
    var nameList = [String]()
    var last3Results = [String]()
    var score = 0
    var currentStreak = 0
    var longestStreak = 0
    var isPaused = true
    
    
    @IBAction func clickStats(_ sender: Any) {
        print("HEY")
    }
    
    
    @IBOutlet weak var scoreText: UILabel!
    @IBOutlet weak var memberImage: UIImageView!
    
    
    @IBOutlet weak var member0: UIButton!
    @IBAction func member0Click(_ sender: Any) {
        checkIfCorrect(button: member0)
    }
        
        
    
    @IBOutlet weak var member1: UIButton!
    @IBAction func member1Click(_ sender: Any) {
       checkIfCorrect(button: member1)
    }
    
    @IBOutlet weak var member2: UIButton!
    @IBAction func member2Click(_ sender: Any) {
        checkIfCorrect(button: member2)
    }
    
    @IBOutlet weak var member3: UIButton!
    @IBAction func member3Click(_ sender: Any) {
       checkIfCorrect(button: member3)
    }
    
    @IBOutlet weak var startStopButton: UIButton!
    
    @IBAction func clickStartStop(_ sender: Any) {
        isPaused = !isPaused
        if (isPaused == false){
            
            startStopButton.setTitle("Stop", for: .normal)
            memberImage.isHidden = false
            member0.isHidden = false
            member1.isHidden = false
            member2.isHidden = false
            member3.isHidden = false
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        }
        else{
            
            timer?.invalidate()
            
            startStopButton.setTitle("Start", for: .normal)
            memberImage.isHidden = true
            member0.isHidden = true
            member1.isHidden = true
            member2.isHidden = true
            member3.isHidden = true
            
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateScreen()
        timer?.invalidate()
        memberImage.isHidden = true
        member0.isHidden = true
        member1.isHidden = true
        member2.isHidden = true
        member3.isHidden = true
        // Do any additional setup after loading the view.
        
        
    }
    
    func populateScreen() {
        
        makeButtonsClickable()
        let index = Int.random(in: 0 ..< Constants.names.count)
        currentName = Constants.names[index]
        currentImage = Constants.getImageFor(name: currentName)
        memberImage.image = currentImage
        nameList = [String]()
        nameList.append(currentName)
        for _ in 1...3{
            var randName = Constants.names[Int.random(in: 0 ..< Constants.names.count)]
            while nameList.contains(randName) {
                randName = Constants.names[Int.random(in: 0 ..< Constants.names.count)]
            }
            nameList.append(randName)
        }
        nameList = nameList.shuffled()
        member0.setTitle(nameList[0], for: .normal)
        member1.setTitle(nameList[1], for: .normal)
        member2.setTitle(nameList[2], for: .normal)
        member3.setTitle(nameList[3], for: .normal)
        runCount = 0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    
    
    
    func checkIfCorrect(button: UIButton){
        makeButtonsNonClickable()
        timer?.invalidate()
        
        
        if(button.titleLabel!.text == currentName){
            score += 1
            currentStreak += 1
            last3Results.append("Correct")
            if(currentStreak > longestStreak){
                longestStreak = currentStreak
            }
            scoreText.text = "Score: \(score)"
            button.setTitleColor(UIColor.green, for: .normal)
        }
        else{
            currentStreak = 0
            last3Results.append("Incorrect")
            button.setTitleColor(UIColor.red, for: .normal)
        }
        
        if(last3Results.count >= 4){
            last3Results.remove(at: 0)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000)) {
            button.setTitleColor(UIColor.black, for: .normal)
            self.populateScreen()
        }
        
        
    }
    
    @objc func fireTimer() {
        runCount += 1
        
        if runCount == 5 {
            timer?.invalidate()
            populateScreen()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "toStats":
            if(isPaused == false){
                clickStartStop(self)
            }
            let destinationVC = segue.destination as! StatsViewController
            destinationVC.longestStreak = longestStreak
            destinationVC.last3Results = last3Results

            
            

            
            
        default:
            print("unexpected segue identifier")
        }
    }
    
    func makeButtonsNonClickable(){
        member0.isEnabled = false
        member1.isEnabled = false
        member2.isEnabled = false
        member3.isEnabled = false
    }
    
    func makeButtonsClickable(){
        member0.isEnabled = true
        member1.isEnabled = true
        member2.isEnabled = true
        member3.isEnabled = true
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
