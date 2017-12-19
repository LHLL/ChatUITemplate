//
//  HomeViewController.swift
//  TestTest
//
//  Created by Xu, Jay on 8/9/17.
//  Copyright © 2017 Xu, Jay. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var middleBubble: BubbuleView!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var backIcon: UIImageView!
    @IBOutlet weak var cameraIcon: UIImageView!
    @IBOutlet weak var momentsList: UITableView!
    
    fileprivate let names = ["Chris Harris","Ninesword Ye","ASAJ"]
    fileprivate let imgs = ["friend_5","Christy","friend_4"]
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backIcon.image = IonIcons.image(withIcon: ion_chevron_left,
                                        iconColor: .white,
                                        iconSize: 25,
                                        imageSize: CGSize(width: 25, height: 25))
        cameraIcon.image = IonIcons.image(withIcon: ion_ios_camera_outline,
                                          iconColor: .white,
                                          iconSize: 30,
                                          imageSize: CGSize(width: 30, height: 30))
        backBtn.layer.cornerRadius = backBtn.bounds.height/2
        rightBtn.layer.cornerRadius = rightBtn.bounds.height/2
        momentsList.register(UINib(nibName: "MomentCell",
                                   bundle: nil),
                             forCellReuseIdentifier: "MomentCell")
        momentsList.estimatedRowHeight = 200
        momentsList.rowHeight = UITableViewAutomaticDimension
        navigationController?.navigationBar.isHidden = true
        momentsList.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapOnMiddleBubble)))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func toCamera(_ sender: UIButton) {
        let des = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RVC")
        navigationController?.pushViewController(des, animated: true)
    }
    
    @objc private func handleTapOnMiddleBubble(sender:UITapGestureRecognizer){
        if middleBubble.frame.contains(sender.location(in: view)) {
            let des = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PVC") as! ProfileViewController
            des.selfie = UIImage(named: "friend_4")
            des.name = "ASAJ"
            navigationController?.pushViewController(des, animated: true)
        }
    }
}

extension HomeViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MomentCell", for: indexPath) as! MomentCell
        cell.nameLabel.text = names[indexPath.row]
        cell.thumbnail.image = UIImage(named:imgs[indexPath.row])
        cell.tapHandler = { [unowned self] img, name in
            let des = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PVC") as! ProfileViewController
            des.selfie = img
            des.name = name
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(des, animated: true)
            }
        }
        return cell
    }
}

extension HomeViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }
}


