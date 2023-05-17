//
//  SearchHeader.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 17/05/2023.
//

import UIKit

class SearchHeader: UIView, UITextFieldDelegate {
    //MARK: - Protocol Delegate
    weak var searchFieldDelegate: SearchFieldDelegate?
    
    //MARK: - UI components
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .black
        button.contentMode = .scaleAspectFill
        return button
    }()
    
    lazy var searchField: UITextField = {
        let tf = UITextField()
        let attributedPlaceholder = NSAttributedString(string: "Search...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        tf.attributedPlaceholder = attributedPlaceholder
        tf.textColor = .black
        
        return tf
    }()
    
    lazy var ereaseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .gray
        button.contentMode = .scaleAspectFill
        return button
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        searchField.delegate = self
        ereaseButton.addTarget(self, action: #selector(ereaseSearch), for: .touchUpInside)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Ui Setup
    private func setupUI() {
        backgroundColor = .white
        addSubview(backButton)
        addSubview(searchField)
        addSubview(ereaseButton)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        searchField.translatesAutoresizingMaskIntoConstraints = false
        ereaseButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 21),
            backButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 10.74),
            backButton.heightAnchor.constraint(equalToConstant: 18.77),
            
            searchField.leftAnchor.constraint(equalTo: backButton.rightAnchor, constant: 20),
            searchField.topAnchor.constraint(equalTo: topAnchor),
            searchField.bottomAnchor.constraint(equalTo: bottomAnchor),
            searchField.trailingAnchor.constraint(equalTo: ereaseButton.leadingAnchor, constant: -10),
            
            
            ereaseButton.rightAnchor.constraint(equalTo: rightAnchor),
            ereaseButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            ereaseButton.widthAnchor.constraint(equalToConstant: 13),
            ereaseButton.heightAnchor.constraint(equalToConstant: 13)
        ])
        
    }
    
    //MARK: - Erease Function
    
    @objc func ereaseSearch() {
        searchField.text = ""
    }

    //MARK: - SearchFieldProtocol
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        searchFieldDelegate?.textFieldTextChanged(textField.text)
    }
    
    
    
}
