//
//  CourseListRouter.swift
//  CoursesApp
//
//  Created by Nikita Chekan on 30.01.2023.
//

import Foundation

protocol CourseListRouterInputProtocol {
    init(view: CourseListViewController)
    func openCourseDetailsViewController(with course: Course)
}

class CourseListRouter: CourseListRouterInputProtocol {
    private unowned let view: CourseListViewController
    
    required init(view: CourseListViewController) {
        self.view = view
    }
    
    func openCourseDetailsViewController(with course: Course) {
        view.performSegue(withIdentifier: "showDetails", sender: course)
    }
}
