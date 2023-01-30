//
//  CourseListPresenter.swift
//  CoursesApp
//
//  Created by Nikita Chekan on 30.01.2023.
//

import Foundation

struct CourseListDataStore {
    let courses: [Course]
}

class CourseListPresenter: CourseListViewOutputProtocol {    
    var interactor: CourseListInteractorInputProtocol!
    var router: CourseListRouterInputProtocol!
    
    private let view: CourseListViewInputProtocol
    private var dataStore: CourseListDataStore?
    
    required init(view: CourseListViewInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.fetchCourses()
    }
}

// MARK: - CourseListInteractorOutputProtocol
extension CourseListPresenter: CourseListInteractorOutputProtocol {
    func coursesDidReceive(with dataStore: CourseListDataStore) {
        self.dataStore = dataStore
        view.display(courses: dataStore.courses)
    }
}
