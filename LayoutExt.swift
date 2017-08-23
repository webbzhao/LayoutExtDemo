/*!

 @header LayoutExt.swift  视图的约束扩展

 @abstract 该类是对UIView的扩展，目标是封装出一个方便简洁的代码约束类

 @author Created by webbzhao on 17/08/22.

 @version 1.0.0 Creation

 */
import Foundation
import UIKit

/*!

 @class LayoutExt    该扩展是对UIView的扩展,目标是封装出一个方便简洁的代码约束类
 
 @abstract 该扩展是对UIView的扩展,目标是封装出一个方便简洁的代码约束类

 */
extension UIView{  //视图与子视图之间的约束

    /// 子视图填充满父级视图
    ///
    /// - parameter subView: 子视图
    /// - returns : 无返回值
    func fillInSuperView(_ subView:UIView) -> Void {
        let horizontalConstraintStr = "H:|[subView]|"
        let verticalConstraintStr   = "V:|[subView]|"
        let viewsDict = ["subView":subView]

        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintStr, options: .directionLeadingToTrailing, metrics: nil, views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintStr, options: .directionLeadingToTrailing, metrics: nil, views: viewsDict))
    }

    /// 子视图在父级视图中水平居中
    ///
    /// - parameter subView: 子视图
    /// - parameter offset:  水平居中的偏移量
    /// - returns : 无返回值
    func hCenter(_ subView:UIView,_ offset:CGFloat) -> Void {
        self.addConstraint(NSLayoutConstraint(item: subView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: offset))
    }

    /// 子视图在父级视图中水平居中
    ///
    /// - parameter subView: 子视图
    /// - parameter offset:  水平居中的偏移量
    /// - parameter width:  子视图的宽度
    /// - returns : 无返回值
    func hCenter(_ subView:UIView,_ offset:CGFloat,_ width:CGFloat) -> Void {
        let horizontalConstraintStr = "H:[subView(\(width))]"
        let viewsDict = ["subView":subView]
        subView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintStr, options: .alignAllCenterX, metrics: nil, views: viewsDict))
        self.addConstraints([NSLayoutConstraint(item: subView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: offset)])
    }

    /// 子视图在父级视图中垂直居中
    ///
    /// - parameter subView: 子视图
    /// - parameter offset:  垂直居中的偏移量
    /// - returns : 无返回值
    func vCenter(_ subView:UIView,_ offset:CGFloat) -> Void {
        self.addConstraint(NSLayoutConstraint(item: subView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: offset))
    }

    /// 子视图在父级视图中垂直居中
    ///
    /// - parameter subView: 子视图
    /// - parameter offset:  垂直居中的偏移量
    /// - parameter height:  子视图的高度
    /// - returns : 无返回值
    func vCenter(_ subView:UIView,_ offset:CGFloat,_ height:CGFloat) -> Void {
        let horizontalConstraintStr = "H:[subView(\(height))]"
        let viewsDict = ["subView":subView]
        subView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintStr, options: .alignAllCenterY, metrics: nil, views: viewsDict))
        self.addConstraints([NSLayoutConstraint(item: subView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: offset)])
    }

    /// 子视图在父级视图中居中
    ///
    /// - parameter subView: 子视图
    /// - parameter xOffset:  水平居中的偏移量
    /// - parameter yOffset:  垂直居中的偏移量
    /// - returns : 无返回值
    func center(_ subView:UIView,_ xOffset:CGFloat,_ yOffset:CGFloat) -> Void {
        self.addConstraints([NSLayoutConstraint(item: subView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: xOffset),NSLayoutConstraint(item: subView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: yOffset)])
    }

    /// 子视图在父级视图中居中
    ///
    /// - parameter subView: 子视图
    /// - parameter xOffset:  水平居中的偏移量
    /// - parameter yOffset:  垂直居中的偏移量
    /// - parameter size:  子视图大小
    /// - returns : 无返回值
    func center(_ subView:UIView,_ xOffset:CGFloat,_ yOffset:CGFloat,_ size:CGSize) -> Void {
        let horizontalConstraintStr = "H:[subView(\(size.width))]"
        let verticalConstraintStr = "V:[subView(\(size.height))]"
        let viewsDict = ["subView":subView]
        subView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintStr, options: .alignAllCenterX, metrics: nil, views: viewsDict))
        subView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintStr, options: .alignAllCenterY, metrics: nil, views: viewsDict))
        self.addConstraints([NSLayoutConstraint(item: subView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: xOffset)])
        self.addConstraints([NSLayoutConstraint(item: subView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: yOffset)])
    }

    /// 子视图离父级视图左边距的距离
    ///
    /// - parameter subView: 子视图
    /// - parameter leftOffset:  向右的偏移量
    /// - returns : 无返回值
    func leftAlign(_ subView:UIView,_ leftOffset:CGFloat) -> Void {
        let horizontalConstraintStr = "H:|-space-[subView]"
        let metrices = ["space":leftOffset]

        let viewsDict = ["subView":subView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
    }

    /// 子视图离父级视图左边距的距离
    ///
    /// - parameter subView: 子视图
    /// - parameter leftOffset:  向右的偏移量
    /// - parameter width:  子视图的宽度
    /// - returns : 无返回值
    func leftAlign(_ subView:UIView,_ leftOffset:CGFloat,_ width:CGFloat) -> Void {
        let horizontalConstraintStr = "H:|-space-[subView(\(width))]"
        let metrices = ["space":leftOffset]

        let viewsDict = ["subView":subView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
    }

    /// 子视图离父级视图右边距的距离
    ///
    /// - parameter subView: 子视图
    /// - parameter rightOffset:  向左的偏移量
    /// - returns : 无返回值
    func rightAlign(_ subView:UIView,_ rightOffset:CGFloat) -> Void {
        let horizontalConstraintStr = "H:[subView]-space-|"
        let metrices = ["space":rightOffset]

        let viewsDict = ["subView":subView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
    }

    /// 子视图离父级视图右边距的距离
    ///
    /// - parameter subView: 子视图
    /// - parameter rightOffset:  向左的偏移量
    /// - parameter width:  子视图的宽度
    /// - returns : 无返回值
    func rightAlign(_ subView:UIView,_ rightOffset:CGFloat,_ width:CGFloat) -> Void {
        let horizontalConstraintStr = "H:[subView(\(width))]-space-|"
        let metrices = ["space":rightOffset]

        let viewsDict = ["subView":subView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
    }

    /// 子视图离父级视图上边距的距离
    ///
    /// - parameter subView: 子视图
    /// - parameter topOffset:  向下的偏移量
    /// - returns : 无返回值
    func topAlign(_ subView:UIView,_ topOffset:CGFloat) -> Void {
        let verticalConstraintStr = "V:|-space-[subView]"
        let metrices = ["space":topOffset]

        let viewsDict = ["subView":subView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintStr, options: .alignAllTop, metrics: metrices, views: viewsDict))
    }

    /// 子视图离父级视图上边距的距离
    ///
    /// - parameter subView: 子视图
    /// - parameter topOffset:  向下的偏移量
    /// - parameter height:  子视图的高度
    /// - returns : 无返回值
    func topAlign(_ subView:UIView,_ topOffset:CGFloat,_ height:CGFloat) -> Void {
        let verticalConstraintStr = "V:|-space-[subView(\(height))]"
        let metrices = ["space":topOffset]

        let viewsDict = ["subView":subView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintStr, options: .alignAllTop, metrics: metrices, views: viewsDict))
    }

    /// 子视图离父级视图下边距的距离
    ///
    /// - parameter subView: 子视图
    /// - parameter bottomOffset:  向上的偏移量
    /// - parameter height:  子视图的高度
    /// - returns : 无返回值
    func bottomAlign(_ subView:UIView,_ bottomOffset:CGFloat) -> Void {
        let verticalConstraintStr = "V:[subView]-space-|"
        let metrices = ["space":bottomOffset]

        let viewsDict = ["subView":subView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintStr, options: .alignAllTop, metrics: metrices, views: viewsDict))
    }

    /// 子视图离父级视图下边距的距离
    ///
    /// - parameter subView: 子视图
    /// - parameter bottomOffset:  向上的偏移量
    /// - parameter height:  子视图的高度
    /// - returns : 无返回值
    func bottomAlign(_ subView:UIView,_ bottomOffset:CGFloat,_ height:CGFloat) -> Void {
        let verticalConstraintStr = "V:[subView(\(height))]-space-|"
        let metrices = ["space":bottomOffset]

        let viewsDict = ["subView":subView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintStr, options: .alignAllTop, metrics: metrices, views: viewsDict))
    }

    /// 子视图离父级视图左上边距的距离
    ///
    /// - parameter subView: 子视图
    /// - parameter leftOffset:  向右的偏移量
    /// - parameter topOffset:  向下的偏移量
    /// - returns : 无返回值
    func leftTopAlign(_ subView:UIView,_ leftOffset:CGFloat, _ topOffset:CGFloat) -> Void {
        let horizontalConstraintStr = "H:|-space0-[subView]"
        let verticalConstraintStr = "V:|-space1-[subView]"
        let metrices = ["space0":leftOffset,"space1":topOffset]

        let viewsDict = ["subView":subView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
    }

    /// 子视图离父级视图左上边距的距离
    ///
    /// - parameter subView: 子视图
    /// - parameter leftOffset:  向右的偏移量
    /// - parameter topOffset:  向下的偏移量
    /// - parameter size:  子视图的大小
    /// - returns : 无返回值
    func leftTopAlign(_ subView:UIView,_ leftOffset:CGFloat, _ topOffset:CGFloat,_ size:CGSize) -> Void {
        let horizontalConstraintStr = "H:|-space0-[subView(\(size.width))]"
        let verticalConstraintStr = "V:|-space1-[subView(\(size.height))]"
        let metrices = ["space0":leftOffset,"space1":topOffset]

        let viewsDict = ["subView":subView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
    }

    /// 子视图离父级视图左下边距的距离
    ///
    /// - parameter subView: 子视图
    /// - parameter leftOffset:  向右的偏移量
    /// - parameter bottomOffset:  向上的偏移量
    /// - returns : 无返回值
    func leftBottomAlign(_ subView:UIView,_ leftOffset:CGFloat, _ bottomOffset:CGFloat) -> Void {
        let horizontalConstraintStr = "H:|-space0-[subView]"
        let verticalConstraintStr = "V:|-space1-[subView]"
        let metrices = ["space0":leftOffset,"space1":bottomOffset]

        let viewsDict = ["subView":subView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
    }

    /// 子视图离父级视图左下边距的距离
    ///
    /// - parameter subView: 子视图
    /// - parameter leftOffset:  向右的偏移量
    /// - parameter bottomOffset:  向上的偏移量
    /// - parameter size:  子视图的大小
    /// - returns : 无返回值
    func leftbottomAlign(_ subView:UIView,_ leftOffset:CGFloat, _ bottomOffset:CGFloat,_ size:CGSize) -> Void {
        let horizontalConstraintStr = "H:|-space0-[subView(\(size.width))]"
        let verticalConstraintStr = "V:|-space1-[subView(\(size.height))]"
        let metrices = ["space0":leftOffset,"space1":bottomOffset]

        let viewsDict = ["subView":subView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
    }

    /// 子视图离父级视图左右边距的距离
    ///
    /// - parameter subView: 子视图
    /// - parameter leftOffset:  向右的偏移量
    /// - parameter rightOffset:  向左的偏移量
    /// - returns : 无返回值
    func leftRightAlign(_ subView:UIView,_ leftOffset:CGFloat, _ rightOffset:CGFloat) -> Void {
        let horizontalConstraintStr = "H:|-space0-[subView]-space1-|"
        let metrices = ["space0":leftOffset,"space1":rightOffset]

        let viewsDict = ["subView":subView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
    }

    /// 子视图离父级视图右上边距的距离
    ///
    /// - parameter subView: 子视图
    /// - parameter rightOffset:  向左的偏移量
    /// - parameter topOffset:  向下的偏移量
    /// - returns : 无返回值
    func rightTopAlign(_ subView:UIView,_ rightOffset:CGFloat, _ topOffset:CGFloat) -> Void {
        let horizontalConstraintStr = "H:[subView]-space0-|"
        let verticalConstraintStr = "V:|-space1-[subView]"
        let metrices = ["space0":rightOffset,"space1":topOffset]

        let viewsDict = ["subView":subView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
    }

    /// 子视图离父级视图右上边距的距离
    ///
    /// - parameter subView: 子视图
    /// - parameter rightOffset:  向左的偏移量
    /// - parameter topOffset:  向下的偏移量
    /// - parameter size:  子视图的大小
    /// - returns : 无返回值
    func rightTopAlign(_ subView:UIView,_ rightOffset:CGFloat, _ topOffset:CGFloat,_ size:CGSize) -> Void {
        let horizontalConstraintStr = "H:[subView(\(size.width))]-space0-|"
        let verticalConstraintStr = "V:|-space1-[subView(\(size.height))]"
        let metrices = ["space0":rightOffset,"space1":topOffset]

        let viewsDict = ["subView":subView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
    }

    /// 子视图离父级视图上下边距的距离
    ///
    /// - parameter subView: 子视图
    /// - parameter topOffset:  向下的偏移量
    /// - parameter bottomOffset:  向上的偏移量
    /// - returns : 无返回值
    func topBottomAlign(_ subView:UIView,_ topOffset:CGFloat, _ bottomOffset:CGFloat) -> Void {
        let verticalConstraintStr = "V:|-space0-[subView]-space1-|"
        let metrices = ["space0":topOffset,"space1":bottomOffset]

        let viewsDict = ["subView":subView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
    }

    /// 子视图离父级视图右下边距的距离
    ///
    /// - parameter subView: 子视图
    /// - parameter rightOffset:  向左的偏移量
    /// - parameter bottomOffset:  向上的偏移量
    /// - returns : 无返回值
    func rightBottomAlign(_ subView:UIView,_ rightOffset:CGFloat, _ bottomOffset:CGFloat) -> Void {
        let horizontalConstraintStr = "H:[subView]-space0-|"
        let verticalConstraintStr = "V:[subView]-space1-|"
        let metrices = ["space0":rightOffset,"space1":bottomOffset]

        let viewsDict = ["subView":subView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
    }

    /// 子视图离父级视图右下边距的距离
    ///
    /// - parameter subView: 子视图
    /// - parameter rightOffset:  向左的偏移量
    /// - parameter bottomOffset:  向上的偏移量
    /// - parameter size:  子视图的大小
    /// - returns : 无返回值
    func rightBottomAlign(_ subView:UIView,_ rightOffset:CGFloat, _ bottomOffset:CGFloat,_ size:CGSize) -> Void {
        let horizontalConstraintStr = "H:[subView(\(size.width))]-space0-|"
        let verticalConstraintStr = "V:[subView(\(size.height))]-space1-|"
        let metrices = ["space0":rightOffset,"space1":bottomOffset]

        let viewsDict = ["subView":subView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
    }

    /// 子视图离父级视图上下左右边距的距离
    ///
    /// - parameter subView: 子视图
    /// - parameter leftOffset:  向右的偏移量
    /// - parameter rightOffset:  向左的偏移量
    /// - parameter topOffset:  向下的偏移量
    /// - parameter bottomOffset:  向上的偏移量
    /// - returns : 无返回值
    func rectAlign(_ subView:UIView,_ leftOffset:CGFloat,_ rightOffset:CGFloat,_ topOffset:CGFloat,_ bottomOffset:CGFloat) -> Void {
        let horizontalConstraintStr = "H:|-leftOffset-[subView]-rightOffset-|"
        let verticalConstraintStr = "V:|-topOffset-[subView]-bottomOffset-|"
        let metrices = ["leftOffset":leftOffset,"rightOffset":rightOffset,"topOffset":topOffset,"bottomOffset":bottomOffset]

        let viewsDict = ["subView":subView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintStr, options: .directionLeadingToTrailing, metrics: metrices, views: viewsDict))
    }
}

extension UIView{ //视图本身约束

    /// 设置视图大小
    ///
    /// - parameter size: 视图的大小
    /// - returns : 无返回值
    func viewSize(_ size:CGSize) -> Void {
        let horizontalConstraintStr = "H:[subView(\(size.width))]"
        let verticalConstraintStr = "V:[subView(\(size.height))]"
        let viewsDict = ["subView":self]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintStr, options: .alignAllCenterX, metrics: nil, views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintStr, options: .alignAllCenterY, metrics: nil, views: viewsDict))
    }

    /// 设置视图水平宽度
    ///
    /// - parameter width: 视图水平宽度
    /// - returns : 无返回值
    func hWidth(_ width:CGFloat) -> Void {
        let horizontalConstraintStr = "H:[subView(\(width))]"
        let viewsDict = ["subView":self]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintStr, options: .alignAllCenterX, metrics: nil, views: viewsDict))
    }

    /// 设置视图垂直高度
    ///
    /// - parameter height: 视图垂直高度
    /// - returns : 无返回值
    func vHeight(_ height:CGFloat) -> Void {
        let verticalConstraintStr = "V:[subView(\(height))]"
        let viewsDict = ["subView":self]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintStr, options: .alignAllCenterY, metrics: nil, views: viewsDict))
    }

    /// 设置视图水平垂直比例
    ///
    /// - parameter ratio: 视图水平垂直比例
    /// - returns : 无返回值
    func ratioForVH(_ ratio:CGFloat) -> Void {
        let horizontalConstraintStr = "H:[subView]"
        let viewsDict = ["subView":self]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintStr, options: .alignAllCenterX, metrics: nil, views: viewsDict))
        self.addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: ratio, constant: 0.0))
    }

    /// 设置视图水平垂直比例
    ///
    /// - parameter ratio: 视图水平垂直比例
    /// - parameter width: 视图水平宽度
    /// - returns : 无返回值
    func ratioForVH(_ ratio:CGFloat,_ width:CGFloat) -> Void {
        let horizontalConstraintStr = "H:[subView(\(width))]"
        let viewsDict = ["subView":self]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintStr, options: .alignAllCenterX, metrics: nil, views: viewsDict))
        self.addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: ratio, constant: 0.0))
    }
}

