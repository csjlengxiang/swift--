# swift-navigation-animationn-animation
首先是照着这个做的：http://www.jianshu.com/p/d39f7d22db6c<br> 

步骤是：<br> 
1、这个是重写了navigation control的动画方法，于是我是直接把delegate跟navigation放一块儿于是有了NavigationController.swift这个代码，这货主要就是完成了重写，并且把动画的动作hf放在里面了<br> 
2、把实在的动画放在PopAnimation.swift里<br> 
3、在后退滑动的ViewController2.swift中把手势动作打到NavigationController.swift<br> 

其实我感觉，感觉是不是动画具体代码跟手势判定放一起比较好<br> 
