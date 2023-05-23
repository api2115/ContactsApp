//
//  FieldLabel.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 15/05/2023.
//

import UIKit

class TextFieldNameLabel: UILabel {

    init(_ text: String) {
        super.init(frame: .zero)
        self.font = UIFont.systemFont(ofSize: 16)
        self.textColor = .black
        self.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
