//
//  HeaderView.swift
//  NewsApp
//
//  Created by Юлия Караневская on 28.05.21.
//

import UIKit

final class HeaderView: UIView {
    
    private var fontSize: CGFloat
    
    private lazy var headingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "News"
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        return label
    }()
    
    private lazy var leftHeaderImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        imageView.image = UIImage(systemName: "eye.circle.fill", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        return imageView
    }()
    
    private lazy var rightHeaderImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //imageView.contentMode = .scaleAspectFit
        let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        imageView.image = UIImage(systemName: "ear.fill", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        return imageView
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [leftHeaderImage, headingLabel, rightHeaderImage])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var subHeadingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Top News"
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        label.textColor = .darkGray
        return label
    }()
    
    init(fontSize: CGFloat) {
        self.fontSize = fontSize
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(headerStackView)
        addSubview(subHeadingLabel)
        setupConstraints()
    }
    
    func setupConstraints() {
        //header constraints
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
        //subheader constraints
        NSLayoutConstraint.activate([
            subHeadingLabel.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 10),
            subHeadingLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            subHeadingLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
}


