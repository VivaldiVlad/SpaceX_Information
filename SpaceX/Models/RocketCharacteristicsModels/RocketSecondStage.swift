import Foundation

struct RocketSecondStageInfo: Decodable {
    let engines: Int
    let fuel_amount_tons: Float
    let burn_time_sec: Int?
}
