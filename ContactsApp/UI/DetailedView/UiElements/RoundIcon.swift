//
//  RoundIcon.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 16/05/2023.
//

import UIKit

class RoundIcon: UIView {
    
    //MARK: - UI components
    private lazy var icon: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    private lazy var border: UILabel = {
        let b = UILabel()
        b.layer.cornerRadius = 20
        b.layer.masksToBounds = true
        return b
    }()

    //MARK: - Lifecycle
    init(name: String, color: UIColor) {
        super.init(frame: .zero)
        icon.image = UIImage(named: name)
        border.backgroundColor = color
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI setup
    func setUpUI() {
        addSubview(border)
        addSubview(icon)
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        border.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            border.centerXAnchor.constraint(equalTo: centerXAnchor),
            border.centerYAnchor.constraint(equalTo: centerYAnchor),
            border.heightAnchor.constraint(equalToConstant: 40),
            border.widthAnchor.constraint(equalToConstant: 40),
            
        ])
        
    }

}
