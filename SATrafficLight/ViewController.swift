//
//  ViewController.swift
//  SATrafficLight
//
//  Created by Sulabh Agarwal on 8/5/17.
//  Copyright © 2017 Sulabh Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trafficLightView: SATrafficLightView!

    let trafficLight = SATrafficLight()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        //Conforming to Delegates
        trafficLightView.delegate = self
        trafficLight.delegate = self
        //--Starting Traffic Light From Here--
        trafficLight.startTrafficLight()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


// Define SATrafficLightProtocol Functions here
extension ViewController : SATrafficLightProtocol {
    
    func trafficLightChangeToState(state: trafficLightTime) {
        
        trafficLightView.changeLightForState(state: state)
    }

}

// Define SATrafficLightViewProtocol Functions here
extension ViewController : SATrafficLightViewProtocol {
    
    func stopButtonPressed(_ sender: UIButton) {
        trafficLight.stopTrafficLight()
    }
    
    func resetButtonPressed(_ sender: UIButton) {
        
        trafficLight.resetTrafficLight()
    }
}

