//
//  DetailedViewController+actions.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 16/05/2023.
//

import UIKit

extension DetailedViewController: DataDelegateProtocol {
    
    //MARK: - Protocol Functions
    
    func passData(data: Contact) {
        self.nameLabel.text = (data.name ?? "name") + " " + (data.surname ?? "surname")
        self.numberLabel.text = data.number
    }
    
    //MARK: - BackButton Functions
    
    @objc func backButtonTap() {
        dismiss(animated: true) { [weak self] in
            self?.delegate?.presentedViewControllerDismissed()
        }
    }
    
    //MARK: - EditButton Functions
    
    @objc func handleEdit() {
        let vc = AdderViewController(oldContact: model, oldName: model.name ?? "name", oldSurname: model.surname ?? "surname", oldNumber: model.number ?? "number")
        vc.modalPresentationStyle = .fullScreen
        vc.dataDelegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    //MARK: - DeleteButton Functions
    
    @objc func handleDelete() {
        showAlertWithConfirmation()
    }
    
    //MARK: - Alert Functions
    
    private func showAlertWithConfirmation() {
        let alertController = UIAlertController(title: "Delete Contact", message: "Are you sure you want to remove \(model.name ?? "name") \(model.surname ?? "surname") from your contacts?", preferredStyle: .alert)
        
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
        ContactsManager.shared.deleteItem(item: model)
        
        dismiss(animated: true) { [weak self] in
            self?.delegate?.presentedViewControllerDismissed()
        }
    }
    
    //MARK: - Miscellaneous
    
    func addToView(_ element: UIView) {
        self.view.addSubview(element)
        element.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
