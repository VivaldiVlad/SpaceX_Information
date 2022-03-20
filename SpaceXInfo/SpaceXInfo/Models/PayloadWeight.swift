//
//  PayloadWeight.swift
//  SpaceXInfo
//
//  Created by Vladislav on 20.03.2022.
//

import Foundation

struct PayloadWeight: Codable {
    let id, name: String
    let kg, lb: Int
}
