//
//  TImeUtils.swift
//  Danime
//
//  Created by Dias Gazim on 08.12.2022.
//

import Foundation


func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
    return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
}
