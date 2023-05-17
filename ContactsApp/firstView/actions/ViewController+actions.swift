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
        
        let searchString = text!
        do{
            models = try context.fetch(Contact.fetchRequest())
        }
        catch {
            print(error)
        }
        models = models.filter { person in
            return person.name!.lowercased().contains(searchString.lowercased()) ||
                   person.surname!.lowercased().contains(searchString.lowercased())
        }
        tableView.reloadData()
    }
    
    func presentedViewControllerDismissed() {
        getAllItems()
    }
    
    //MARK: - Add Button
    
    @objc func addButtonTap() {
        let vc = AdderViewController(oldContact: nil, oldName: "", oldSurname: "", oldNumber: "")
        vc.modalPresentationStyle = .fullScreen
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    //MARK: - SearchBar Functions
    
    @objc func showSearchBar() {
        setUpSearch()
        searchHeader.backButton.addTarget(self, action: #selector(hideSearchBar), for: .touchUpInside)
    }
    
    @objc func hideSearchBar() {
        searchHeader.removeFromSuperview()
        getAllItems()
    }
    
    //MARK: - DropDown Functions
    
    @objc func handleTapOutsideDropDown(_ gestureRecognizer: UITapGestureRecognizer) {
        let tapLocation = gestureRecognizer.location(in: self.view)
        
        if !dropDownMenu.frame.contains(tapLocation) && !sortDropDown.frame.contains(tapLocation)  {
            dropDownMenu.removeFromSuperview()
        }

        if !sortDropDown.frame.contains(tapLocation) {
            sortDropDown.removeFromSuperview()
        }
    }
    
    @objc func moreOptionTap() {
        setUpDropDown()
        dropDownMenu.deleteAll.addTarget(self, action: #selector(deleteAllTap), for: .touchUpInside)
    }
    
    @objc func deleteAllTap() {
        showAlertWithConfirmation()
    }
    
    @objc func sortByTap() {
        setUpSortDropDown()
        sortDropDown.sortOptions.addTarget(self, action: #selector(backToFirstDropDown), for: .touchUpInside)
        
        sortDropDown.azButton.addTarget(self, action: #selector(sortAZ), for: .touchUpInside)
        
        sortDropDown.zaButton.addTarget(self, action: #selector(sortZA), for: .touchUpInside)
    }
    
    @objc func backToFirstDropDown() {
        sortDropDown.removeFromSuperview()
    }
    
    @objc func sortAZ() {
        models.sort { $0.name!.lowercased() < $1.name!.lowercased()}
        tableView.reloadData()
    }
    
    @objc func sortZA() {
        models.sort { $0.name!.lowercased() > $1.name!.lowercased()}
        tableView.reloadData()
    }
    
    //MARK: - Alert Functions
    
    func showAlertWithConfirmation() {
        let alertController = UIAlertController(title: "Delete Contacts", message: "Are you sure you want to remove everything?", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "YES", style: .default) { _ in
            self.performConfirmedAction()
        }
        
        let cancelAction = UIAlertAction(title: "NO", style: .cancel, handler: nil)
        confirmAction.setValue(UIColor.red, forKey: "TitleTextColor")
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func performConfirmedAction() {
        deleteAllItems()
        dropDownMenu.removeFromSuperview()
    }
    
    
    // MARK: - CoreData Functions
    
    func deleteAllItems() {
        for model in models {
            context.delete(model)
        }
        do {
            try context.save()
            getAllItems()
        }
        catch {
            print(error)
        }
    }
    
    func getAllItems() {
        do {
            models = try context.fetch(Contact.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            setUpTableView()
        }
        catch {
            print(error)
        }
    }
    
    //MARK: - Miscellaneous
    
    func addToView(_ element: UIView) {
        self.view.addSubview(element)
        element.translatesAutoresizingMaskIntoConstraints = false
    }
    

}
