//
//  Model.swift
//  Endterm1
//
//  Created by Dias Karimov on 14.05.2022.
//

import Foundation

struct Model: Codable {
    let data: [Projects]
}

struct Projects: Codable {
    let id: String
    let title: String
    let anons: String
}
