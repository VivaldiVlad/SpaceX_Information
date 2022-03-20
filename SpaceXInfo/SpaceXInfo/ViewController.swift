//
//  ViewController.swift
//  SpaceXInfo
//
//  Created by Vladislav on 20.03.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let request = URLRequest(url: URL(string:"https://api.spacexdata.com/v4/rockets")!)
        
        let task = URLSession.shared.dataTask(with: request)
        {
            data, response, error in
            
            if let data = data, let rocketArray = try? JSONDecoder().decode(Array<RocketElement>.self, from: data)
            {
                for rocket in rocketArray {
                    print(rocket.name)
                }

            }
        }
        
        task.resume()
        
    }


}
