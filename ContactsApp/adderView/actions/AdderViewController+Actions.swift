//
//  AdderViewController+Actions.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 15/05/2023.
//

import UIKit

extension AdderViewController: UITextFieldDelegate{
    
    // MARK: - Protocol Functions
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        textField.text = newText
        
        if (!nameInputField.text!.isEmpty && !surnameInputField.text!.isEmpty && numberInputField.text!.count == 13){
            setUpAddButton()
        }else {
            headerView.delButton()
        }

        return false
    }
    
    // MARK: - BackButton Functions
    
    @objc func backButtonTap() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - AddButton Functions
    
    func setUpAddButton() {
        headerView.setUpAddButton()
        headerView.addButton.addTarget(self, action: #selector(addButtonTap), for: .touchUpInside)
    }
    
    @objc func addButtonTap() {
        if oldName.isEmpty {
            createItem(name: nameInputField.text!, surname: surnameInputField.text!, number: numberInputField.text!)
            dismiss(animated: true) { [weak self] in
                self?.delegate?.presentedViewControllerDismissed()
            }
        } else {
            updateItem(item: oldContact!, newName: nameInputField.text!, newSurname: surnameInputField.text!, newNumber: numberInputField.text!)
        }
    }

    // MARK: - CoreData Functions
    
    func createItem(name: String, surname: String, number: String) {
        let item = Contact(context: context)
        item.name = name
        item.surname = surname
        item.number = number
        do {
            try context.save()
        }
        catch {
            print(error)
        }
        
    }
    
    func updateItem(item: Contact, newName: String, newSurname: String, newNumber: String) {
        item.name = newName
        item.surname = newSurname
        item.number = newNumber
        do {
            try context.save()
        }
        catch {
            print(error)
        }
        dataDelegate?.passData(data: item)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - Miscellaneous
    
    func addToView(_ element: UIView){
        self.view.addSubview(element)
        element.translatesAutoresizingMaskIntoConstraints = false
    }
}
