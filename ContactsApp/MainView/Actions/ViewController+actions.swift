//
//  ViewController+actions.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 15/05/2023.
//

import UIKit

extension ViewController: PresentedViewControllerDelegate, SearchFieldDelegate{
    
    //MARK: - Protocol Functions
    
    func textFieldTextChanged(_ text: String?) {
        searchContacts(text!)
    }
    
    func presentedViewControllerDismissed() {
        getAllItems()
    }
    
    //MARK: - Add Button
    
    @objc func addButtonTap() {
        let vc = AdderViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    //MARK: - SearchBar Functions
    
    private func searchContacts(_ text: String) {
        models = ContactsManager.shared.getAllItems()
        models = models.filter { person in
            return (person.name ?? "") .lowercased().contains(text.lowercased()) ||
                   (person.surname ?? "") .lowercased().contains(text.lowercased())
        }
        tableView.reloadData()
    }
    
    @objc func showSearchBar() {
        setUpSearch()
        searchHeader.backButton.addTarget(self, action: #selector(hideSearchBar), for: .touchUpInside)
    }
    
    @objc func hideSearchBar() {
        searchHeader.removeFromSuperview()
        getAllItems()
    }
    
    //MARK: - DropDown Functions
    //Function for closing drop down menu when clicking outside of it
    @objc func handleTapOutsideDropDown(_ gestureRecognizer: UITapGestureRecognizer) {
        let tapLocation = gestureRecognizer.location(in: self.view)
        
        if !dropDownMenu.frame.contains(tapLocation) && !sortDropDown.frame.contains(tapLocation) {
            dropDownMenu.removeFromSuperview()
        }

        if !sortDropDown.frame.contains(tapLocation) {
            sortDropDown.removeFromSuperview()
        }
    }
    
    @objc func moreOptionTap() {
        setUpDropDown()
        dropDownMenu.deleteAllButton.addTarget(self, action: #selector(deleteAllTap), for: .touchUpInside)
    }
    
    @objc func deleteAllTap() {
        showAlertWithConfirmation()
    }
    
    @objc func sortByTap() {
        setUpSortDropDown()
        sortDropDown.sortOptionsButton.addTarget(self, action: #selector(backToFirstDropDown), for: .touchUpInside)
        
        sortDropDown.azButton.addTarget(self, action: #selector(sortAZ), for: .touchUpInside)
        
        sortDropDown.zaButton.addTarget(self, action: #selector(sortZA), for: .touchUpInside)
    }
    
    @objc func backToFirstDropDown() {
        sortDropDown.removeFromSuperview()
    }
    
    @objc private func sortAZ() {
        models.sort {($0.name ?? "").lowercased() < ($1.name ?? "").lowercased()}
        tableView.reloadData()
    }
    
    @objc private func sortZA() {
        models.sort {($0.name ?? "").lowercased() > ($1.name ?? "").lowercased()}
        tableView.reloadData()
    }
    
    //MARK: - Alert Functions
    
    private func showAlertWithConfirmation() {
        let alertController = UIAlertController(title: "Delete Everthing?", message: "Are you sure you want to remove everything?", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "YES", style: .default) { _ in
            self.performConfirmedAction()
        }
        
        let cancelAction = UIAlertAction(title: "NO", style: .cancel, handler: nil)
        confirmAction.setValue(UIColor.red, forKey: "TitleTextColor")
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func performConfirmedAction() {
        ContactsManager.shared.deleteAllItems()
        getAllItems()
        dropDownMenu.removeFromSuperview()
    }
    
    
    // MARK: - CoreData Functions

    func getAllItems() {
        models = ContactsManager.shared.getAllItems()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        setUpTableView()
    }
    
    //MARK: - Miscellaneous
    
    func addToView(_ element: UIView) {
        self.view.addSubview(element)
        element.translatesAutoresizingMaskIntoConstraints = false
    }
    

}
