//
//  ViewController.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 15/05/2023.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - CoreData Context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

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
        button.setTitle("+", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 30
        return button
    }()
    
    lazy var dropDownMenu = DropDownMenu()
    lazy var sortDropDown = SortDropDown()
    lazy var searchHeader = SearchHeader()
    lazy var emptyLabel = EmptyView()
    
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
            headerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70),
            headerView.heightAnchor.constraint(equalToConstant: 60),
            headerView.widthAnchor.constraint(equalTo: self.view.widthAnchor),


        ])


    }
    
    
}