extension UIView{  //兄弟之间的约束

    /// 设置兄弟视图中心点水平相等
    ///
    /// - parameter brotherView: 兄弟视图
    /// - parameter offset: 水平方向的偏移量
    /// - returns : 无返回值
    func hCenterEqual(_ brotherView:UIView,_ offset:CGFloat) -> Void {
        self.superview?.addConstraint(NSLayoutConstraint(item: brotherView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: offset))
    }

    /// 设置兄弟视图中心点垂直相等
    ///
    /// - parameter brotherView: 兄弟视图
    /// - parameter offset: 垂直方向的偏移量
    /// - returns : 无返回值
    func vCenterEqual(_ brotherView:UIView,_ offset:CGFloat) -> Void {
        self.superview?.addConstraint(NSLayoutConstraint(item: brotherView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: offset))
    }

    /// 设置兄弟视图中心点水平，垂直相等
    ///
    /// - parameter brotherView: 兄弟视图
    /// - parameter xoffset: 水平方向的偏移量
    /// - parameter yoffset: 垂直方向的偏移量
    /// - returns : 无返回值
    func centerEqual(_ brotherView:UIView,_ xoffset:CGFloat,_ yoffset:CGFloat) -> Void {
        self.superview?.addConstraint(NSLayoutConstraint(item: brotherView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: xoffset))
        self.superview?.addConstraint(NSLayoutConstraint(item: brotherView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: yoffset))
    }

