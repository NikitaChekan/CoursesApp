//
//  Course.swift
//  CoursesApp
//
//  Created by Nikita Chekan on 12.01.2023.
//

import Foundation

struct Course: Decodable {
    let name: String
    let imageUrl: URL
    let numberOfLessons: Int
    let numberOfTests: Int
}
