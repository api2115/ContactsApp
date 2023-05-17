//
//  EmptyView.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 17/05/2023.
//

import UIKit

class EmptyView: UIView {
    //MARK: - UI components
    private lazy var boxIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "BoxIcon")
        return iv
    }()
    
    private lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "You have no contacts yet"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Ui Setup
    private func setupUI() {
        addSubview(boxIcon)
        addSubview(emptyLabel)
        
        boxIcon.translatesAutoresizingMaskIntoConstraints = false
        emptyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            boxIcon.topAnchor.constraint(equalTo: topAnchor),
            boxIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
            boxIcon.heightAnchor.constraint(equalToConstant: 100),
            boxIcon.widthAnchor.constraint(equalToConstant: 105),
            
            emptyLabel.topAnchor.constraint(equalTo: boxIcon.bottomAnchor, constant: 20),
            emptyLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
        ])
        
    }
    
}
