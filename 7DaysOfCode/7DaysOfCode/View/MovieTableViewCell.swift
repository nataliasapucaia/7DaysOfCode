//
//  MovieTableViewCell.swift
//  7DaysOfCode
//
//  Created by Natália Sapucaia on 20/01/23.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    // MARK: Instance Properties

    static let identifier = "MovieTableViewCell"

    // MARK: Views

    let moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 18

        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "SFPro-Bold", size: 20)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .releaseDateGray

        return label
    }()

    // MARK: Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Functions

    public func setupData(with movie: Movie) {
        titleLabel.text = movie.title
        releaseDateLabel.text = "Lançamento: \(movie.releaseDate.formatDate())"
        configureImage(imageURL: movie.posterPath)
    }

    private func configureImage(imageURL: String) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(imageURL)")
        moviePosterImageView.kf.setImage(with: url)
    }
}

// MARK: View Code

extension MovieTableViewCell: ViewCode {
    func buildVierHierarchy() {
        addSubview(moviePosterImageView)
        addSubview(titleLabel)
        addSubview(releaseDateLabel)
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            moviePosterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            moviePosterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 90),
            moviePosterImageView.heightAnchor.constraint(equalToConstant: 120),

            titleLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),

            releaseDateLabel.topAnchor.constraint(equalTo: centerYAnchor),
            releaseDateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            releaseDateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }

    func setUpAdditionalConfiguration() {
        backgroundColor = .clear
    }
}
