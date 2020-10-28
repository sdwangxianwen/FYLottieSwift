//
//  ViewController.swift
//  FYLottie
//
//  Created by wang on 2020/10/28.
//

import UIKit

class ViewController: UIViewController {
    var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height/2))
        view.addSubview(tableView)
        tableView.mj_header = FYAnimRefreshHeader.init(refreshingTarget: self, refreshingAction: #selector(refresh))
        tableView.mj_footer = FYAnimRefreshFooter.init(refreshingTarget: self, refreshingAction: #selector(refresh))
        
        let btn = FYAnimButton.init(frame: CGRect.zero, name: "Play-Pause", endType: .normal)
        view.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.top.equalTo(tableView.snp.bottom).offset(15)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
    }

    @objc func refresh()  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.tableView.mj_header?.endRefreshing()
            self.tableView.mj_footer?.endRefreshing()
        }
    }

}

