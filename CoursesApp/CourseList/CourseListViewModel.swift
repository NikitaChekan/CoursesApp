//
//  CourseListViewModel.swift
//  CoursesApp
//
//  Created by Nikita Chekan on 18.01.2023.
//

import Foundation

protocol CourseListViewModelProtocol {
    #warning("TODO: courses must be private")
    var courses: [Course] { get }
    
    func fetchCourses(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    
}

class CourseListViewModel: CourseListViewModelProtocol {
    var courses: [Course] = []
    
    func fetchCourses(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData { [unowned self] courses in
            self.courses = courses
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        courses.count
    }
    
    
    
}
