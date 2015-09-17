//
//  ViewController.swift
//  GABootcamp
//
//  Created by Jeremy Huff on 9/17/15.
//  Copyright © 2015 Jeremy Huff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var coloredView: UIView!
    
    @IBAction func changeColorButtonPushed(sender: AnyObject) {
        if coloredView.backgroundColor == UIColor.redColor() {
            coloredView.backgroundColor = UIColor.greenColor()
        }
        else {
            coloredView.backgroundColor = UIColor.redColor()
        }
    }
}

