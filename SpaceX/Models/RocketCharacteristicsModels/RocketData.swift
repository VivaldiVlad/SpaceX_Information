import Foundation

struct RocketData: Decodable {
    let name: String
    let country: String
    let first_flight: String
    let cost_per_launch: Int
    let height: RocketParameters
    let diameter: RocketParameters
    let mass: RocketMass
    let first_stage: RocketStagesInfo
    let second_stage: RocketStagesInfo
}
