//
//  HistoryTableViewCell.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 16/05/2023.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    //MARK: - UI components
    lazy var subtextLabel = UILabel()
    lazy var arrow = UIImageView()
    lazy var rightLabel = UILabel()

    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    //MARK: - UI setup
    private func setupViews() {
        
        textLabel?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textLabel!.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
        ])
        
        contentView.addSubview(subtextLabel)
        subtextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            subtextLabel.topAnchor.constraint(equalTo: textLabel!.bottomAnchor, constant: 5),
        ])
        subtextLabel.font = UIFont.systemFont(ofSize: 12)
        subtextLabel.textColor = UIColor.gray
        
        contentView.addSubview(arrow)
        arrow.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            arrow.leftAnchor.constraint(equalTo: subtextLabel.rightAnchor, constant: 2),
            arrow.topAnchor.constraint(equalTo: subtextLabel.topAnchor),
            arrow.heightAnchor.constraint(equalToConstant: 16.333333/1.18),
            arrow.widthAnchor.constraint(equalToConstant: 14.333333/1.18),
        ])
        
        contentView.addSubview(rightLabel)
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            rightLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
        rightLabel.font = UIFont.systemFont(ofSize: 12)
        rightLabel.textColor = UIColor.gray
        

    }

}
