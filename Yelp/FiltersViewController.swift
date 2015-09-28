//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Mo, Kevin on 9/27/15.
//  Copyright © 2015 Kevin Mo. All rights reserved.
//

import UIKit

@objc protocol FiltersViewControllerDelegate {
    optional func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilters filters: [String:AnyObject])
}

class FiltersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FilterSwitchTableViewCellDelegate {

    @IBOutlet weak var filtersTableView: UITableView!
    
    var categories: [[String:String]]!
    
    weak var delegate: FiltersViewControllerDelegate?
    
    var switchStates = [Int:Bool]()
    
    @IBAction func onCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onSearchButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
       var filters = [String: AnyObject]()
        
        var selectedCategories = [String]()
        
        for (row, isSelected) in switchStates {
            if isSelected {
                selectedCategories.append(categories[row]["code"]!)
            }
        }

        if selectedCategories.count > 0 {
            filters["categories"] = selectedCategories
        }
        
        delegate?.filtersViewController?(self, didUpdateFilters: filters)
    }
    
    @IBOutlet weak var onSearchButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categories = yelpCategories()
        
        self.filtersTableView.delegate = self
        self.filtersTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FilterSwitchTableViewCell", forIndexPath: indexPath) as! FilterSwitchTableViewCell
        
        cell.categoriesFilterLabel.text = categories[indexPath.row]["name"]
        
        cell.delegate = self
        
