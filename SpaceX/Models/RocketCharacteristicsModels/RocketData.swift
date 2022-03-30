import Foundation

struct RocketData: Decodable {
    let height: RocketHeight
    let diameter: RocketDiameter
    let mass: RocketMass
    let first_stage: RocketFirstStageInfo
}
