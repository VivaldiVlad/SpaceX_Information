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
            print(String(decoding: data!, as: UTF8.self))
            print(response)
            print(error)
        }
        
        task.resume()
        
    }


}
