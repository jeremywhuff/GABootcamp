//
//  ViewController.swift
//  GABootcamp
//
//  Created by Jeremy Huff on 9/17/15.
//  Copyright © 2015 Jeremy Huff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let model: GAModel = GAModel()

    @IBOutlet weak var coloredView: UIView!
    
    @IBAction func changeColorButtonPushed(sender: AnyObject) {
        if coloredView.backgroundColor == UIColor.redColor() {
            coloredView.backgroundColor = UIColor.greenColor()
        }
        else {
            coloredView.backgroundColor = UIColor.redColor()
        }
    }
    
    @IBAction func segueButtonPushed(sender: AnyObject) {
        model.makeRequest { () -> () in
            self.performSegueWithIdentifier("manualSegue", sender: self)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        model.setupLocationManager()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationVTVC = segue.destinationViewController as? VenueTableViewController {
            destinationVTVC.model = model
        }
    }
}

