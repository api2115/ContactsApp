//
//  TextLabel.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 16/05/2023.
//

import UIKit

class TextLabel: UILabel {

    init(_ size: Int, _ text: String) {
        super.init(frame: .zero)
        self.font = UIFont.boldSystemFont(ofSize: CGFloat(size))
        self.textColor = .black
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
