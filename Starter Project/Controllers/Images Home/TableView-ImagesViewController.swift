//
//  TableView-ImagesViewController.swift
//  Starter Project
//
//  Created by Newsemicolon on 30/03/2023.
//

import Foundation
import UIKit

extension ImagesViewController: UITableViewDataSource, UITableViewDelegate {
    //MARK: - Table View SetUp
    func setTableView(){
        self.imageTableView.delegate = self
        self.imageTableView.dataSource = self
        imageTableView.rowHeight = UITableView.automaticDimension
        imageTableView.estimatedRowHeight = 100 
        self.imageTableView.register(ImageTableViewCell.Nib(), forCellReuseIdentifier: ImageTableViewCell.identifier)
    }
    //MARK: - DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    //MARK: - DataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath) as! ImageTableViewCell
        
        let image = images[indexPath.row]
        cell.configure(with: image)

        return cell
    }
    //MARK: - Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let image = images[indexPath.row]
        let secondViewController = (self.storyboard?.instantiateViewController(withIdentifier: "ImageDetailsVC") as? ImageDetailsVC)!
        secondViewController.images = image
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }

}
