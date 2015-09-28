import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, FiltersViewControllerDelegate {

    var businesses: [Business]!
    
    var searchBar : UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 120
        
        self.searchBar = UISearchBar()
        self.searchBar.delegate = self
        self.searchBar.placeholder = "eg. chinese food, burger"
        self.navigationItem.titleView = self.searchBar

        searchBar.text = "Thai"
        search("Thai")
        
//        Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
//            
//            self.businesses = businesses
//            self.tableView.reloadData()
//            
//            for business in businesses {
//                print(business.name!)
//                print(business.address!)
//            }
//        })
        
//        Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
//            self.businesses = businesses
//            
//            for business in businesses {
//                print(business.name!)
//                print(business.address!)
//            }
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        search(searchText)
    }
    
    private func search(term: String) {
        Business.searchWithTerm(term, completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
        
            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        })

        
//        Business.searchWithTerm(
//            term,
//            filters: filters,
//            success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
//                // Make sure that we only display results for the current search term.
//                // This will prevent showing stale results if somebody types quickly.
//                if term == self.searchBar.text {
//                    self.restaurants = (response as NSDictionary)["businesses"] as? NSArray
//                    self.restaurantTableView.reloadData()
//                }
//            },
//            failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
//                NSLog(error.description)
//            }
//        )
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        //searchActive = false;
        self.searchBar.endEditing(true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if businesses != nil {
            return businesses!.count
        } else {
            return 0
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessTableViewCell", forIndexPath: indexPath) as! BusinessTableViewCell
    
        cell.business = businesses[indexPath.row]
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navigationController = segue.destinationViewController as! UINavigationController
        let filtersViewController = navigationController.topViewController as! FiltersViewController
        
        filtersViewController.delegate = self
    }
    
    func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilters filters: [String : AnyObject]) {
        
        let categories = filters["categories"] as? [String]
        
        Business.searchWithTerm("Restaurants", sort: nil, categories: categories, deals: nil) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
    }
    }
}