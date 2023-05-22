//
//  TableFunctions.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 17/05/2023.
//

import UIKit

extension DetailedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return callHistory.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight: CGFloat = 70.0
        return cellHeight
    }
    //Cell data function
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableViewCell
        cell.backgroundColor = .white
        cell.textLabel?.text = callHistory[indexPath.row][0]
        cell.textLabel?.textColor = .black
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        
        cell.subtextLabel.text = callHistory[indexPath.row][1]
        
        let image = UIImage(named: callHistory[indexPath.row][2])
        let templateImage = image?.withRenderingMode(.alwaysTemplate)
        cell.arrow.image = templateImage
        cell.arrow.tintColor = .gray
        
        cell.rightLabel.text = callHistory[indexPath.row][3]
        
        if callHistory[indexPath.row][4] == "missed" {
            let color = UIColor(named: "RedTextColor")
            cell.textLabel?.textColor = color
            cell.arrow.tintColor = color
        }
        
        return cell
    }
}
