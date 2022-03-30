import Foundation

struct RocketFirstStageInfo: Decodable {
    let engines: Int
    let fuel_amount_tons: Double
    let burn_time_sec: Double
}
