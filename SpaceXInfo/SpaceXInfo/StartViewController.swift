//
//  StartViewController.swift
//  SpaceXInfo
//
//  Created by Vladislav on 24.03.2022.
//

import UIKit

class StartViewController: UIViewController {

    var rockets: [RocketElement] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NetworkManage.shared.downloadInfomation{rockets in
            self.rockets = rockets
            
        }
    }
}
