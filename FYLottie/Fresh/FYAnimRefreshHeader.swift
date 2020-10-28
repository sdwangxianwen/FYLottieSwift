//
//  FYAnimRefreshHeader.swift
//  FYLottie
//
//  Created by wang on 2020/10/28.
//

import UIKit
import MJRefresh
import Lottie
import SnapKit

class FYAnimRefreshHeader: MJRefreshHeader {
    
    var animView:AnimationView! //刷新动画
    
    override func prepare() {
        super.prepare()
        self.mj_h = 80
        animView = AnimationView.init(name: "RefreshHeaderAnim")
        animView.contentMode = .scaleAspectFit
        animView.backgroundBehavior = .pauseAndRestore
        self.addSubview(animView)
        animView.loopMode = .loop
      
    }
    
    override func placeSubviews() {
        super.placeSubviews()
        animView.snp.makeConstraints { ( make) in
            make.centerX.centerY.equalTo(self)
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
    }
   
    override var state: MJRefreshState {
        didSet {
            switch state {
            case .idle:
                animView.stop()
            case .noMoreData:
                animView.stop()
            case .pulling:
                animView.pause()
            case .refreshing:
                animView.play()
            default:
                break
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
