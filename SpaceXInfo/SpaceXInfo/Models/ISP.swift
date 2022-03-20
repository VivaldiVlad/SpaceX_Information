//
//  ISP.swift
//  SpaceXInfo
//
//  Created by Vladislav on 20.03.2022.
//

import Foundation

struct ISP: Codable {
    let seaLevel, vacuum: Int

    enum CodingKeys: String, CodingKey {
        case seaLevel = "sea_level"
        case vacuum
    }
}
