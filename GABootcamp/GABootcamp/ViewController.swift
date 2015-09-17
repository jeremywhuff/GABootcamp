//
//  ViewController.swift
//  GABootcamp
//
//  Created by Jeremy Huff on 9/17/15.
//  Copyright © 2015 Jeremy Huff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        redView.backgroundColor = UIColor.redColor()
        self.view.addSubview(redView)
    }
}

