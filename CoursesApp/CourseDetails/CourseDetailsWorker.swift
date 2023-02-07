//
//  Course.swift
//  CoursesApp
//
//  Created by Nikita Chekan on 12.01.2023.
//

import Foundation

class CourseDetailsWorker {
    func getImage(from imageURL: URL?) -> Data? {
        ImageManager.shared.fetchImageData(from: imageURL)
    }
    
    func getFavoriteStatus(for courseName: String) -> Bool {
        DataManager.shared.getFavoriteStatus(for: courseName)
    }
    
    func setNewFavoriteStatus(for courseName: String, with status: Bool) {
        DataManager.shared.setFavoriteStatus(for: courseName, with: status)
    }
}
