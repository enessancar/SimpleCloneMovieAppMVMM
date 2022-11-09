//
//  Movie.swift
//  MVMM-Example
//
//  Created by Enes Sancar on 14.10.2022.

import Foundation

struct Movie: Decodable {
    let results: [MovieResult]?
}

struct MovieResult: Decodable {
    let id: Int?
    let posterPath: String?
    let overview , releaseDate , title : String?
    let originalLanguage: String?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys : String , CodingKey {
        case id
        case posterPath = "poster_path"
        case overview , title
        case releaseDate = "release_date"
        case originalLanguage = "original_language"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    var _voteCount: Int? {
        voteCount ?? Int.min
    }
    
    var _voteAverage: Double? {
        voteAverage ?? Double.zero
    }
    
    var _originalLanguage: String {
        originalLanguage ?? "N/A"
    }
    
    var _posterPath : String {
        posterPath ?? ""
    }
    
    var _id : Int {
        id ?? Int.min
    }
    
    var _title: String {
        title ?? "N/A"
    }
    
    var _overview: String {
        overview ?? "There is not overview"
    }
    
    var _releaseDate: String {
        releaseDate ?? "N/A"
    }
}
