//
//  CourseListConfigurator.swift
//  CoursesApp
//
//  Created by Nikita Chekan on 30.01.2023.
//

protocol CourseListConfiguratorInputProtocol {
    func configure(withView view: CourseListViewController)
}

class CourseListConfigurator: CourseListConfiguratorInputProtocol {
    func configure(withView view: CourseListViewController) {
        let presenter = CourseListPresenter(view: view)
        let interactor = CourseListInteractor(presenter: presenter)
        let router = CourseListRouter(view: view)
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
