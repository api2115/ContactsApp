//
//  SortDropDown.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 16/05/2023.
//

import UIKit

class SortDropDown: UIView {
    
    // MARK: - UI Components
    lazy var sortOptions: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.tintColor = .black
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 0)
        
        let iconImage = UIImage(systemName: "arrowtriangle.left.fill")
        button.setImage(iconImage, for: .normal)
        button.imageView?.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
        
        let grayTitle = NSAttributedString(string: "Sort By", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        button.setAttributedTitle(grayTitle, for: .normal)
        
        return button
    }()
    
    lazy var azButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.backgroundColor = .white
        button.isUserInteractionEnabled = true
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
        addSubview(sortOptions)
        sortOptions.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(azButton)
        azButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(zaButton)
        zaButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sortOptions.topAnchor.constraint(equalTo: topAnchor),
            sortOptions.leftAnchor.constraint(equalTo: leftAnchor),
            sortOptions.heightAnchor.constraint(equalToConstant: 151/3),
            sortOptions.widthAnchor.constraint(equalToConstant: 224),
            
            azButton.topAnchor.constraint(equalTo: sortOptions.bottomAnchor),
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
