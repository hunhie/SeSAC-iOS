//
//  Weather.swift
//  SeSAC3Week5
//
//  Created by walkerhilla on 2023/08/17.
//

import Foundation

// MARK: - Weather
struct WeatherData: Codable {
    let timezone: Int
    let coord: Coord
    let sys: Sys
    let cod, dt: Int
    let base: String
    let main: Main
    let wind: Wind
    let id, visibility: Int
    let weather: [Weather]
    let clouds: Clouds
    let name: String
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lat, lon: Double
}

// MARK: - Main
struct Main: Codable {
    let humidity: Int
    let tempMax: Double
    let pressure: Int
    let tempMin, feelsLike: Double
    let seaLevel: Int
    let temp: Double
    let grndLevel: Int

    enum CodingKeys: String, CodingKey {
        case humidity
        case tempMax = "temp_max"
        case pressure
        case tempMin = "temp_min"
        case feelsLike = "feels_like"
        case seaLevel = "sea_level"
        case temp
        case grndLevel = "grnd_level"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, sunset: Int
    let country: String
    let sunrise, id: Int
}

// MARK: - WeatherElement
struct Weather: Codable {
    let main, icon, description: String
    let id: Int
}

// MARK: - Wind
struct Wind: Codable {
    let deg: Int
    let gust, speed: Double
}
