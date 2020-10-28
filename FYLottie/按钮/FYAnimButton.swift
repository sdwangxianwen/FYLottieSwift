//
//  FYAnimButton.swift
//  FYLottie
//
//  Created by wang on 2020/10/28.
//
/*
 1,本身是一个lottieanmitionView,并不是一个真正的按钮
 2，动画只执行一次
 3，和按钮一样，有两种状态，选择和非选择状态
 4，非选择状态正向执行动画一次。选择状态反向执行动画一次，或者不执行动画，直接恢复原状
 */

import UIKit
import Lottie

enum anmitionPlayType {
    case noAnmitionEnd //反向选择没有动画
    case normal //反向选择有动画
}

class FYAnimButton: UIView {
    
    var playendType:anmitionPlayType = .normal
    var animitionView:AnimationView! //动画视图
    var isSelected:Bool = false //选中状态
    
    //1,初始化
    
    init(frame: CGRect,name:String,endType:anmitionPlayType) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        playendType = endType
        self.backgroundColor = .clear
        animitionView = AnimationView.init(name: name)
        animitionView.loopMode = .playOnce
        animitionView.contentMode = .scaleAspectFit
//        animitionView.pla
        self.addSubview(animitionView)
        animitionView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        animitionView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(animationViewClick)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func animationViewClick()  {
        if isSelected {
            if playendType == .normal {
                animitionView.play(fromProgress: 1, toProgress: 0, loopMode: .playOnce) { (finsh) in
                    self.isSelected = false
                }
              

            } else {
                animitionView.play(fromProgress: 0, toProgress: 0, loopMode: .playOnce) { (finsh) in
                    self.isSelected = false
                }
            }
           
        } else {
            animitionView.play(fromProgress: 0, toProgress: 1, loopMode: .playOnce) { (finsh) in
                self.isSelected = false
            }
        }
        
       
    }
    

}
