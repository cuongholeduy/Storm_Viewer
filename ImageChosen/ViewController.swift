//
//  ViewController.swift
//  ImageChosen
//
//  Created by Duy Cuong on 08/11/2022.
//

import UIKit

class ViewController: UITableViewController {
    var pictures: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.text = pictures[indexPath.row]
        cell.contentConfiguration = cellConfig
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImaged = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

