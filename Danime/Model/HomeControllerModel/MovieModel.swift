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
    
    init(title: String, imageName: String, rate: Float = 0.0, desc: String = "") {
        self.title = title
        self.imageName = imageName
        self.rate = rate
        self.desc = desc
    }
}
