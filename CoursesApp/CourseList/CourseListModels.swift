//
//  Course.swift
//  CoursesApp
//
//  Created by Nikita Chekan on 12.01.2023.
//

import Foundation

typealias CourseCellViewModel = CourseList.ShowCourses.ViewModel.CourseCellViewModel

protocol CourseCellViewModelProtocol {
    var identifier: String { get }
    var height: Double { get }
    var courseName: String { get }
    var imageData: Data? { get }
    init(course: Course)
}

enum CourseList {
 
    // MARK: Use cases
    enum ShowCourses {
        
        struct Response {
            let courses: [Course]
        }
        
        struct ViewModel {
            struct CourseCellViewModel: CourseCellViewModelProtocol {
                var identifier: String {
                    "CourseCell"
                }
                
                var height: Double {
                    100
                }
                
                var courseName: String {
                    course.name
                }
                
                var imageData: Data? {
                    ImageManager.shared.fetchImageData(from: course.imageUrl)
                }
                
                private let course: Course
                
                init(course: Course) {
                    self.course = course
                }
                
                
            }
            let rows: [CourseCellViewModelProtocol]
        }
    }
}
