//
//  GalleryCell.swift
//  TestTest
//
//  Created by Xu, Jay on 8/10/17.
//  Copyright © 2017 Xu, Jay. All rights reserved.
//

import UIKit

class GalleryCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius = 5
    }

}
