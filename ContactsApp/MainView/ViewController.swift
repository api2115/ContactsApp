//
//  ViewController.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 15/05/2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    var models = [Contact]()
    
    // MARK: - UI Components
    lazy var headerView = TableViewHeadwer()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor(named: "DefaultColor")
        tableView.separatorStyle = .none
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "PlusIcon"), for: .normal)
        button.backgroundColor = UIColor(named: "AdderButtonBackgroundColor")
        button.layer.cornerRadius = 30
        button.layer.shadowColor = UIColor(named: "AdderButtonShadowColor")?.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 14)
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 50
        return button
    }()
    
    lazy var dropDownMenu = DropDownMenu()
    lazy var sortDropDown = SortDropDown()
    lazy var searchHeader = SearchHeader()
    lazy var emptyLabel = EmptyTableView()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.getAllItems()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        searchHeader.searchFieldDelegate = self
        
        self.view.backgroundColor = UIColor(named: "DefaultColor")
        
        setUpButtonsTargets()
        
    }
    
    // MARK: - UI Setup
    private func setupUI() {

        addToView(headerView)

        NSLayoutConstraint.activate([
            headerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            headerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.15),
            headerView.widthAnchor.constraint(equalTo: self.view.widthAnchor),

        ])
    }
    
}


