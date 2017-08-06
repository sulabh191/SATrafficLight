//
//  SATrafficLight.swift
//  SATrafficLight
//
//  Created by Sulabh Agarwal on 8/5/17.
//  Copyright © 2017 Sulabh Agarwal. All rights reserved.
//

import Foundation

enum trafficLightTime : TimeInterval {
    
    case red  = 3
    case yellow = 2
    case green = 1
}

protocol SATrafficLightProtocol : class {
    
    func trafficLightChangeToState(state: trafficLightTime)
}

class SATrafficLight : NSObject {
    
    //MARK: Vars for default trafficLight State's(current and next)
    var currentTrafficState : trafficLightTime = .red
    var nextTrafficState : trafficLightTime = .green
    //MARK: Other Vars
    var timer : RepeatingTimerManager?
    weak var delegate:SATrafficLightProtocol?
    
    //Mark:  Initializer
    override init() {
        
    }
    
    //Mark: Instance functions
    
    /**
     -description : Call Timer on TrafficLightTime Enums and store current Traffic Light State into var "currentTrafficState"
     
     -paramater: trafficLightTime (with default state red for entry point)
     **/
    func startTrafficLight(time:trafficLightTime = .red) {
        
        timer = RepeatingTimerManager(target: self, selector: #selector(SATrafficLight.switchTrafficLightToNextState), frequency: time.rawValue)
        currentTrafficState = time
        print("Current Traffic Light State: \(currentTrafficState)")
    }
    
    
    /**
     - description : call delegate function to notify for next Traffic State
       and invoke startTrafficLight again for recursive process.
    **/
    func switchTrafficLightToNextState() {

        switch currentTrafficState {
        case .red:
            nextTrafficState = .green
        case .yellow :
            nextTrafficState = .red
        case .green :
            nextTrafficState = .yellow
        }
        
        //delegate function to update on trafficState
        delegate?.trafficLightChangeToState(state: nextTrafficState)
        //invoke timer for updated trafficState enum
        startTrafficLight(time: nextTrafficState)
    }
}
