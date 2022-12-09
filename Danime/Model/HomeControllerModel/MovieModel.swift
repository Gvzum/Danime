//
//  MovieModel.swift
//  Danime
//
//  Created by Dias Gazim on 03.12.2022.
//

import Foundation


struct MovieModel {
    let title: String
    let imageName: String
    let rate: Float
    let desc: String
    let memory: String
    let duration: Int
    
    init(title: String, imageName: String, rate: Float = 0.0, desc: String = "Some Movie description in here", memory: String = "1 Gb", duration: Int = 1000) {
        self.title = title
        self.imageName = imageName
        self.rate = rate
        self.desc = desc
        self.memory = memory
        self.duration = duration
    }
}
