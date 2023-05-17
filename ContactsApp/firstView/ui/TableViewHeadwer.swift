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
    
    lazy var moreOptions: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "MoreIcon"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
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
        
        addSubview(addLabel)
        addSubview(moreOptions)
        addSubview(searchButton)
        
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        moreOptions.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            addLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            addLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            moreOptions.rightAnchor.constraint(equalTo: rightAnchor, constant: -22),
            moreOptions.centerYAnchor.constraint(equalTo: centerYAnchor),
            moreOptions.widthAnchor.constraint(equalToConstant: 4),
            moreOptions.heightAnchor.constraint(equalToConstant: 16),
            
            searchButton.rightAnchor.constraint(equalTo: moreOptions.leftAnchor, constant: -29),
            searchButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            searchButton.widthAnchor.constraint(equalToConstant: 17),
            searchButton.heightAnchor.constraint(equalToConstant: 17),
        ])

    }
    
    
    
}
