//
//  SetUpUI.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 17/05/2023.
//

import UIKit

extension MainViewController {
    func setUpButtonsTargets() {
        addButton.addTarget(self, action: #selector(addButtonTap), for: .touchUpInside)
        
        headerView.moreOptionsButton.addTarget(self, action: #selector(moreOptionTap), for: .touchUpInside)
        
        dropDownMenu.sortOptionsButton.addTarget(self, action: #selector(sortOptionsTap), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOutsideDropDown(_:)))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)

        headerView.searchButton.addTarget(self, action: #selector(showSearchBar), for: .touchUpInside)
    }
    
    func setUpTableView() {
        if self.viewModel.Contacts.isEmpty {
            addToView(emptyLabel)
            NSLayoutConstraint.activate([
                emptyLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                emptyLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 170)
            ])
            tableView.removeFromSuperview()
        }else {
            addToView(tableView)
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
                tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            ])
            emptyLabel.removeFromSuperview()
        }
        addToView(addButton)
        NSLayoutConstraint.activate([
            addButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -40),
            addButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80),
            addButton.heightAnchor.constraint(equalToConstant: 60),
            addButton.widthAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    func setUpDropDown() {
        
        addToView(dropDownMenu)

        NSLayoutConstraint.activate([
            dropDownMenu.topAnchor.constraint(equalTo: headerView.moreOptionsButton.topAnchor),
            dropDownMenu.rightAnchor.constraint(equalTo: headerView.moreOptionsButton.rightAnchor),
            dropDownMenu.heightAnchor.constraint(equalToConstant: 107),
            dropDownMenu.widthAnchor.constraint(equalToConstant: 224),


        ])
    }

    func setUpSortDropDown() {
        addToView(sortDropDown)

        NSLayoutConstraint.activate([
            sortDropDown.topAnchor.constraint(equalTo: headerView.moreOptionsButton.topAnchor),
            sortDropDown.rightAnchor.constraint(equalTo: headerView.moreOptionsButton.rightAnchor),
            sortDropDown.heightAnchor.constraint(equalToConstant: 151),
            sortDropDown.widthAnchor.constraint(equalToConstant: 224)
        ])
    }

    func setUpSearch() {
        addToView(searchHeader)

        NSLayoutConstraint.activate([
            searchHeader.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            searchHeader.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            searchHeader.heightAnchor.constraint(equalToConstant: 60),
            searchHeader.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -55),
        ])
    }
    
}
