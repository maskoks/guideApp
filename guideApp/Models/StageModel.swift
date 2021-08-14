//
//  stageModel.swift
//  guideApp
//
//  Created by Жеребцов Данил on 11.08.2021.
//

import Foundation
import UIKit

struct Stage {
    let title: String
    let serialNumber: Int
    let images: [String]
    let shortDescription: String
    let description: String
    let audioFile: String
    var audioFileCurrentTime: Float
}