    /// 设置兄弟视图基线水平，垂直相等
    ///
    /// - parameter brotherView: 兄弟视图
    /// - parameter offset: 水平方向的偏移量
    /// - returns : 无返回值
    func hCenterBaseEqual(_ brotherView:UIView,_ offset:CGFloat) -> Void {
        self.superview?.addConstraint(NSLayoutConstraint(item: brotherView, attribute: .firstBaseline, relatedBy: .equal, toItem: self, attribute: .firstBaseline, multiplier: 1.0, constant: offset))
    }

    /// 设置兄弟视图左对齐
    ///
    /// - parameter brotherView: 兄弟视图
    /// - parameter offset: 左边的偏移量
    /// - returns : 无返回值
    func leftEqual(_ brotherView:UIView,_ offset:CGFloat) -> Void {
        self.superview?.addConstraint(NSLayoutConstraint(item: brotherView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: offset))
    }

    /// 设置兄弟视图右对齐
    ///
    /// - parameter brotherView: 兄弟视图
    /// - parameter offset: 右边的偏移量
    /// - returns : 无返回值
    func rightEqual(_ brotherView:UIView,_ offset:CGFloat) -> Void {
        self.superview?.addConstraint(NSLayoutConstraint(item: brotherView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: offset))
    }

    /// 设置兄弟视图顶部对齐
    ///
    /// - parameter brotherView: 兄弟视图
    /// - parameter offset: 顶部的偏移量
    /// - returns : 无返回值
    func topEqual(_ brotherView:UIView,_ offset:CGFloat) -> Void {
        self.superview?.addConstraint(NSLayoutConstraint(item: brotherView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: offset))
    }

