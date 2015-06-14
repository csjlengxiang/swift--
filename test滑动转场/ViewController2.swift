//
//  ViewController2.swift
//  test滑动转场
//
//  Created by csj on 15/6/14.
//  Copyright (c) 2015年 csj. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    var c :UIPanGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        c = UIPanGestureRecognizer(target: self.navigationController as! NavigationController, action: "hf:")
        
        self.view.addGestureRecognizer(c)
    }
}
