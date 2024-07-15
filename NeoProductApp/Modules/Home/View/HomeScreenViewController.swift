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
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var menu: SideMenuNavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        let sideMenuVC = storyboard?.instantiateViewController(identifier: "SidemenuViewController") as!SidemenuViewController
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
        categoryCollectionView?.delegate = self
        categoryCollectionView?.dataSource = self
        displayCollectionView?.register(UINib(nibName: "DisplayCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DisplayCollectionViewCell")
        categoryCollectionView?.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        let leftBarButton = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(menuButtonTapped))
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    @objc func menuButtonTapped(){
        present(menu!, animated: true)
    }
}

extension HomeScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == displayCollectionView {
            return 4
        } else if collectionView == categoryCollectionView {
            return 4
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == displayCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DisplayCollectionViewCell", for: indexPath) as! DisplayCollectionViewCell
            return cell
        } else if collectionView == categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

