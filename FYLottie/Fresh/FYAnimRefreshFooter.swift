//
//  FYAnimRefreshFooter.swift
//  FYLottie
//
//  Created by wang on 2020/10/28.
//

import UIKit
import MJRefresh
import Lottie
import SnapKit

class FYAnimRefreshFooter: MJRefreshBackFooter {
    var animView:AnimationView! //刷新动画
    
    override func prepare() {
        super.prepare()
        backgroundColor = .white
        animView = AnimationView.init(name: "RefreshFooterAnim")
        animView.contentMode = .scaleAspectFit
        animView.backgroundBehavior = .pauseAndRestore
        self.addSubview(animView)
        animView.loopMode = .loop
        
    }
    override func placeSubviews() {
        super.placeSubviews()
        animView.snp.makeConstraints { ( make) in
            make.centerX.centerY.equalTo(self)
            make.size.equalTo(CGSize(width: 200, height: 80))
        }
    }
    
    override var state: MJRefreshState {
        didSet {
          
            if state == .refreshing {
                
                animView.play()
            }
            if state == .noMoreData || state == .idle {
               
                animView.stop()
            }
        }
    }
    override var pullingPercent: CGFloat {
        
        didSet {
            if self.state == .idle {
                return
            }
            animView.play(toProgress: pullingPercent)
        }
    }
}
