//
//  ViewController.swift
//  test3DTouch
//
//  Created by Don Bytyqi on 3/26/16.
//  Copyright © 2016 Don Bytyqi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var forcePercentage: UILabel!
    
    var forceAm: CGFloat = 0.0
    var deviceIsCompatible = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        forcePercentage.text = "\(forceAm)"
        switch self.traitCollection.forceTouchCapability {
        case .Available: deviceIsCompatible = true
            forcePercentage.text = "0%"
        default:
            deviceIsCompatible = false
            forcePercentage.text = "Device not supported!"
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if deviceIsCompatible { touchAction(touches.first!) }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if deviceIsCompatible { touchAction(touches.first!) }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if deviceIsCompatible {
            forcePercentage.textColor = UIColor.blackColor()
            forcePercentage.text = "0%"
        }
    }
    
    func touchAction(touch:UITouch) {
        
        forceAm = touch.force/touch.maximumPossibleForce
        let percent = forceAm*100
        let relativePercent = String(format: "%.0f%%", percent)
        
        forcePercentage.text = relativePercent
        if percent >= 70 {
            forcePercentage.textColor = UIColor.redColor()
        }
        else {
            forcePercentage.textColor = UIColor.blackColor()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

