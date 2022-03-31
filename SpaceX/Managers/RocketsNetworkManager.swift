import Foundation

class RocketsNetworkManager {
    static let shared = RocketsNetworkManager()
    
    private init() {}
    
    func fetchRequestForRocketCharacteristicData(completion: @escaping ([RocketData]) -> ()) {
        let urlString = "https://api.spacexdata.com/v4/rockets"
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if error == nil,
               let data = data {
                do {
                    let rocket = try JSONDecoder().decode([RocketData].self, from: data)
                    completion(rocket)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        task.resume()
    }
    
    
    func fetchRequestForRocketsLaunchData(completion: @escaping ([RocketLaunchData]) -> ()) {
        let urlString = "https://api.spacexdata.com/v4/launches"
        guard let url = URL(string: urlString) else { return }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if error == nil,
               let data = data {
                do {
                    let rocketLaunchData = try JSONDecoder().decode([RocketLaunchData].self, from: data)
                    DispatchQueue.main.async {
                        completion(rocketLaunchData)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        task.resume()
    }
}