    /// 设置兄弟视图底部对齐
    ///
    /// - parameter brotherView: 兄弟视图
    /// - parameter offset: 底部的偏移量
    /// - returns : 无返回值
    func bottomEqual(_ brotherView:UIView,_ offset:CGFloat) -> Void {
        self.superview?.addConstraint(NSLayoutConstraint(item: brotherView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: offset))
    }

    /// 设置兄弟视图宽度相等
    ///
    /// - parameter brotherView: 兄弟视图
    /// - parameter offset: 宽度的偏移量
    /// - returns : 无返回值
    func widthEqual(_ brotherView:UIView,_ offset:CGFloat) -> Void {
        self.superview?.addConstraint(NSLayoutConstraint(item: brotherView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: offset))
    }

    /// 设置兄弟视图高度相等
    ///
    /// - parameter brotherView: 兄弟视图
    /// - parameter offset: 高度的偏移量
    /// - returns : 无返回值
    func heightEqual(_ brotherView:UIView,_ offset:CGFloat) -> Void {
        self.superview?.addConstraint(NSLayoutConstraint(item: brotherView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: offset))
    }

    /// 设置兄弟视图宽高相等
    ///
    /// - parameter brotherView: 兄弟视图
    /// - parameter xOffset: 宽度的偏移量
    /// - parameter yOffset: 高度的偏移量
    /// - returns : 无返回值
    func sizeEqual(_ brotherView:UIView,_ xOffset:CGFloat,_ yOffset:CGFloat) -> Void {
        self.superview?.addConstraint(NSLayoutConstraint(item: brotherView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: xOffset))
        self.superview?.addConstraint(NSLayoutConstraint(item: brotherView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: yOffset))
    }

