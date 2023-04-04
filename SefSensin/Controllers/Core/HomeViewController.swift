//
//  HomeViewController.swift
//  SefSensin
//
//  Created by Mehdican Büyükplevne on 27.02.2023.
//

import UIKit



class HomeViewController: UIViewController {
    
    
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    var homeViewModel = WebServiceViewModel()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        navigationItem.title = "Mutfaklar"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        collectionView.setContentOffset(CGPoint.zero, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - CollectionView Setup
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeCollectionViewCell.nib(), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        homeViewModel.fetchAllData { [weak self] in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

// MARK: - Extensions
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.kitchens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        let model = homeViewModel.kitchens[indexPath.row]
            cell.configure(config: model)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let choosen = homeViewModel.kitchens[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: "RecipeListViewController") as! RecipeListViewController
        vc.recipeListViewModel = choosen.recipes
        let selectedTitle = choosen.kitchenName
        vc.titleName = selectedTitle
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 11
        let outset: CGFloat = 11
        return UIEdgeInsets(top: inset, left: outset, bottom: inset, right: outset)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scroll = scrollView.contentOffset.y
        if scroll > 0 {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
}
