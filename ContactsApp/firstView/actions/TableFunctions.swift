//
//  TableFunctions.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 17/05/2023.
//

import UIKit

// MARK: - TableView Functions
extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight: CGFloat = 70.0
        return cellHeight
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ImageTableViewCell
        cell.textLabel?.text = model.name! + " " + model.surname!
        cell.backgroundColor = UIColor(named: "DefaultColor")
        cell.textLabel?.textColor = .black
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)


        let leftImage = UIImage(named: "ProfileIcon")
        let rightImage = UIImage(named: "PhoneGreenIcon")
        cell.leftImageView.image = leftImage
        cell.rightImageView.image = rightImage
        cell.subtextLabel.text = model.number

        cell.isUserInteractionEnabled = true
        cell.contentView.isUserInteractionEnabled = true

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let genarr = randomCallHistoryGen()
        let vc = DetailedViewController(models[indexPath.row], genarr)
        vc.modalPresentationStyle = .fullScreen
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    
}
