//
//  CourseListViewController.swift
//  CoursesApp
//
//  Created by Nikita Chekan on 12.01.2023.
//

import UIKit

class CourseListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    private var activityIndicator: UIActivityIndicatorView?
    private var viewModel: CourseListViewModelProtocol! {
        didSet {
            viewModel.fetchCourses { [weak self] in
                self?.tableView.reloadData()
                self?.activityIndicator?.stopAnimating()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CourseListViewModel()
        tableView.rowHeight = 100
        activityIndicator = showActivityIndicator(in: view)
        setupNavigationBar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? CourseDetailsViewController else {
            return
        }
        detailVC.course = sender as? Course
    }
    
    private func setupNavigationBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    private func showActivityIndicator(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .black
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        
        return activityIndicator
    }
}

// MARK: - UITableViewDataSource
extension CourseListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell", for: indexPath)
        guard let cell = cell as? CourseCell else { return UITableViewCell() }
        let course = viewModel.courses[indexPath.row]
        cell.configure(with: course)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CourseListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let course = viewModel.courses[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: course)
    }
}

