//
//  DropDownMenu.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 16/05/2023.
//

import UIKit

class DropDownMenu: UIView {
    
    // MARK: - UI Components
    lazy var sortOptions: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.tintColor = .black
        button.contentHorizontalAlignment = .left
        
        let iconImage = UIImage(systemName: "arrowtriangle.right.fill")
        button.setImage(iconImage, for: .normal)
        button.setTitle("Sort by", for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: button.titleLabel!.frame.width + 21, bottom: 0, right: 0)
        button.imageView?.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
        
        return button
    }()
    
    lazy var deleteAll: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.backgroundColor = .white
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
        
        addSubview(sortOptions)
        addSubview(deleteAll)
        
        sortOptions.translatesAutoresizingMaskIntoConstraints = false
        deleteAll.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            sortOptions.topAnchor.constraint(equalTo: topAnchor),
            sortOptions.leftAnchor.constraint(equalTo: leftAnchor),
            sortOptions.heightAnchor.constraint(equalToConstant: 107/2),
            sortOptions.widthAnchor.constraint(equalToConstant: 224),
            
            deleteAll.topAnchor.constraint(equalTo: sortOptions.bottomAnchor),
            deleteAll.leftAnchor.constraint(equalTo: leftAnchor),
            deleteAll.heightAnchor.constraint(equalToConstant: 107/2),
            deleteAll.widthAnchor.constraint(equalToConstant: 224),
        ])
        
    }
}
