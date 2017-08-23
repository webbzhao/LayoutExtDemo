//
//  ViewController.swift
//  LayoutExtDemo
//
//  Created by webbzhao on 17/8/23.
//  Copyright © 2017年 WebbZhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    let view1:UIView = UIView()
    let view2:UIView = UIView()
    let view3:UIView = UIView()
    let view4:UIView = UIView()
    let view5:UIView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()

        view1.backgroundColor = UIColor.blue
        view2.backgroundColor = UIColor.gray
        view3.backgroundColor = UIColor.green
        view4.backgroundColor = UIColor.red
        view5.backgroundColor = UIColor.orange
        self.view.addSubview(view1)
        self.view.addSubview(view2)
        self.view.addSubview(view3)
        self.view.addSubview(view4)
        self.view.addSubview(view5)
        view1.translatesAutoresizingMaskIntoConstraints = false
        view2.translatesAutoresizingMaskIntoConstraints = false
        view3.translatesAutoresizingMaskIntoConstraints = false
        view4.translatesAutoresizingMaskIntoConstraints = false
        view5.translatesAutoresizingMaskIntoConstraints = false

        let spaceToParentView:CGFloat = 80
        let spaceToBrotherView:CGFloat = 20

        view.topAlign(view1, 64)
        view.leftAlign(view1, spaceToParentView)
        view1.ratioForVH(1.0)

        view2.sizeEqual(view1, 0, 0)
        view2.topEqual(view1, 0)
        view2.rightSpace(view1, spaceToBrotherView)

        view3.sizeEqual(view1, 0, 0)
        view3.topEqual(view1, 0)
        view3.rightSpace(view2, spaceToBrotherView)

        view4.sizeEqual(view1, 0, 0)
        view.topAlign(view4, 64)
        view4.rightSpace(view3, spaceToBrotherView)
        view.rightAlign(view4, spaceToParentView)

        view5.sizeEqual(view1, 0, 0)
        view5.leftEqual(view2, 0)
        view5.topSpace(view2, spaceToBrotherView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

