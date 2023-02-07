//
//  CourseDetailsInteractor.swift
//  CoursesApp
//
//  Created by jopootrivatel on 07.02.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol CourseDetailsBusinessLogic {
    func doSomething(request: CourseDetails.Something.Request)
}

protocol CourseDetailsDataStore {
    
}

class CourseDetailsInteractor: CourseDetailsBusinessLogic, CourseDetailsDataStore {
    
    var presenter: CourseDetailsPresentationLogic?
    var worker: CourseDetailsWorker?
    
    func doSomething(request: CourseDetails.Something.Request) {
        worker = CourseDetailsWorker()
        worker?.doSomeWork()
        
        let response = CourseDetails.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
