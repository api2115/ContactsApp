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
        
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor(named: "HeaderShadowColor")?.cgColor
        layer.shadowRadius = 35
        
        addSubview(contactsLabel)
        addSubview(backButton)
        
        
        contactsLabel.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            backButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -19),
            
            contactsLabel.leftAnchor.constraint(equalTo: backButton.rightAnchor, constant: 34),
            contactsLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            
            
        ])
    }
    


}

