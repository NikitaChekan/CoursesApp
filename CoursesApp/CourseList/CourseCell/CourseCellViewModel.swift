//
//  CourseCellViewModel.swift
//  CoursesApp
//
//  Created by Nikita Chekan on 18.01.2023.
//

import Foundation

protocol CourseCellViewModelProtocol {
    var courseName: String { get }
    var imageData: Data? { get }
    
    init(course: Course)
}

class CourseCellViewModel: CourseCellViewModelProtocol {
    var courseName: String {
        course.name
    }
    
    var imageData: Data? {
        ImageManager.shared.fetchImageData(from: course.imageUrl)
    }
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
    }
    
    
}
