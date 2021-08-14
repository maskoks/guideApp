//
//  Model.swift
//  guideApp
//
//  Created by Жеребцов Данил on 11.08.2021.
//

import Foundation
import UIKit

class Excursion {
    
    let images = ExcursionImages()
    let descriptions = ExcursionDescriptions()
    
    let name = "Увлекательная экскурсия"
    var selectedStageSerialNumber = 0
    var isPlayBackRateIncreased = false
    
   
    lazy var stages: [Stage] = [
        Stage(title: "Добро пожаловать в Шир!", serialNumber: 0, images: images.imagesFromShire, shortDescription: descriptions.shireShortDescription, description: descriptions.shireDescription, audioFile: "shire", audioFileCurrentTime: 0.0),
        Stage(title: "Добро пожаловать в Нью-Йорк!", serialNumber: 1, images: images.imagesFromNewYork, shortDescription: descriptions.newYorkShortDescription, description: descriptions.newYorkDescription, audioFile: "newYork", audioFileCurrentTime: 0.0),
        Stage(title: "Добро пожаловать на Стэмфорд Бридж!", serialNumber: 2, images: images.imagesFromStamfordBridge, shortDescription: descriptions.stamfordBridgeShortDescription, description: descriptions.stamfordBridgeDescription, audioFile: "chelseaHymn", audioFileCurrentTime: 0.0)
    ]
    
}
