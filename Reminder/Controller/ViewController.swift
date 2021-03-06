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
        UNService.instance.Authorize()
        CLService.instance.authorize()
        
        NotificationCenter.default.addObserver(self, selector: #selector(didEnteredRegion), name: Notification.Name("internalNotification.enteredRegion"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleAction(_:)), name: Notification.Name("internalNotification.handleAction"), object: nil)
    }
    
    @IBAction func onTimerTapped(){
        AlertService.actinSheet(in: self, title: "5 seconds") {
            UNService.instance.timerRequest(with: 5)
        }
    }
    @IBAction func onDateTapped(){
        AlertService.actinSheet(in: self, title: "Some Future Time.") {
            var components = DateComponents()
            components.second = 0
            UNService.instance.dateRequest(with: components)
        }
    }
    @IBAction func onLocationTapped(){
        AlertService.actinSheet(in: self, title: "When I return") {
            CLService.instance.updateLocations()
        }
    }
    
    @objc
    private func didEnteredRegion(){
        UNService.instance.locationRequest()
    }
    
    @objc func handleAction(_ sender: Notification){
        guard let action = sender.object as? NotiificationActionID else { return }
        switch action {
        case .timer: print("Timer invoked")
        case .date: print("Date Invoked")
        case .location: changeBackgroundColor()
        }
    }
    
    private func changeBackgroundColor(){
        view.backgroundColor = UIColor.red
    }

}

