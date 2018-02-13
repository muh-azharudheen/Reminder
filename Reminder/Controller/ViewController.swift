//
//  ViewController.swift
//  Reminder
//
//  Created by MS1 on 2/13/18.
//  Copyright © 2018 muhAzharudheen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onTimerTapped(){
        print("Timer Tapped")
    }
    @IBAction func onDateTapped(){
        print("Date Tapped")
    }
    @IBAction func onLocationTapped(){
        print("Location Tapped")
    }

}
