//
//  CourseDetailsPresenter.swift
//  CoursesApp
//
//  Created by Nikita Chekan on 30.01.2023.
//

import Foundation

struct CourseDetailsDataStore {
    
}

class CourseDetailsPresenter: CourseDetailsViewOutputProtocol {
    var interactor: CourseDetailsInteractorInputProtocol!
    private unowned let view: CourseDetailsViewInputProtocol
    
    required init(view: CourseDetailsViewInputProtocol) {
        self.view = view
    }
    
    func showDetails() {
        
    }
}

// MARK: - CourseDetailsInteractorInputProtocol
extension CourseDetailsPresenter: CourseDetailsInteractorOutputProtocol {
    
}
