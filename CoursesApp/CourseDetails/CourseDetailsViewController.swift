//
//  CourseDetailsViewController.swift
//  CoursesApp
//
//  Created by Nikita Chekan on 12.01.2023.
//

import UIKit

class CourseDetailsViewController: UIViewController {
    
    @IBOutlet private var courseNameLabel: UILabel!
    @IBOutlet private var numberOfLessonsLabel: UILabel!
    @IBOutlet private var numberOfTestsLabel: UILabel!
    @IBOutlet private var courseImage: UIImageView!
    @IBOutlet private var favoriteButton: UIButton!
    
    var course: Course!
    var viewModel: CourseDetailsViewModelProtocol! {
        didSet {
            viewModel.viewModelDidChange = { viewModel in
                self.setStatusForFavoriteButton(viewModel.isFavorite)
            }
            courseNameLabel.text = viewModel.courseName
            numberOfLessonsLabel.text = viewModel.numberOfLessons
            numberOfTestsLabel.text = viewModel.numberOfTests
            courseImage.image = UIImage(data: viewModel.imageData ?? Data())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CourseDetailsViewModel(course: course)
        setupUI()
    }
    
    @IBAction func toggleFavorite() {
        viewModel.favoriteButtonPressed()
    }
    
    private func setupUI() {
        setStatusForFavoriteButton(viewModel.isFavorite)
    }
    
    private func setStatusForFavoriteButton(_ status: Bool) {
        favoriteButton.tintColor = status ? .red : .gray
    }
}
