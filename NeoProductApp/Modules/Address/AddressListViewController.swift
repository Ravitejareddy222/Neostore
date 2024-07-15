//
//  AddressListViewController.swift
//  NeoProductApp
//
//  Created by Neo on 15/07/24.
//

import UIKit

class AddressListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AddedAddressTableViewCell", bundle: nil), forCellReuseIdentifier: "AddedAddressTableViewCell")
        tableView.register(UINib(nibName: "EditButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "EditButtonTableViewCell")
        setUpView()
    }
    
    func setUpView(){
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAddressButtonTapped))
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func addAddressButtonTapped(){
        let storyboard = UIStoryboard(name: "AddressStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddAddressViewController") as? AddAddressViewController
        navigationController?.pushViewController(vc!, animated: true)
    }
}

extension AddressListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditButtonTableViewCell") as?
            EditButtonTableViewCell
            cell?.editButton.setTitle("PLACE ORDER", for: .normal)
            
            return cell ?? UITableViewCell()
        } else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddedAddressTableViewCell") as?  AddedAddressTableViewCell

            return cell ?? UITableViewCell()
        }
    }
}
