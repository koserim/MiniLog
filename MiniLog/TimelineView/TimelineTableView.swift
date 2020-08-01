//
//  TimelineTableView.swift
//  MiniLog
//
//  Created by 바보세림이 on 2020/07/29.
//  Copyright © 2020 serim. All rights reserved.
//

import UIKit

class TimelineTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var allPosts: [PostModel] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPosts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }


    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = UIColor.purple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
