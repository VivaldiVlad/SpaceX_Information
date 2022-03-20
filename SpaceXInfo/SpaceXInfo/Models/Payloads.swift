//
//  Payloads.swift
//  SpaceXInfo
//
//  Created by Vladislav on 20.03.2022.
//

import Foundation

struct Payloads: Codable {
    let compositeFairing: CompositeFairing
    let option1: String

    enum CodingKeys: String, CodingKey {
        case compositeFairing = "composite_fairing"
        case option1 = "option_1"
    }
}
