//
//  HeaderView.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 15/05/2023.
//

import UIKit

class HeaderView: UIView {
    
    //MARK: - UI Components
    private lazy var addLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.text = "Add"
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "checkmark"), for: .normal)
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
    
    //MARK: - SetUpUI
    private func setupUI() {
        backgroundColor = .white
        
        addSubview(addLabel)
        addSubview(backButton)
        
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            backButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            addLabel.leftAnchor.constraint(equalTo: backButton.rightAnchor, constant: 34),
            addLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
        ])
    }
    
    //MARK: - Button Functions
    
    func setUpAddButton() {

        addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.leftAnchor.constraint(equalTo: addLabel.rightAnchor, constant: 220).isActive = true
        addButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

    }
    
    func delButton() {
        addButton.removeFromSuperview()
    }

}
