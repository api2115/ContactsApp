//
//  DropDownMenu.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 16/05/2023.
//

import UIKit

class DropDownMenu: UIView {
    
    // MARK: - UI Components
    lazy var sortOptionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.tintColor = .black
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 0)
        let iconImage = UIImage(named: "SortOptionsIcon")
        button.setImage(iconImage, for: .normal)
        button.setTitle("Sort by", for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: button.titleLabel!.frame.width + 15, bottom: 0, right: 0)

        
        return button
    }()
    
    lazy var deleteAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isUserInteractionEnabled = true
        button.setTitle("Delete All", for: .normal)
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 0)
        return button
    }()
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        layer.cornerRadius = 15
        clipsToBounds = true
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor(named: "DropDownShadowColor")?.cgColor
        layer.shadowRadius = 34
        addSubview(sortOptionsButton)
        addSubview(deleteAllButton)
        
        sortOptionsButton.translatesAutoresizingMaskIntoConstraints = false
        deleteAllButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            sortOptionsButton.topAnchor.constraint(equalTo: topAnchor),
            sortOptionsButton.leftAnchor.constraint(equalTo: leftAnchor),
            sortOptionsButton.heightAnchor.constraint(equalToConstant: 107/2),
            sortOptionsButton.widthAnchor.constraint(equalToConstant: 224),
            
            deleteAllButton.topAnchor.constraint(equalTo: sortOptionsButton.bottomAnchor),
            deleteAllButton.leftAnchor.constraint(equalTo: leftAnchor),
            deleteAllButton.heightAnchor.constraint(equalToConstant: 107/2),
            deleteAllButton.widthAnchor.constraint(equalToConstant: 224),
        ])
        
    }
}
