//
//  PopAnimation.swift
//  test滑动转场
//
//  Created by csj on 15/6/14.
//  Copyright (c) 2015年 csj. All rights reserved.
//

import UIKit

class PopAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    @objc func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval{
        return 0.25
    }
    @objc func animateTransition(transitionContext: UIViewControllerContextTransitioning){
        var from = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        var to = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var v = transitionContext.containerView()
        v.insertSubview(to.view, belowSubview: from.view)
        var d = self.transitionDuration(transitionContext)
        
        var bounds = to.view.bounds
        
        to.view.frame = CGRect(x: -bounds.size.width, y: 0, width: bounds.size.width, height: bounds.size.height)
        
        println(to.view.frame)
        
        UIView.animateWithDuration(d, animations: {
            from.view.transform = CGAffineTransformMakeTranslation(UIScreen.mainScreen().bounds.size.width, 0)
            to.view.transform = CGAffineTransformTranslate(to.view.transform, UIScreen.mainScreen().bounds.size.width, 0)
            }, completion: {
                (finish) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
            }
        )
    }
}
