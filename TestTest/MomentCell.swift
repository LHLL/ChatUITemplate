//
//  MomentCell.swift
//  TestTest
//
//  Created by Xu, Jay on 8/10/17.
//  Copyright © 2017 Xu, Jay. All rights reserved.
//

import UIKit

class MomentCell: UITableViewCell {

    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet var images: [UIImageView]!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    private let lightBlue = UIColor(colorLiteralRed: 180/255.0,
                                    green: 223/255.0,
                                    blue: 254/255.0,
                                    alpha: 1)
    private let darkBlue = UIColor(colorLiteralRed: 27/255.0,
                                   green: 149/255.0,
                                   blue: 251/255.0,
                                   alpha: 1)
    
    var tapHandler:((UIImage?,String)->Void)!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        likeBtn.setImage(IonIcons.image(withIcon: ion_android_favorite,
                                        iconColor: lightBlue,
                                        iconSize: 30,
                                        imageSize: CGSize(width: 30, height: 30)),
                         for: .normal)
        commentBtn.setImage(IonIcons.image(withIcon: ion_chatbox_working,
                                           iconColor: darkBlue,
                                           iconSize: 30,
                                           imageSize: CGSize(width: 30, height: 30)),
                            for: .normal)
        container.layer.cornerRadius = 10
        container.drawShadow()
        thumbnail.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc private func handleTap(){
        tapHandler(thumbnail.image,nameLabel.text!)
    }
    
}

extension UIView{
    
    func drawShadow(){
        layer.cornerRadius = 2
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 10, height: 10)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 10.0
        layer.masksToBounds =  false
    }
    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x:self.center.x - 4.0, y:self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x:self.center.x + 4.0, y:self.center.y))
        layer.add(animation, forKey: "position")
    }
}
