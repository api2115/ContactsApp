//
//  ImageTableViewCell.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 15/05/2023.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    lazy var leftImageView = UIImageView()
    lazy var rightImageView = UIImageView()
    lazy var subtextLabel = UILabel()

    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    // MARK: - UI Setup
    private func setupViews() {
        
        contentView.addSubview(leftImageView)
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            leftImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            leftImageView.widthAnchor.constraint(equalToConstant: 40),
            leftImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        textLabel?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel!.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: 12),
            textLabel!.topAnchor.constraint(equalTo: leftImageView.topAnchor)
        ])
        
        contentView.addSubview(subtextLabel)
        subtextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtextLabel.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: 12),
            subtextLabel.topAnchor.constraint(equalTo: textLabel!.bottomAnchor, constant: 5),
            subtextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
        subtextLabel.font = UIFont.systemFont(ofSize: 14)
        subtextLabel.textColor = UIColor.gray

        contentView.addSubview(rightImageView)
        rightImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -33),
            rightImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            rightImageView.widthAnchor.constraint(equalToConstant: 23),
            rightImageView.heightAnchor.constraint(equalToConstant: 23)
        ])
    }
}
