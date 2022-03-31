import Foundation

struct RocketData: Decodable {
    let name: String
    let country: String
    let firstFlight: String
    let costPerLaunch: Int
    let height: RocketParameters
    let diameter: RocketParameters
    let mass: RocketMass
    let firstStage: RocketStagesInfo
    let secondStage: RocketStagesInfo
    
    enum CodingKeys: String, CodingKey {
           case height, diameter, mass
           case firstStage = "first_stage"
           case secondStage = "second_stage"
           case name
           case costPerLaunch = "cost_per_launch"
           case firstFlight = "first_flight"
           case country
       }
}
