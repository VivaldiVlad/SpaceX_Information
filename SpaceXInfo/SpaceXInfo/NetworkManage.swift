//
//  NetworkManage.swift
//  SpaceXInfo
//
//  Created by Vladislav on 24.03.2022.
//

import UIKit

class NetworkManage {
    static let shared = NetworkManage(URL(string:"https://api.spacexdata.com/v4/rockets")!);
    
    let baseURL: URL
    
    private init(_ baseURL: URL) {
        self.baseURL = baseURL
    }
    
    func downloadInfomation(completion: @escaping (Array<RocketElement>) -> Void) {
        
        URLSession.shared.dataTask(with: baseURL) {
            (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
                completion([])
                return
            }
            
            guard let data = data else {
                completion([])
                return
            }
            
            let rocketArray = try! JSONDecoder().decode(Array<RocketElement>.self, from: data)
            
            completion(rocketArray)
        }
    }
    
    func downloadImage (_ urlImage: String, completion: @escaping (UIImage?) -> Void) {
        
        let url = URL(string: urlImage)!
        
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                completion(image)
            }
        }.resume()
    }
}
