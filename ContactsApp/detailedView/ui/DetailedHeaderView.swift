//
//  HeaderView.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 16/05/2023.
//

import UIKit

class DetailedHeaderView: UIView {
    
    //MARK: - UI components
    private lazy var contactsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.text = "Contacts"
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = .black
        return button
    }()

    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI setup
    private func setupUI() {
        backgroundColor = .white
        
        addSubview(contactsLabel)
        addSubview(backButton)
        
        
        contactsLabel.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            backButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            contactsLabel.leftAnchor.constraint(equalTo: backButton.rightAnchor, constant: 34),
            contactsLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            
        ])
    }
    


}

