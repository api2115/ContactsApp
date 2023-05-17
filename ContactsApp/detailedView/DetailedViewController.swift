//
//  DetailedViewController.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 16/05/2023.
//

import UIKit

class DetailedViewController: UIViewController {
    
    //MARK: - CoreData Context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //MARK: - Protocols delegate
    weak var delegate: PresentedViewControllerDelegate?

    //MARK: - UI components
    private lazy var headerView = DetailedHeaderView()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .white
        tableView.allowsSelection = false
        return tableView
    }()

    private lazy var profileIcon = IconView("ProfileIcon")
    private lazy var binIcon = IconView("BinIcon")
    private lazy var penIcon = IconView("PenIcon")
    private lazy var phoneIcon = RoundIcon(name: "PhoneIcon", color: UIColor(named: "CallColor")!)
    private lazy var smsIcon = RoundIcon(name: "SmsIcon", color: UIColor(named: "SmsColor")!)
    private lazy var callHistoryLabel = TextLabel(12, "Call history")
    
    //MARK: - Lifecycle
    var nameLabel: TextLabel
    var numberLabel: TextLabel
    var model: Contact
    var callHistory: [[String]]
    init(_ model: Contact, _ callHistory: [[String]]) {
        self.model = model
        self.nameLabel = TextLabel(22, model.name! + " " + model.surname!)
        self.numberLabel = TextLabel(16, model.number!)
        self.callHistory = callHistory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(named: "DefaultColor")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        setUpView()
        setUpButtonsTarget()
        
    }
    
    //MARK: - Ui Setup
    func setUpView() {

        addToView(headerView)
        addToView(profileIcon)
        addToView(nameLabel)
        addToView(numberLabel)
        addToView(phoneIcon)
        addToView(smsIcon)
        addToView(callHistoryLabel)
        callHistoryLabel.textColor = .gray
        addToView(tableView)
        addToView(binIcon)
        addToView(penIcon)
        
        
        NSLayoutConstraint.activate([
            headerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            headerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70),
            headerView.heightAnchor.constraint(equalToConstant: 60),
            headerView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            
            profileIcon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            profileIcon.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 60),
            profileIcon.widthAnchor.constraint(equalToConstant: 83),
            profileIcon.heightAnchor.constraint(equalToConstant: 83),
            
            nameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: profileIcon.bottomAnchor, constant: 30),
            
            numberLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            numberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 36),

            smsIcon.centerYAnchor.constraint(equalTo: numberLabel.centerYAnchor),
            smsIcon.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -35),
            
            phoneIcon.centerYAnchor.constraint(equalTo: numberLabel.centerYAnchor),
            phoneIcon.rightAnchor.constraint(equalTo: smsIcon.leftAnchor, constant: -55),
            
            callHistoryLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            callHistoryLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 50),
            
            tableView.topAnchor.constraint(equalTo: callHistoryLabel.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            binIcon.bottomAnchor.constraint(equalTo: profileIcon.bottomAnchor),
            binIcon.leftAnchor.constraint(equalTo: profileIcon.rightAnchor, constant: 65),
            binIcon.heightAnchor.constraint(equalToConstant: 18),
            binIcon.widthAnchor.constraint(equalToConstant: 14),
            
            penIcon.bottomAnchor.constraint(equalTo: profileIcon.bottomAnchor),
            penIcon.leftAnchor.constraint(equalTo: profileIcon.rightAnchor, constant: 103),
            penIcon.heightAnchor.constraint(equalToConstant: 18),
            penIcon.widthAnchor.constraint(equalToConstant: 18),
            
        ])
    }

    func setUpButtonsTarget() {
        headerView.backButton.addTarget(self, action: #selector(backButtonTap), for: .touchUpInside)
        
        let binIconTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDelete))
        binIcon.addGestureRecognizer(binIconTapGesture)
        
        let penIconTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleEdit))
        penIcon.addGestureRecognizer(penIconTapGesture)
    }

}
