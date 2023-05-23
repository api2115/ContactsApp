//
//  HistoryTableViewCell.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 16/05/2023.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    private (set) var callHistory: CallHistory!
    
    //MARK: - UI components
    lazy var subtextLabel = UILabel()
    lazy var arrow = UIImageView()
    lazy var rightLabel = UILabel()

    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(with callHistory: CallHistory) {
        self.callHistory = callHistory
        backgroundColor = .white
        textLabel?.text = callHistory.date
        textLabel?.textColor = .black
        textLabel?.font = UIFont.systemFont(ofSize: 16)

        subtextLabel.text = callHistory.phoneNumber

        let image = UIImage(named: callHistory.icon ?? "")
        let templateImage = image?.withRenderingMode(.alwaysTemplate)
        arrow.image = templateImage
        arrow.tintColor = .gray

        rightLabel.text = callHistory.status

        if callHistory.callType == "missed" {
            let color = UIColor(named: "RedTextColor")
            textLabel?.textColor = color
            arrow.tintColor = color
        }
        
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
            arrow.leftAnchor.constraint(equalTo: subtextLabel.rightAnchor, constant: 7),
            arrow.centerYAnchor.constraint(equalTo: subtextLabel.centerYAnchor)
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
