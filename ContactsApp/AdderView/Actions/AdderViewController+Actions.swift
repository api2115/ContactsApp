//
//  AdderViewController+Actions.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 15/05/2023.
//

import UIKit

extension AdderViewController: UITextFieldDelegate{
    
    // MARK: - Protocol Functions
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(named: "AdderFormInputBorderColor")?.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField.text!.isEmpty) {
            textField.layer.borderColor = UIColor(named: "GreyColor")?.cgColor
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == numberInputField {
            let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
            let digitsOnly = newText.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
            if digitsOnly.count > 12 {
                return false
            } else {
                textField.text = numberInput(newText)
            }
        } else {
            let newText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            let allowedCharacters = CharacterSet.letters
            let characterSet = CharacterSet(charactersIn: string)
            if newText.count > 15 {
                return false
            }
            if(!allowedCharacters.isSuperset(of: characterSet)) {
                return false
            }
            textField.text = newText
        }
        if (!nameInputField.text!.isEmpty && !surnameInputField.text!.isEmpty && numberInputField.text!.count == 16) {
            setUpAddButton()
        }else {
            headerView.delButton()
        }
        return false
    }
    
    // MARK: - Form Text Functions
    
    //Function for formating number input
    private func numberInput(_ text: String) -> String {
        var newText = text
        if !text.hasPrefix("+988") {
            newText = "+988" + newText
        }
        let digitsOnly = newText.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        var formattedText = "+"
        if digitsOnly.count > 5 {
            let countryCode = digitsOnly.prefix(5)
            formattedText += "\(countryCode) "
            let remainingDigits = digitsOnly.dropFirst(5)
            formattedText += remainingDigits.enumerated().map { index, digit in
                if index == 3 || index == 5 || index == 7 {
                    return " \(digit)"
                }else {
                    return String(digit)
                }
            }.joined()
        } else {
            formattedText += digitsOnly
        }
        return formattedText
    }
    
    // MARK: - BackButton Functions
    
    @objc func backButtonTap() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - AddButton Functions
    
    private func setUpAddButton() {
        headerView.setUpAddButton()
        headerView.addButton.addTarget(self, action: #selector(addButtonTap), for: .touchUpInside)
    }
    
    @objc private func addButtonTap() {
        if oldName.isEmpty {
            ContactsManager.shared.createItem(name: nameInputField.text!, surname: surnameInputField.text!, number: numberInputField.text!)
            dismiss(animated: true) { [weak self] in
                self?.delegate?.presentedViewControllerDismissed()
            }
        } else {
            let item = ContactsManager.shared.updateItem(item: oldContact!, newName: nameInputField.text!, newSurname: surnameInputField.text!, newNumber: numberInputField.text!)
            dataDelegate?.passData(data: item)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    //MARK: - Miscellaneous
    
    func addToView(_ element: UIView) {
        self.view.addSubview(element)
        element.translatesAutoresizingMaskIntoConstraints = false
    }
}
