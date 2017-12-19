//
//  Navi.swift
//  TestTest
//
//  Created by Xu, Jay on 8/18/17.
//  Copyright © 2017 Xu, Jay. All rights reserved.
//

import UIKit

class Navi: UINavigationController {
    
//    override var shouldAutorotate: Bool {
//        return f
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//extension Navi:UINavigationControllerDelegate {
//    
//    func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
//        let app = UIApplication.shared.delegate as! AppDelegate
//        app.orientation
//        return .landscapeLeft
//    }
//}

struct AppUtility {
    
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }
    
    /// OPTIONAL Added method to adjust lock and rotate to the desired orientation
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
        
        self.lockOrientation(orientation)
        
        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
    }
    
}
