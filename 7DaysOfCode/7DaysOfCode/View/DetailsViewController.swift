//
//  DetailsViewController.swift
//  7DaysOfCode
//
//  Created by Natália Sapucaia on 27/01/23.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    let viewModel: DetailsViewModelProtocol

    // MARK: Views
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SFPro-Bold", size: 28)
        label.textColor = .white

        return label
    }()

    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40

        return imageView
    }()

    let voteAverageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SFPro-Bold", size: 16)
        label.textColor = .white

        return label
    }()

    let overviewTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.textColor = .white
        textView.font =  .systemFont(ofSize: 18)
        textView.textAlignment = .justified
        return textView

    }()
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupData(movie: viewModel.movie)
        setupView()
    }

    // MARK: Initialization
    init(viewModel: DetailsViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupData(movie: Movie) {
        titleLabel.text = movie.title
        configureImage(imageURL: movie.posterPath)
        voteAverageLabel.text = "Classificação dos usuários: \(movie.voteAverage)"
        overviewTextView.text = movie.overview
    }

    func configureImage(imageURL: String) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(imageURL)")
        posterImageView.kf.setImage(with: url)
    }

}

extension DetailsViewController: ViewCode {
    func buildVierHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(posterImageView)
        view.addSubview(voteAverageLabel)
        view.addSubview(overviewTextView)
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            posterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            posterImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            posterImageView.widthAnchor.constraint(equalToConstant: 176),
            posterImageView.heightAnchor.constraint(equalToConstant: 235),

            voteAverageLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 24),
            voteAverageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            overviewTextView.topAnchor.constraint(equalTo: voteAverageLabel.bottomAnchor, constant: 32),
            overviewTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            overviewTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            overviewTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }

    func setUpAdditionalConfiguration() {
        view.setGradientBackground()
    }
}
