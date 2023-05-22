//
//  AdderViewController.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 15/05/2023.
//

import UIKit

class AdderViewController: UIViewController {

    //MARK: - Protocols delegate
    weak var delegate: PresentedViewControllerDelegate?
    weak var dataDelegate: DataDelegateProtocol?
    
    //MARK: - UI components
    lazy var headerView = HeaderView()
    lazy var nameLabel = TextFieldNameLabel("Name")
    lazy var nameInputField = InputField("Enter Name")
    lazy var surnameLabel = TextFieldNameLabel("Surname")
    lazy var surnameInputField = InputField("Enter Surname")
    lazy var numberLabel = TextFieldNameLabel("Phone number")
    lazy var numberInputField = InputField("+998 __ ___ __ __")
    
    //MARK: - Lifecycle
    let oldName: String
    let oldSurname: String
    let oldNumber: String
    var oldContact: Contact?
    //Initializer for edit
    init(oldContact: Contact?, oldName: String, oldSurname: String, oldNumber: String) {
        self.oldContact = oldContact
        self.oldName = oldName
        self.oldSurname = oldSurname
        self.oldNumber = oldNumber
        super.init(nibName: nil, bundle: nil)
    }
    //Initializer for add
    init() {
        self.oldName = ""
        self.oldSurname = ""
        self.oldNumber = ""
        self.oldContact = nil
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpForUpdateView()
        headerView.backButton.addTarget(self, action: #selector(backButtonTap), for: .touchUpInside)
    }
    
    //MARK: - Ui Setup
    private func setUpView() {
        self.view.backgroundColor = UIColor(named: "DefaultColor")
        
        addToView(headerView)
        addToView(nameLabel)
        addToView(nameInputField)
        nameInputField.delegate = self
        nameInputField.text = oldName
        
        addToView(surnameLabel)
        addToView(surnameInputField)
        surnameInputField.delegate = self
        surnameInputField.text = oldSurname
        
        addToView(numberLabel)
        addToView(numberInputField)
        numberInputField.delegate = self
        numberInputField.text = oldNumber
        
        NSLayoutConstraint.activate([
            
            headerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            headerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.15),
            headerView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 30),
            nameLabel.leftAnchor.constraint(equalTo: nameInputField.leftAnchor),
            
            nameInputField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            nameInputField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            nameInputField.heightAnchor.constraint(equalToConstant: 50),
            nameInputField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),

            surnameLabel.topAnchor.constraint(equalTo: nameInputField.bottomAnchor, constant: 20),
            surnameLabel.leftAnchor.constraint(equalTo: surnameInputField.leftAnchor),
            
            surnameInputField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            surnameInputField.topAnchor.constraint(equalTo: surnameLabel.bottomAnchor, constant: 5),
            surnameInputField.heightAnchor.constraint(equalToConstant: 50),
            surnameInputField.widthAnchor.constraint(equalTo: nameInputField.widthAnchor),
            
            numberLabel.topAnchor.constraint(equalTo: surnameInputField.bottomAnchor, constant: 20),
            numberLabel.leftAnchor.constraint(equalTo: numberInputField.leftAnchor),
            
            numberInputField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            numberInputField.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 5),
            numberInputField.heightAnchor.constraint(equalToConstant: 50),
            numberInputField.widthAnchor.constraint(equalTo: nameInputField.widthAnchor),
            
        ])
    }
    
    private func setUpForUpdateView() {
        let color = UIColor(named: "AdderFormInputBorderColor")?.cgColor
        if(!oldName.isEmpty) {
            nameInputField.layer.borderColor = color
        }
        
        if(!oldSurname.isEmpty) {
            surnameInputField.layer.borderColor = color
        }

        if(!oldNumber.isEmpty) {
            numberInputField.layer.borderColor = color
        }
    }
}