//        if switchStates[indexPath.row] !=nil {
//            cell.categoriesOnSwitch.on = switchStates[indexPath.row]!
//        } else {
//            cell.categoriesOnSwitch.on = false
//        }
        
        cell.categoriesOnSwitch.on = switchStates[indexPath.row] ?? false
        
        return cell
    }
    
    func switchCell(filterSwitchTableViewCell: FilterSwitchTableViewCell, didChangeValue value: Bool) {
        let indexPath = filtersTableView.indexPathForCell(filterSwitchTableViewCell)!
        
        switchStates[indexPath.row] = value
        
        print("filters view controller got the switch event")
    }
    
    func yelpCategories() -> [[String:String]] {
        return [
            ["name":"Afghan", "code": "afghani"],
            
            ["name":"African", "code": "african"],
            
            ["name":"American (New]", "code": "newamerican"],
            
            ["name":"American (Traditional]", "code": "tradamerican"],
            
            ["name":"Arabian", "code": "arabian"],
            
            ["name":"Argentine", "code": "argentine"],
            
            ["name":"Armenian", "code": "armenian"],
            
            ["name":"Asian Fusion", "code": "asianfusion"],
            
            ["name":"Australian", "code": "australian"],
            
            ["name":"Austrian", "code": "austrian"],
            
            ["name":"Bangladeshi", "code": "bangladeshi"],
            
            ["name":"Barbeque", "code": "bbq"],
            
            ["name":"Basque", "code": "basque"],
            
            ["name":"Belgian", "code": "belgian"],
            
            ["name":"Brasseries", "code": "brasseries"],
            
            ["name":"Brazilian", "code": "brazilian"],
            
            ["name":"Breakfast & Brunch", "code": "breakfast_brunch"],
            
            ["name":"British", "code": "british"],
            
            ["name":"Buffets", "code": "buffets"],
            
            ["name":"Burgers", "code": "burgers"],
            
            ["name":"Burmese", "code": "burmese"],
            
            ["name":"Cafes", "code": "cafes"],
            
            ["name":"Cafeteria", "code": "cafeteria"],
            
            ["name":"Cajun/Creole", "code": "cajun"],
            
            ["name":"Cambodian", "code": "cambodian"],
            
            ["name":"Caribbean", "code": "caribbean"],
            
            ["name":"Catalan", "code": "catalan"],
            
            ["name":"Cheesesteaks", "code": "cheesesteaks"],
            
            ["name":"Chicken Wings", "code": "chicken_wings"],
            
            ["name":"Chinese", "code": "chinese"],
            
            ["name":"Comfort Food", "code": "comfortfood"],
            
            ["name":"Creperies", "code": "creperies"],
            
            ["name":"Cuban", "code": "cuban"],
            
            ["name":"Czech", "code": "czech"],
            
            ["name":"Delis", "code": "delis"],
            
            ["name":"Diners", "code": "diners"],
            
            ["name":"Ethiopian", "code": "ethiopian"],
            
            ["name":"Fast Food", "code": "hotdogs"],
            
            ["name":"Filipino", "code": "filipino"],
            
            ["name":"Fish & Chips", "code": "fishnchips"],
            
            ["name":"Fondue", "code": "fondue"],
            
            ["name":"Food Court", "code": "food_court"],
            
            ["name":"Food Stands", "code": "foodstands"],
            
            ["name":"French", "code": "french"],
            
            ["name":"Gastropubs", "code": "gastropubs"],
            
            ["name":"German", "code": "german"],
            
            ["name":"Gluten-Free", "code": "gluten_free"],
            
            ["name":"Greek", "code": "greek"],
            
            ["name":"Halal", "code": "halal"],
            
            ["name":"Hawaiian", "code": "hawaiian"],
            
            ["name":"Himalayan/Nepalese", "code": "himalayan"],
            
            ["name":"Hot Dogs", "code": "hotdog"],
            
            ["name":"Hot Pot", "code": "hotpot"],
            
            ["name":"Hungarian", "code": "hungarian"],
            
            ["name":"Iberian", "code": "iberian"],
            
            ["name":"Indian", "code": "indpak"],
            
            ["name":"Indonesian", "code": "indonesian"],
            
            ["name":"Irish", "code": "irish"],
            
            ["name":"Italian", "code": "italian"],
            
            ["name":"Japanese", "code": "japanese"],
            
            ["name":"Korean", "code": "korean"],
            
            ["name":"Kosher", "code": "kosher"],
            
            ["name":"Laotian", "code": "laotian"],
            
            ["name":"Latin American", "code": "latin"],
            
            ["name":"Live/Raw Food", "code": "raw_food"],
            
            ["name":"Malaysian", "code": "malaysian"],
            
            ["name":"Mediterranean", "code": "mediterranean"],
            
            ["name":"Mexican", "code": "mexican"],
            
            ["name":"Middle Eastern", "code": "mideastern"],
            
            ["name":"Modern European", "code": "modern_european"],
            
            ["name":"Mongolian", "code": "mongolian"],
            
            ["name":"Moroccan", "code": "moroccan"],
            
            ["name":"Pakistani", "code": "pakistani"],
            
            ["name":"Persian/Iranian", "code": "persian"],
            
            ["name":"Peruvian", "code": "peruvian"],
            
            ["name":"Pizza", "code": "pizza"],
            
            ["name":"Polish", "code": "polish"],
            
            ["name":"Portuguese", "code": "portuguese"],
            
            ["name":"Russian", "code": "russian"],
            
            ["name":"Salad", "code": "salad"],
            
            ["name":"Sandwiches", "code": "sandwiches"],
            
            ["name":"Scandinavian", "code": "scandinavian"],
            
            ["name":"Scottish", "code": "scottish"],
            
            ["name":"Seafood", "code": "seafood"],
            
            ["name":"Singaporean", "code": "singaporean"],
            
            ["name":"Slovakian", "code": "slovakian"],
            
            ["name":"Soul Food", "code": "soulfood"],
            
            ["name":"Soup", "code": "soup"],
            
            ["name":"Southern", "code": "southern"],
            
            ["name":"Spanish", "code": "spanish"],
            
            ["name":"Steakhouses", "code": "steak"],
            
            ["name":"Sushi Bars", "code": "sushi"],
            
            ["name":"Taiwanese", "code": "taiwanese"],
            
            ["name":"Tapas Bars", "code": "tapas"],
            
            ["name":"Tapas/Small Plates", "code": "tapasmallplates"],
            
            ["name":"Tex-Mex", "code": "tex-mex"],
            
            ["name":"Thai", "code": "thai"],
            
            ["name":"Turkish", "code": "turkish"],
            
            ["name":"Ukrainian", "code": "ukrainian"],
            
            ["name":"Uzbek", "code": "uzbek"],
            
            ["name":"Vegan", "code": "vegan"],
            
            ["name":"Vegetarian", "code": "vegetarian"],
            
            ["name":"Vietnamese", "code": "vietnamese"]
        
        ]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
