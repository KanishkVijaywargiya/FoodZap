//
//  NavigationControllerExt.swift
//  FoodZap
//
//  Created by MANAS VIJAYWARGIYA on 07/11/21.
//

import Foundation
import UIKit

extension UINavigationController: UIGestureRecognizerDelegate {
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
