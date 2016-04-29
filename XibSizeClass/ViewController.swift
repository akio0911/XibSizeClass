//
//  ViewController.swift
//  XibSizeClass
//
//  Created by akio0911 on 2016/04/29.
//  Copyright © 2016年 akio0911. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var greenView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        guard let customView = NSBundle.mainBundle()
            .loadNibNamed("CustomView", owner: self, options: nil).first as? UIView else {
            return
        }
        greenView.addSubview(customView)

        customView.translatesAutoresizingMaskIntoConstraints = false
        
        let attributes: [NSLayoutAttribute] = [.Top, .Leading, .Bottom, .Trailing]
        let constraints = attributes.map { attribute in
            return NSLayoutConstraint(item: customView, attribute: attribute,
                relatedBy: .Equal,
                toItem: greenView, attribute: attribute,
                multiplier: 1.0, constant: 0.0)
        }
        greenView.addConstraints(constraints)
    }
}
