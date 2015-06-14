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
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.Pop {
            return PopAnimation()
        }
        return nil
    }
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if animationController .isKindOfClass(PopAnimation){
            return self.pe
        }
        return nil
    }
}

// mark hf
extension NavigationController{
    func hf(sender: UIPanGestureRecognizer) {
        var p = sender.translationInView(self.view).x / self.view.bounds.width
        p = min(1, max(0, p))
        println(p)
        
        if sender.state == UIGestureRecognizerState.Began{
            self.pe = UIPercentDrivenInteractiveTransition()
            self.popViewControllerAnimated(true)
        }
        else if sender.state == UIGestureRecognizerState.Changed{
            self.pe.updateInteractiveTransition(p)
        }
        else if sender.state == UIGestureRecognizerState.Ended || sender.state == UIGestureRecognizerState.Cancelled{
            if p > 0.5{
                self.pe.finishInteractiveTransition()
            } else {
                self.pe.cancelInteractiveTransition()
            }
            self.pe = nil
        }
    }
}