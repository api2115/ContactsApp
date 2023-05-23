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
        self.viewModel.fetchContacts()
        setUpTableView()
    }
    
    //MARK: - Add Button
    
    @objc func addButtonTap() {
        let vm = AdderViewModel(oldContact: nil)
        let vc = AdderViewController(viewModel: vm)
        vc.modalPresentationStyle = .fullScreen
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    //MARK: - SearchBar Functions
    
    private func searchContacts(_ text: String) {
        self.viewModel.fetchContacts()
        var models = self.viewModel.Contacts
        models = models.filter { person in
            return (person.name ?? "") .lowercased().contains(text.lowercased()) ||
                   (person.surname ?? "") .lowercased().contains(text.lowercased())
        }
        self.viewModel.setContacts(models)
    }
    
    @objc func showSearchBar() {
        setUpSearch()
        searchHeader.backButton.addTarget(self, action: #selector(hideSearchBar), for: .touchUpInside)
    }
    
    @objc func hideSearchBar() {
        searchHeader.removeFromSuperview()
        self.viewModel.fetchContacts()
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
        var models = self.viewModel.Contacts
        models.sort {($0.name ?? "").lowercased() < ($1.name ?? "").lowercased()}
        self.viewModel.setContacts(models)
    }
    
    @objc private func sortZA() {
        var models = self.viewModel.Contacts
        models.sort {($0.name ?? "").lowercased() > ($1.name ?? "").lowercased()}
        self.viewModel.setContacts(models)
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
        self.viewModel.deleteAllContacts()
        setUpTableView()
    }
    
    //MARK: - Miscellaneous
    
    func addToView(_ element: UIView) {
        self.view.addSubview(element)
        element.translatesAutoresizingMaskIntoConstraints = false
    }
    

}
