//
//  ViewController.swift
//  TestTest
//
//  Created by Xu, Jay on 8/9/17.
//  Copyright © 2017 Xu, Jay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var container: UITableView!
    fileprivate var synchronizer:(()->Void)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        container.register(UINib(nibName: "ScrollCell", bundle: nil),
                           forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ScrollCell
        self.synchronizer = {
            DispatchQueue.main.async {
                cell.dateCell.isScrollEnabled = true
            }
        }
        cell.synchronizer = { [unowned self] in
            DispatchQueue.main.async {
                self.container.isScrollEnabled = true
            }
        }
        return cell
    }
}

extension ViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= 200 {
            scrollView.contentOffset.y = 200
            scrollView.isScrollEnabled = false
            synchronizer()
        }
    }
}
