//
//  SearchViewController.swift
//  SefSensin
//
//  Created by Mehdican Büyükplevne on 28.02.2023.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: Properties
    var data = WebServiceViewModel()
    var filteredRecipes: [Recipe] = []
    
    // MARK: Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarDelegate()
        setupTableView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        tableView.setContentOffset(CGPoint.zero, animated: true)
        searchBar.text = ""
        segmentedControl.selectedSegmentIndex = 0
        filteredRecipes = data.kitchens.flatMap({$0.recipes})
        filteredRecipes.shuffle()
        tableView.reloadData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - Search Bar Setup
    private func searchBarDelegate() {
        searchBar.delegate = self
    }
    
    // MARK: Table View Setup
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SearchTableViewCell.nib(), forCellReuseIdentifier: SearchTableViewCell.identifier)
        data.fetchAllData {
            DispatchQueue.main.async {
                self.filteredRecipes = self.data.kitchens.flatMap({$0.recipes})
                self.filteredRecipes.shuffle()
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Segmented Action
    @IBAction func selectSegmented(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            filteredRecipes = self.data.kitchens.flatMap({$0.recipes})
            filteredRecipes.shuffle()
            tableView.reloadData()
        case 1:
            filteredRecipes = self.data.kitchens.flatMap({ $0.recipes }).filter { $0.foodName.contains("Salata")}
            tableView.reloadData()
            searchBar.text = ""
        case 2:
            filteredRecipes = self.data.kitchens.flatMap({$0.recipes}).filter {$0.foodName.contains("Pizza")}
            searchBar.text = ""
            tableView.reloadData()
        case 3:
            let keywords = ["Kabak", "Tamale", "İmam", "Okono", "Kimc", "Lahana"]
            filteredRecipes = data.kitchens.flatMap({$0.recipes}).filter { recipe in
                return keywords.contains { keyword in
                    recipe.foodName.range(of: keyword, options: .caseInsensitive) != nil
                }
            }
            searchBar.text = ""
            tableView.reloadData()
        case 4:
            let keywords = ["Chebekia","Kurabiye","Çikolata","Tatin","Creme", "Sfenj"]
            filteredRecipes = data.kitchens.flatMap({$0.recipes}).filter({ recipe in
                return keywords.contains { keyword in
                    recipe.foodName.range(of: keyword, options: .caseInsensitive) != nil
                }
            })
            searchBar.text = ""
            tableView.reloadData()
        case 5:
            let keywords = ["Çorba", "Ribol"]
            filteredRecipes = data.kitchens.flatMap({$0.recipes}).filter({ recipe in
                return keywords.contains { keyword in
                    recipe.foodName.range(of: keyword, options: .caseInsensitive) != nil
                }
            })
            searchBar.text = ""
            tableView.reloadData()
        default:
            break
        }
    }
}

// MARK: Extensions
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as! SearchTableViewCell
        let recipe = filteredRecipes[indexPath.row]
        cell.configure(model: recipe)
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let choosen = filteredRecipes[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RecipeDetailViewController") as! RecipeDetailViewController
        vc.viewModel = choosen
        navigationController?.pushViewController(vc, animated: true)
        tabBarController?.tabBar.isHidden = true
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        segmentedControl.selectedSegmentIndex = 0
        let searchQuery = searchText
        if searchQuery.isEmpty {
            filteredRecipes = data.kitchens.flatMap({$0.recipes})
            filteredRecipes.shuffle()
        } else {
            filteredRecipes = data.kitchens.flatMap({$0.recipes}).filter({ recipe in
                let foodName = recipe.foodName
                let options: String.CompareOptions = [.caseInsensitive, .diacriticInsensitive]
                return foodName.range(of: searchQuery, options: options) != nil
            })
        }

        tableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        filteredRecipes = data.kitchens.flatMap({$0.recipes})
        filteredRecipes.shuffle()
        tableView.reloadData()
        segmentedControl.selectedSegmentIndex = 0
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
