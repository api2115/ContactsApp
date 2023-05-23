//
//  TableViewHeadwer.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 15/05/2023.
//

import UIKit

class TableViewHeadwer: UIView {
    
    // MARK: - UI Components
    private lazy var addLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.text = "Contacts"
        return label
    }()
    
    lazy var moreOptionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "MoreIcon"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "SearchIcon"), for: .normal)
        button.tintColor = .black
        return button
    }()

    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        backgroundColor = .white
        
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor(named: "HeaderShadowColor")?.cgColor
        layer.shadowRadius = 35
        
        addSubview(addLabel)
        addSubview(moreOptionsButton)
        addSubview(searchButton)
        
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        moreOptionsButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            addLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            addLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -19),
            
            moreOptionsButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -22),
            moreOptionsButton.centerYAnchor.constraint(equalTo: addLabel.centerYAnchor),
            moreOptionsButton.widthAnchor.constraint(equalToConstant: 4),
            moreOptionsButton.heightAnchor.constraint(equalToConstant: 16),
            
            searchButton.rightAnchor.constraint(equalTo: moreOptionsButton.leftAnchor, constant: -29),
            searchButton.centerYAnchor.constraint(equalTo: addLabel.centerYAnchor),
            searchButton.widthAnchor.constraint(equalToConstant: 17),
            searchButton.heightAnchor.constraint(equalToConstant: 17),
        ])

    }
    
    
    
}
