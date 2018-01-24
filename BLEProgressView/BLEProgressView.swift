//
//  BLEProgressView.swift
//  BLEProgressView
//
//  Created by Shinya Yamamoto on 2018/01/25.
//  Copyright © 2018年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class BLEProgressView :UIView {
    
    private var circleArray = [UIView(), UIView(), UIView(), UIView()]
    private var bleImageView:UIImageView = UIImageView()
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        let bleColor = color(r: 0, g: 117, b: 255, a: 1.0)
        let scale = CGFloat(circleArray.count + 1)
        let duration = TimeInterval(circleArray.count)
        var delay = 0.0
        for circle in circleArray {
            set(view: circle)
            circle.backgroundColor = bleColor
            self.addSubview(circle)
            //点滅アニメーション
            UIView.animate(withDuration: duration, delay: delay, options: .repeat, animations: { () -> Void in
                circle.transform = CGAffineTransform.init(scaleX: scale, y: scale)
                circle.alpha = 0.0
            }, completion: nil)
            delay += 1.0
        }
        bleImageView.image = UIImage(named: "ble")
        bleImageView.frame = CGRect(x:0,y:0,width:70,height:70)
        bleImageView.center = self.center
        self.addSubview(bleImageView)
    }
    
    private func set(view:UIView) {
        view.frame = CGRect(x:0,y:0,width:100,height:100)
        view.center = self.center
        view.layer.cornerRadius = 50
    }
 
    private func color(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) -> UIColor {
        return UIColor(red: CGFloat(r/255.0), green: CGFloat(g/255.0), blue: CGFloat(b/255.0), alpha: CGFloat(a))
    }
}
