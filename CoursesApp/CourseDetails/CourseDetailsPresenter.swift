//
//  CourseDetailsPresenter.swift
//  SwiftbookApp
//
//  Course.swift
//  CoursesApp
//
//  Created by Nikita Chekan on 12.01.2023.
//

import Foundation

protocol CourseDetailsPresentationLogic {
    func presentCourseDetails(response: CourseDetails.ShowDetails.Response)
    func presentFavoriteStatus(response: CourseDetails.SetFavoriteStatus.Response)
}

class CourseDetailsPresenter: CourseDetailsPresentationLogic {
    
    weak var viewController: CourseDetailsDisplayLogic?
    
    func presentCourseDetails(response: CourseDetails.ShowDetails.Response) {
        let numberOfLessons = "Number of lessons: \(response.numberOfLessons ?? 0)"
        let numberOfTests = "Number of tests: \(response.numberOfTests ?? 0)"
        
        let viewModel = CourseDetails.ShowDetails.ViewModel(
            courseName: response.courseName ?? "",
            numberOfLessons: numberOfLessons,
            numberOfTests: numberOfTests,
            imageData: response.imageData ?? Data(),
            isFavorite: response.isFavorite
        )
        viewController?.displayCourseDetails(viewModel: viewModel)
    }
    
    func presentFavoriteStatus(response: CourseDetails.SetFavoriteStatus.Response) {
        let viewModel = CourseDetails.SetFavoriteStatus.ViewModel(isFavorite: response.isFavorite)
        viewController?.displayFavoriteButtonStatus(viewModel: viewModel)
    }
}
