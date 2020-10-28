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
        tableView = UITableView.init(frame: view.bounds)
        view.addSubview(tableView)
        tableView.mj_header = FYAnimRefreshHeader.init(refreshingTarget: self, refreshingAction: #selector(refresh))
        tableView.mj_footer = FYAnimRefreshFooter.init(refreshingTarget: self, refreshingAction: #selector(refresh))
    }

    @objc func refresh()  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.tableView.mj_header?.endRefreshing()
            self.tableView.mj_footer?.endRefreshing()
        }
    }

}

