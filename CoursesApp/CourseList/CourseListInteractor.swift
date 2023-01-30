//
//  CourseListInteractor.swift
//  CoursesApp
//
//  Created by Nikita Chekan on 30.01.2023.
//

import Foundation

protocol CourseListInteractorInputProtocol {
    init(presenter: CourseListInteractorOutputProtocol)
    func fetchCourses()
}

protocol CourseListInteractorOutputProtocol : AnyObject {
    func coursesDidReceive(with dataStore: CourseListDataStore)
}

class CourseListInteractor: CourseListInteractorInputProtocol {
    private unowned let presenter: CourseListInteractorOutputProtocol
    
    required init(presenter: CourseListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchCourses() {
        NetworkManager.shared.fetchData { [unowned self] courses in
            let dataStore = CourseListDataStore(courses: courses)
            presenter.coursesDidReceive(with: dataStore)
        }
    }
}
