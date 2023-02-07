///
//  Course.swift
//  CoursesApp
//
//  Created by Nikita Chekan on 12.01.2023.
//

import Foundation

protocol CourseDetailsBusinessLogic {
    func provideCourseDetails()
    func setFavoriteStatus()
}

protocol CourseDetailsDataStore {
    var course: Course? { get set }
    var isFavorite: Bool { get }
}

class CourseDetailsInteractor: CourseDetailsBusinessLogic, CourseDetailsDataStore {
    var course: Course?
    var isFavorite: Bool = false
    var presenter: CourseDetailsPresentationLogic?
    var worker: CourseDetailsWorker?
    
    func provideCourseDetails() {
        worker = CourseDetailsWorker()
        isFavorite = worker?.getFavoriteStatus(for: course?.name ?? "") ?? false
        let imageData = worker?.getImage(from: course?.imageUrl)
        
        let response = CourseDetails.ShowDetails.Response(
            courseName: course?.name,
            numberOfLessons: course?.numberOfLessons,
            numberOfTests: course?.numberOfTests,
            imageData: imageData,
            isFavorite: isFavorite
        )
        presenter?.presentCourseDetails(response: response)
    }
    
    func setFavoriteStatus() {
        isFavorite.toggle()
        worker?.setNewFavoriteStatus(for: course?.name ?? "", with: isFavorite)
        
        let response = CourseDetails.SetFavoriteStatus.Response(isFavorite: isFavorite)
        presenter?.presentFavoriteStatus(response: response)
    }
}
