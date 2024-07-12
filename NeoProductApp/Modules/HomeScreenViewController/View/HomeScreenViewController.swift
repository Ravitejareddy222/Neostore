//
//  HomeScreenViewController.swift
//  NeoProductApp
//
//  Created by Neo on 11/07/24.
//

import UIKit

class HomeScreenViewController: UIViewController {
    @IBOutlet weak var displayCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .red
        navigationController?.navigationBar.tintColor = UIColor.white
        displayCollectionView.delegate = self
        displayCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        displayCollectionView.register(UINib(nibName: "DisplayCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DisplayCollectionViewCell")
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
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

