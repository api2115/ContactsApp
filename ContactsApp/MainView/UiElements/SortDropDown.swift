//
//  SortDropDown.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 16/05/2023.
//

import UIKit

class SortDropDown: UIView {
    
    // MARK: - UI Components
    lazy var sortOptionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.tintColor = .black
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 0)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        let iconImage = UIImage(named: "BackFromSortIcon")
        button.setImage(iconImage, for: .normal)
        let grayTitle = NSAttributedString(string: "Sort By", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        button.setAttributedTitle(grayTitle, for: .normal)
        
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: button.imageView!.frame.width + 15, bottom: 0, right: 0)
        
        return button
    }()
    
    lazy var azButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.backgroundColor = .white
        button.isUserInteractionEnabled = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle("A-Z", for: .normal)
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 0)
        return button
    }()
    
    lazy var zaButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.backgroundColor = .white
        button.isUserInteractionEnabled = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle("Z-A", for: .normal)
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
        backgroundColor = .white
        layer.cornerRadius = 15
        clipsToBounds = true
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor(named: "DropDownShadowColor")?.cgColor
        layer.shadowRadius = 34
        addSubview(sortOptionsButton)
        sortOptionsButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(azButton)
        azButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(zaButton)
        zaButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sortOptionsButton.topAnchor.constraint(equalTo: topAnchor),
            sortOptionsButton.leftAnchor.constraint(equalTo: leftAnchor),
            sortOptionsButton.heightAnchor.constraint(equalToConstant: 151/3),
            sortOptionsButton.widthAnchor.constraint(equalToConstant: 224),
            
            azButton.topAnchor.constraint(equalTo: sortOptionsButton.bottomAnchor),
            azButton.leftAnchor.constraint(equalTo: leftAnchor),
            azButton.heightAnchor.constraint(equalToConstant: 151/3),
            azButton.widthAnchor.constraint(equalToConstant: 224),
            
            zaButton.topAnchor.constraint(equalTo: azButton.bottomAnchor),
            zaButton.leftAnchor.constraint(equalTo: leftAnchor),
            zaButton.heightAnchor.constraint(equalToConstant: 151/3),
            zaButton.widthAnchor.constraint(equalToConstant: 224),
        ])
        
        
    }
    
    
}
