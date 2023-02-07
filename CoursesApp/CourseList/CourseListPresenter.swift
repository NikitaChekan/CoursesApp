//
//  Course.swift
//  CoursesApp
//
//  Created by Nikita Chekan on 12.01.2023.
//

protocol CourseListPresentationLogic {
    func presentCourses(response: CourseList.ShowCourses.Response)
}

class CourseListPresenter: CourseListPresentationLogic {
    
    weak var viewController: CourseListDisplayLogic?
    
    func presentCourses(response: CourseList.ShowCourses.Response) {
        let rows: [CourseCellViewModelProtocol] = response.courses.map {
            CourseCellViewModel(course: $0)
        }
        let viewModel = CourseList.ShowCourses.ViewModel(rows: rows)
        viewController?.displayCourses(viewModel: viewModel)
    }
}
