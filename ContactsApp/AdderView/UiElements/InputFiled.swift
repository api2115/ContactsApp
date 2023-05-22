//
//  InputView.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 15/05/2023.
//

import UIKit

class InputField: UITextField {
    
    
    init(_ placeholder: String) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor(named: "DefaultColor")
        self.layer.cornerRadius = 2
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(named: "GreyColor")?.cgColor
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(named: "GreyColor") ?? .gray]
        let attributedPlaceholder = NSAttributedString(string: placeholder, attributes: placeholderAttributes)
        self.attributedPlaceholder = attributedPlaceholder
        self.textColor = .black

        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftViewMode = .always
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
