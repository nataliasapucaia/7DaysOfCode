//
//  MovieTableViewCell.swift
//  7DaysOfCode
//
//  Created by Natália Sapucaia on 20/01/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    static let identifier = "MovieTableViewCell"

    let movieCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 18

        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "SFPro-Bold", size: 18)
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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    public func setupData(with movie: Movie) {
        titleLabel.text = movie.title
        releaseDateLabel.text = "Lançamento: \(formatReleaseDate(releaseDate: movie.releaseDate))"
    }

    func formatReleaseDate( releaseDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"

        let dateFormatted = DateFormatter()
        dateFormatted.dateFormat = "dd/MM/YYYY"
        

        if let date = dateFormatter.date(from: releaseDate) {
            return dateFormatted.string(from: date)
        } else {
           return "There was an error decoding the string"
        }
    }
}

extension MovieTableViewCell: CodeView {
    func buildVierHierarchy() {
        addSubview(movieCoverImageView)
        addSubview(titleLabel)
        addSubview(releaseDateLabel)
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            movieCoverImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            movieCoverImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            movieCoverImageView.widthAnchor.constraint(equalToConstant: 90),
            movieCoverImageView.heightAnchor.constraint(equalToConstant: 120),

            titleLabel.leadingAnchor.constraint(equalTo: movieCoverImageView.trailingAnchor, constant: 16),
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
