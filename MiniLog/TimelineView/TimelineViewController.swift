//
//  TimelineViewController.swift
//  MiniLog
//
//  Created by 바보세림이 on 2020/07/26.
//  Copyright © 2020 serim. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {
    
    let timelineTableView = TimelineTableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 8 / 15))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(timelineTableView)
        timelineTableView.translatesAutoresizingMaskIntoConstraints = false
        
    }

}
