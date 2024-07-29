//
//  HomeScreenViewController.swift
//  NeoProductApp
//
//  Created by Neo on 11/07/24.
//

import UIKit
import SideMenu

class HomeScreenViewController: UIViewController {
    @IBOutlet weak var displayCollectionView: UICollectionView!
    var name: String?
    var email: String?
    
    
    var menu: SideMenuNavigationController?
    let images = [
        ["Cupboards01", "Diningtable", "Chairs01", "coffeetable"],
        ["table", "sofa"],
        ["chair", "cupboard-icon"]
    ]
    let categoryname = [[],["table", "sofa"],
                        ["chair", "cupboard"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        navigationItem.backButtonTitle = " "
        sideMenuSetUp(email: email ?? "", name: name ?? "")
    }
    
    func sideMenuSetUp(email: String, name: String){
        setTitle("NeoSTORE")
        let sideMenuVC = storyboard?.instantiateViewController(identifier: "SidemenuViewController") as!SidemenuViewController
        sideMenuVC.name = name
        sideMenuVC.email = email
        menu = SideMenuNavigationController(rootViewController: sideMenuVC)
        menu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
    func setUpView(){
        navigationController?.navigationBar.backgroundColor = .red
        navigationController?.navigationBar.tintColor = UIColor.white
        displayCollectionView?.delegate = self
        displayCollectionView?.dataSource = self
       // displayCollectionView.isPagingEnabled = true
       
    
        displayCollectionView?.register(UINib(nibName: "DisplayCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DisplayCollectionViewCell")
        displayCollectionView?.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        
        let leftBarButton = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(menuButtonTapped))
        navigationItem.leftBarButtonItem = leftBarButton
        
        let layout = createCompositionalLayout()
        displayCollectionView.collectionViewLayout = layout
            
    
    }
    
    @objc func menuButtonTapped(){
        present(menu!, animated: true)
    }
}

extension HomeScreenViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return images[0].count
        case 1, 2:
            return 2
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DisplayCollectionViewCell", for: indexPath) as! DisplayCollectionViewCell
            cell.diaplayImage.image = UIImage(named: images[indexPath.section][indexPath.item])
            cell.pageControl.currentPage = indexPath.row
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            
            cell.categoryname.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8).isActive = false
            cell.categoryname.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 8).isActive = false
            cell.categoryname.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: 8).isActive = false
            cell.categoryname.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: 8).isActive = false
            
            cell.categoryImage.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8).isActive = false
            cell.categoryImage.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 8).isActive = false
            cell.categoryImage.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: 8).isActive = false
            cell.categoryImage.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: 8).isActive = false
            
            
            
            switch  (indexPath.section, indexPath.item) {
            case (1, 0):
                NSLayoutConstraint.activate([
                    cell.categoryname.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8),
                    cell.categoryname.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: 8),
                    cell.categoryImage.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: 8),
                    cell.categoryImage.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 8)
                ])
                
            case (1, 1):
                NSLayoutConstraint.activate([
                    cell.categoryname.topAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: 8),
                    cell.categoryname.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 8),
                    cell.categoryImage.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8),
                    cell.categoryImage.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: 8)
                ])
            case (2, 0):
                NSLayoutConstraint.activate([
                    cell.categoryname.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8),
                    cell.categoryname.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 8),
                    cell.categoryImage.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: 8),
                    cell.categoryImage.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: 8)
                ])
            case (2, 1):
                NSLayoutConstraint.activate([
                    cell.categoryname.topAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: 8),
                    cell.categoryname.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: 8),
                    cell.categoryImage.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8),
                    cell.categoryImage.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 8)
                ])
                
            default:
                break
                
            }
            if indexPath.section > 0 {
                cell.categoryname.text =  categoryname[indexPath.section][indexPath.item]
                cell.categoryImage.image = UIImage(named: images[indexPath.section][indexPath.item])
                cell.categoryImage.backgroundColor = UIColor.red
            }
            return cell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: UIViewController?
        switch (indexPath.section, indexPath.item) {
        case (1, 0):
             vc = storyboard.instantiateViewController(identifier: "ProductListViewController") as? ProductListViewController
        case (1, 1):
             vc = storyboard.instantiateViewController(identifier: "SofaListViewController") as? SofaListViewController
            
        case (2 , 0):
             vc = storyboard.instantiateViewController(identifier: "ChairsListViewController") as? ChairsListViewController
        case (2, 1):
             vc = storyboard.instantiateViewController(identifier: "CupboardListViewController") as? CupboardListViewController
        default:
            vc = nil
        }
        if let viewController = vc {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, environment in
            switch sectionIndex {
            case 0:
                return self.createHorizontalSection()
            case 1, 2:
                return self.createVerticalSection()
            default:
                return nil}
            }
    }
    
    func createHorizontalSection() -> NSCollectionLayoutSection {
            let screenWidth = UIScreen.main.bounds.width
            let itemWidth = screenWidth
            let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(itemWidth), heightDimension: .absolute(300))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(itemWidth), heightDimension: .absolute(300))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.interGroupSpacing = 10
            
            return section
        }
    
    func createVerticalSection() -> NSCollectionLayoutSection {
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 40) / 2
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(itemWidth), heightDimension: .absolute(itemWidth))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(itemWidth))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 2.5, leading: 10, bottom: 2.5, trailing: 10)
        section.interGroupSpacing = 10
        
        return section
    }
    
}

