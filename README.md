### Swift2.x编写NavigationController动态缩放titleView

这两天看到一篇文章[iOS 关于navigationBar的一些..](http://www.jianshu.com/p/b2585c37e14b)中的动态缩放比较有意思,看了一下源码,然后用Swift写了一下,使用`storyboard`实现.

#### 效果图:

![](https://o449xphwj.qnssl.com/NavTopImage.gif)


#### 部分代码:

##### 设置滑动代理

```
/**
 设置滑动代理
 
 - parameter scrollView: scrollView description
 */
override func scrollViewDidScroll(scrollView: UIScrollView) {
    
    let offsetY = scrollView.contentOffset.y + tableView.contentInset.top
    
    if offsetY < 0 && offsetY >= -150 {
        topImageView.transform = CGAffineTransformMakeScale(1 + offsetY/0), 1 + offsetY/(-300))
    }
    else if (offsetY >= 0 && offsetY <= 165) {
        topImageView.transform = CGAffineTransformMakeScale(1 - offsetY/300, 1 fsetY/300);
    }
    else if (offsetY > 165) {
        topImageView.transform = CGAffineTransformMakeScale(0.45, 0.45);
    }
    else if (offsetY < -150) {
        topImageView.transform = CGAffineTransformMakeScale(1.5, 1.5);
    }
    
    var frame = topImageView.frame;
    frame.origin.y = 5;
    topImageView.frame = frame;
}
```
ps: 来自文章中的代码

##### 设置topImageView

```
override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    
    topBkView.backgroundColor = UIColor.clearColor()
    self.navigationItem.titleView = topBkView
    
    // 设置topImageView 圆型
    topImageView.layer.cornerRadius = topImageView.bounds.size.width / 2
    topImageView.layer.masksToBounds = true
    topImageView.layer.anchorPoint = CGPointMake(0.5, 0.5)
    
}
```

##### 下载demo了解更多(很简单😜)


