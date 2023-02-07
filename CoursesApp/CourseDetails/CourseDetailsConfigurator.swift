//
//  CourseDetailsConfigurator.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 25.10.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation

final class CourseDetailsConfigurator {
    static let shared = CourseDetailsConfigurator()
    
    private init() {}
    
    func configure(with viewController: CourseDetailsViewController) {
        let interactor = CourseDetailsInteractor()
        let presenter = CourseDetailsPresenter()
        let router = CourseDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
