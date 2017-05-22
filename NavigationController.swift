//
//  NavigationController.swift
//  test滑动转场
//
//  Created by csj on 15/6/14.
//  Copyright (c) 2015年 csj. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController, UINavigationControllerDelegate {
    
    var pe: UIPercentDrivenInteractiveTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
}
// mark UINavigationControllerDelegate
extension NavigationController{
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.pop {
            return PopAnimation()
        }
        if operation == UINavigationControllerOperation.push {
            return AppearAnimation()
        }
        return nil
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if animationController .isKind(of: PopAnimation.self){
            return self.pe
        }
        return nil
    }
}

// mark hf
extension NavigationController{
    func hf(_ sender: UIPanGestureRecognizer) {
        var p = sender.translation(in: self.view).x / self.view.bounds.width
        p = min(1, max(0, p))
//        println(p)
        
        if sender.state == UIGestureRecognizerState.began{
            self.pe = UIPercentDrivenInteractiveTransition()
            self.popViewController(animated: true)
        }
        else if sender.state == UIGestureRecognizerState.changed{
            self.pe.update(p)
        }
        else if sender.state == UIGestureRecognizerState.ended || sender.state == UIGestureRecognizerState.cancelled{
            if p > 0.5{
                self.pe.finish()
            } else {
                self.pe.cancel()
            }
            self.pe = nil
        }
    }
}
