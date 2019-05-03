//
//  URL+Extensions.swift
//  S10-GoodWeather
//
//  Created by Humberto Vieira on 03/05/19.
//  Copyright © 2019 Humberto Vieira. All rights reserved.
//

import Foundation

extension URL {
    static func urlForWeatherAPI(city: String) -> URL? {
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=281c63edba306316e65c262bd214d71b")
    }
    
}
