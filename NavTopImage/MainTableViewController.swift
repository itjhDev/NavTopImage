//
//  MainTableViewController.swift
//  NavTopImage
//
//  Created by 宋立君 on 16/4/23.
//  Copyright © 2016年 itjh. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    @IBOutlet weak var topImageView: UIImageView!
    
    @IBOutlet var topBkView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
      
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        topBkView.backgroundColor = UIColor.clearColor()
        self.navigationItem.titleView = topBkView
        
        // 设置topImageView 圆型
        topImageView.layer.cornerRadius = topImageView.bounds.size.width / 2
        topImageView.layer.masksToBounds = true
        topImageView.layer.anchorPoint = CGPointMake(0.5, 0.5)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 30
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

//         Configure the cell...
        cell.textLabel?.text = "cell-> \(indexPath.row)"
        return cell
    }
    
    
    /**
     设置滑动代理
     
     - parameter scrollView: scrollView description
     */
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y + tableView.contentInset.top
        
        if offsetY < 0 && offsetY >= -150 {
            topImageView.transform = CGAffineTransformMakeScale(1 + offsetY/(-300), 1 + offsetY/(-300))
        }
        else if (offsetY >= 0 && offsetY <= 165) {
            topImageView.transform = CGAffineTransformMakeScale(1 - offsetY/300, 1 - offsetY/300);
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
    
    
    
    
    
    
}
