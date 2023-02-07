//
//  Course.swift
//  CoursesApp
//
//  Created by Nikita Chekan on 12.01.2023.
//

import UIKit

@objc protocol CourseDetailsRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol CourseDetailsDataPassing {
    var dataStore: CourseDetailsDataStore? { get }
}

class CourseDetailsRouter: NSObject, CourseDetailsRoutingLogic, CourseDetailsDataPassing {
    
    weak var viewController: CourseDetailsViewController?
    var dataStore: CourseDetailsDataStore?
}
