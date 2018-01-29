//
//  HomeVC.swift
//  MyApp
//
//  Created by 郑超华 on 2018/1/27.
//  Copyright © 2018年 郑超华. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var Banner: LBCycleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Banner.timeInterval = 3
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.Banner.setUrlsGroup(["http://t.cn/RYMuvvn","http://t.cn/RYVfnEO","http://t.cn/RYVf1fd","http://t.cn/RYVfgeI","http://t.cn/RYVfsLo"])
        }
        Banner.pageControlItemSize = CGSize(width: 16, height: 4)
        Banner.pageControlCurrentItemSize = CGSize(width: 10, height: 10)
        Banner.pageControlIndictirColor = UIColor.white
        Banner.pageControlCurrentIndictirColor = UIColor.red
        Banner.pageControlHeight = (Banner.frame.size.height-90*1.3)/2
        Banner.itemSize = CGSize(width: 240, height: 130)
        Banner.itemZoomScale = 1.2
        Banner.didSelectedItem = {
            print("Banner didSelectedItem:  \($0)")
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
