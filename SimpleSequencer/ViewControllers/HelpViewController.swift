//
//  HelpViewController.swift
//  SimpleSequencer
//
//  Created by Joshua Escribano on 5/6/18.
//  Copyright © 2018 Joshua. All rights reserved.
//

import Foundation
import UIKit

/// Manages help view for watching instructional tutorial video and reporting bugs
class HelpViewControler: UIViewController {
    init() {
        super.init(nibName: "HelpViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