    /// 设置兄弟视图在本视图的右边
    ///
    /// - parameter brotherView: 兄弟视图
    /// - parameter space: 本视图的右侧与兄弟视图左侧的距离
    /// - returns : 无返回值
    func leftSpace(_ brotherView:UIView,_ space:CGFloat) -> Void {
        let leftStr = "H:[selfView]-space-[brotherView]"
        let metrics = ["space":space]
        let views = ["brotherView":brotherView,"selfView":self]
        self.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: leftStr, options: .directionLeadingToTrailing, metrics: metrics, views: views))
    }

    /// 设置兄弟视图在本视图的左边
    ///
    /// - parameter brotherView: 兄弟视图
    /// - parameter space: 本视图的左侧与兄弟视图右侧的距离
    /// - returns : 无返回值
    func rightSpace(_ brotherView:UIView,_ space:CGFloat) -> Void {
        let rightStr = "H:[brotherView]-space-[selfView]"
        let metrics = ["space":space]
        let views = ["brotherView":brotherView,"selfView":self]
        self.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: rightStr, options: .directionLeadingToTrailing, metrics: metrics, views: views))
    }

    /// 设置兄弟视图在本视图的上边
    ///
    /// - parameter brotherView: 兄弟视图
    /// - parameter space: 本视图的上侧与兄弟视图下侧的距离
    /// - returns : 无返回值
    func topSpace(_ brotherView:UIView,_ space:CGFloat) -> Void {
        let rightStr = "V:[brotherView]-space-[selfView]"
        let metrics = ["space":space]
        let views = ["brotherView":brotherView,"selfView":self]
        self.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: rightStr, options: .directionLeadingToTrailing, metrics: metrics, views: views))
    }

    /// 设置兄弟视图在本视图的下边
    ///
    /// - parameter brotherView: 兄弟视图
    /// - parameter space: 本视图的下侧与兄弟视图上侧的距离
    /// - returns : 无返回值
    func bottomSpace(_ brotherView:UIView,_ space:CGFloat) -> Void {
        let rightStr = "V:[selfView]-space-[brotherView]"
        let metrics = ["space":space]
        let views = ["brotherView":brotherView,"selfView":self]
        self.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: rightStr, options: .directionLeadingToTrailing, metrics: metrics, views: views))
    }
}

