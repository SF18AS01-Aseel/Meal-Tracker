//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by Aseel Alshohatee on 2/26/19.
//  Copyright © 2019 Aseel Alshohatee. All rights reserved.
//

import UIKit
import SafariServices;

class FoodTableViewController: UITableViewController {
    var meals: [Meal] = [
        Meal(name: "breakfast", food: [
            Food(name: "Milk", description: "from cow"),
            Food(name: "Cereal", description: "crunchy granola"),
            Food(name: "Yogurt", description: "very sour")
            ]),
        
        Meal(name: "lunch", food: [
            Food(name: "Tuna", description: "sandwich"),
            Food(name: "Orange Juice", description: "orange")
            ]),
        
        Meal(name: "supper", food: [
            Food(name: "Steak", description: "meat")
            ])
    ];
   // override func viewDidLoad() {
        //super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
  //  }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals[section].food.count;
    }
 


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)

        // Configure the cell...
        let meal: Meal = meals [indexPath.section];
        let food: Food = meal.food[indexPath.row];
        cell.textLabel?.text = food.name;
        cell.detailTextLabel?.text = food.description;
        return cell;
    }


    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name;
    }
    
    // MARK: - Protocol UITableViewControllerDelegate
    
    //Called when a cell is tapped.
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meal: Meal = meals [indexPath.section];
        let food: Food = meal.food[indexPath.row];
        print("selected \(food.name) in cell number \(indexPath)");
        
        
         var urlComponents: URLComponents = URLComponents();
         urlComponents.scheme = "https";
         urlComponents.host = "en.wikipedia.org"; //English
         urlComponents.path = "/wiki/\(food.name)";    //will change " " to "%20"
         
         guard let url: URL = urlComponents.url else {
         fatalError("could not create url for state \(food.name)");
         }
         
         let safariViewController: SFSafariViewController = SFSafariViewController(url: url);
         present(safariViewController, animated: true);
        
    }
}
