import Foundation

struct RocketStagesInfo: Decodable {
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSec: Int?
    
    enum CodingKeys: String, CodingKey {
           case  engines
           case fuelAmountTons = "fuel_amount_tons"
           case burnTimeSec = "burn_time_sec"
       }
}
