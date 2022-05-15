//
//  ContactTableViewController.swift
//  Endterm1
//
//  Created by Dias Karimov on 14.05.2022.
//

import UIKit

class ContactTableViewController: UITableViewController {

    var model:Model?
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
parseJSON()
      
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return model?.data.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let model = model {
            return model.data[section].id.count
        }
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let text = model?.data[indexPath.section].title
        let anons = model?.data[indexPath.section].anons
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = text
        cell.detailTextLabel?.text = anons
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToChat", sender: self)
    }
  
    private func parseJSON() {
        guard let path = Bundle.main.path(forResource: "Test", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
       
        do {
            let jsonData =  try Data(contentsOf: url)
            model = try JSONDecoder().decode(Model.self, from: jsonData)
            if let model = model {
                print(model)
            } else {
                print("1")
            }
            
        } catch {
            print(error)
        }
    }

}
