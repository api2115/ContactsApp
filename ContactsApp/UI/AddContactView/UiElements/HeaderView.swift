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
        button.setImage(UIImage(named: "AddIcon"), for: .normal)
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
        
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor(named: "HeaderShadowColor")?.cgColor
        layer.shadowRadius = 35
        
        addSubview(addLabel)
        addSubview(backButton)
        
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            backButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -19),
            
            addLabel.leftAnchor.constraint(equalTo: backButton.rightAnchor, constant: 34),
            addLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            
        ])
    }
    
    //MARK: - Button Functions
    
    func setUpAddButton() {
        addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -18).isActive = true
        addButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor).isActive = true

    }
    
    func delButton() {
        addButton.removeFromSuperview()
    }

}
