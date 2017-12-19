//
//  ProfileViewController.swift
//  TestTest
//
//  Created by Xu, Jay on 8/10/17.
//  Copyright © 2017 Xu, Jay. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var callBtn: UIButton!
    @IBOutlet weak var messageBtn: UIButton!
    @IBOutlet weak var arrowBtn: UIImageView!
    @IBOutlet weak var sexBtn: UIImageView!
    @IBOutlet weak var album: UICollectionView!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    fileprivate let photos = ["p1","p2","p3","p4"]
    var selfie:UIImage?
    var name:String!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sexBtn.image = IonIcons.image(withIcon: ion_female,
                                      iconColor: UIColor(colorLiteralRed: 28/255.0,
                                                         green: 49/255.0,
                                                         blue: 137/255.0,
                                                         alpha: 1),
                                      iconSize: 21,
                                      imageSize: CGSize(width: 21, height: 21))
        backBtn.setImage(IonIcons.image(withIcon: ion_chevron_left,
                                        iconColor: UIColor(colorLiteralRed: 95/255.0,
                                                           green: 230/255.0,
                                                           blue: 43/255.0,
                                                           alpha: 1),
                                        iconSize: 25,
                                        imageSize: CGSize(width: 25, height: 25)),
                         for: .normal)
        arrowBtn.image = IonIcons.image(withIcon: ion_chevron_right,
                                        iconColor: UIColor(colorLiteralRed: 95/255.0,
                                                           green: 230/255.0,
                                                           blue: 43/255.0,
                                                           alpha: 1),
                                        iconSize: 25,
                                        imageSize: CGSize(width: 20, height: 20))
        moreBtn.setImage(IonIcons.image(withIcon: ion_ios_more,
                                        iconColor: UIColor(colorLiteralRed: 95/255.0,
                                                           green: 230/255.0,
                                                           blue: 43/255.0,
                                                           alpha: 1),
                                        iconSize: 25,
                                        imageSize: CGSize(width: 20, height: 20)),
                         for: .normal)
        
        container.layer.cornerRadius = 5
        messageBtn.layer.cornerRadius = 22
        callBtn.layer.cornerRadius = 22
        thumbnail.drawShadow()
        container.drawShadow()
        
        album.register(UINib(nibName: "GalleryCell",
                             bundle: nil),
                       forCellWithReuseIdentifier: "GalleryCell")
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        thumbnail.image = selfie
        nameLabel.text = name
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}

extension ProfileViewController:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell", for: indexPath) as! GalleryCell
        cell.img.image = UIImage(named: photos[indexPath.item])
        return cell
    }
}

extension ProfileViewController:UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}
