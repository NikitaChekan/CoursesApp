//
//  CourseDetailsConfigurator.swift
//  CoursesApp
//
//  Created by Nikita Chekan on 30.01.2023.
//

import Foundation

protocol CourseDetailsConfiguratorInputProtocol {
    func configure(withView view: CourseDetailsViewController, and course: Course)
}

class CourseDetailsConfigurator: CourseDetailsConfiguratorInputProtocol {
    func configure(withView view: CourseDetailsViewController, and course: Course) {
        let presenter = CourseDetailsPresenter(view: view)
        let interactor = CourseDetailsInteractor(presenter: presenter, course: course)
        view.presenter = presenter
        presenter.interactor = interactor
    }
}
