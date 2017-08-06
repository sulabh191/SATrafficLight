//
//  SATrafficLightView.swift
//  SATrafficLight
//
//  Created by Sulabh Agarwal on 8/5/17.
//  Copyright © 2017 Sulabh Agarwal. All rights reserved.
//

import UIKit

protocol SATrafficLightViewProtocol : class {
    
    func stopButtonPressed(_ sender: UIButton)
    func resetButtonPressed(_ sender: UIButton)
}

//Extending Protocol with Empty Definition to make as Optional Protocol
extension SATrafficLightProtocol {
    
    func stopButtonPressed(_ sender: UIButton) {}
    func resetButtonPressed(_ sender: UIButton) {}
}


class SATrafficLightView: UIView {

    //MARK: IBOutlet's declaration
    @IBOutlet var contentView: UIView!

    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    //MARK: Vars declaration
    weak var delegate : SATrafficLightViewProtocol?
    
    //MARK:Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        
        Bundle.main.loadNibNamed("SATrafficLightView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight , .flexibleWidth]
        
        defaultTrafficLightState()
        
        redLight.layer.cornerRadius = 25.0
        yellowLight.layer.cornerRadius = 25.0
        greenLight.layer.cornerRadius = 25.0
        
    }
    
    //MARK: Instance functions
    func defaultTrafficLightState() {
        redLight.alpha = 1.0
        yellowLight.alpha = 0.5
        greenLight.alpha = 0.5
    }
    
    func changeLightForState(state:trafficLightTime) {
        switch state {
        case .red:
            redLight.alpha = 1.0
            yellowLight.alpha = 0.5
            greenLight.alpha = 0.5
        case .yellow :
            redLight.alpha = 0.5
            yellowLight.alpha = 1.0
            greenLight.alpha = 0.5
        case .green :
            redLight.alpha = 0.5
            yellowLight.alpha = 0.5
            greenLight.alpha = 1.0
        }
    }
    
    @IBAction func stopButtonAction(_ sender: UIButton) {
        delegate?.stopButtonPressed(sender)
    }
    
    @IBAction func resetButtonAction(_ sender: UIButton) {
        delegate?.resetButtonPressed(sender)
    }
}
