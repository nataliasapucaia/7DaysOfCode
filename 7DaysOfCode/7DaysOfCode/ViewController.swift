//
//  ViewController.swift
//  7DaysOfCode
//
//  Created by Natália Sapucaia on 20/01/23.
//

import UIKit

class ViewController: UIViewController {

    let movies: [Movie] = [
        Movie(id: 1, title: "Órfã 2: A Origem", releaseDate: "2022-07-27", image: nil, overview: "", voteAverage: 7.2),
        Movie(id: 2, title: "Minions 2: A Origem de Gru", releaseDate: "2022-06-29", image: nil, overview: "", voteAverage: 7.8),
        Movie(id: 3, title: "Thor: Amor e Trovão", releaseDate: "2022-07-06", image: nil, overview: "", voteAverage: 6.8),
        Movie(id: 4, title: "Avatar", releaseDate: "2009-12-18", image: nil, overview: "", voteAverage: 8.8),
    ]

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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        moviesTableView.delegate = self
        moviesTableView.dataSource = self

    }
}

extension ViewController: CodeView {
    func buildVierHierarchy() {
//        moviesTableView.addSubview(movieTitle)

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

//            movieTitle.centerXAnchor.constraint(equalTo: moviesTableView.centerXAnchor),
//            movieTitle.centerYAnchor.constraint(equalTo: moviesTableView.centerYAnchor)
        ])
    }

    func setUpAdditionalConfiguration() {
        let topColor = UIColor(red: 46.0/255, green: 19.0/255, blue: 113.0/255, alpha: 1)
        let bottomColor = UIColor(red: 19/255, green: 11/255, blue: 43/255, alpha: 1)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension ViewController: UITableViewDelegate {

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.backgroundColor = .clear
        cell.textLabel?.text = movies[indexPath.row].title
        cell.textLabel?.textColor = .white

        return cell
    }
}
