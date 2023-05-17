//
//  IconView.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 16/05/2023.
//

import UIKit

class IconView: UIImageView {

    init(_ name: String) {
        super.init(frame: .zero)
        self.isUserInteractionEnabled = true
        if (UIImage(named: name) != nil) {
            self.image = UIImage(named: name)
        } else {
            self.image = UIImage(systemName: name)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
