import Foundation

struct RocketLaunchData: Decodable {
    let name: String
    let date_unix: Int
    let success: Bool
}
