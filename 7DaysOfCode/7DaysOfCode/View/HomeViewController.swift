//
//  ViewController.swift
//  7DaysOfCode
//
//  Created by Natália Sapucaia on 20/01/23.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: Views
    let viewModel: HomeViewModelProtocol

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SFPro-Bold", size: 28)
        label.textColor = .white
        label.text = "Filmes Populares"

        return label
    }()

    let movieTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SFPro", size: 16)
        label.textColor = .white

        return label
    }()

    let moviesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear

        return tableView
    }()

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchMovies()
        configureTableView()
        bindViewModel()
        setupState(.initial)
        setupView()
//        getPopularMovies()
    }

    // MARK: Initialization
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Functions
    func bindViewModel() {
        viewModel.state.bind { [weak self] state in
            self?.setupState(state)
        }
    }

    func setupState(_ state: FetchMovieState) {
        switch state {
        case .initial:
            break
        case .data:
            DispatchQueue.main.async {
                self.moviesTableView.reloadData()
            }
        }
    }

    private func configureTableView() {
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier) 
    }


    //se não tivesse viewModel
//    private var requestNetworking = Network()
//    private var movies: [Movie] = [] {
//        didSet {
//            DispatchQueue.main.async {
//                self.moviesTableView.reloadData()
//            }
//        }
//    }
//    private func getPopularMovies() {
//        requestNetworking.fetchPopularMovies { movies in
//            self.movies = movies
//        }
//    }
}

// MARK: View Code

extension HomeViewController: ViewCode {
    func buildVierHierarchy() {

        view.addSubview(titleLabel)
        view.addSubview(moviesTableView)
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 87),

            moviesTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            moviesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moviesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    func setUpAdditionalConfiguration() {
        view.setGradientBackground()
    }
}

// MARK: UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 152
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = DetailsViewModel(movie: viewModel.movies[indexPath.row])
        self.navigationController?.pushViewController(DetailsViewController(viewModel: viewModel), animated: true)
    }
}

// MARK: UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        cell.selectionStyle = .none
        cell.setupData(with: viewModel.movies[indexPath.row])

        return cell
    }
}
