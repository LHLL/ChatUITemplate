//
//  ScrollCell.swift
//  TestTest
//
//  Created by Xu, Jay on 8/9/17.
//  Copyright © 2017 Xu, Jay. All rights reserved.
//

import UIKit

class ScrollCell: UITableViewCell {

    @IBOutlet weak var dateCell: UITableView!
    
    var synchronizer:(()->Void)!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateCell.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}


extension ScrollCell:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Now is \(indexPath.row)"
        return cell
    }
}

extension ScrollCell:UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= 0 {
            scrollView.contentOffset.y = 0
            scrollView.isScrollEnabled = false
            synchronizer()
        }
    }
    
}
