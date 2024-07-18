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
       // UIBarButtonItem.navigationItem.backBarButtonItem = " "
        self.title = "Address List"
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
            cell?.editButton.backgroundColor = UIColor(named: "customred")
            cell?.editButton.tintColor = UIColor(named: "customWhite")
            let fontSize: CGFloat = 21
                let fontWeight: UIFont.Weight = .bold
            cell?.editButton.titleLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
            
            
            return cell ?? UITableViewCell()
        } else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddedAddressTableViewCell") as?  AddedAddressTableViewCell

            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddedAddressTableViewCell") as?
        AddedAddressTableViewCell
    
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 60))
        let label = UILabel(frame: CGRect(x: 20, y: 0, width: headerView.frame.width, height: headerView.frame.height))
        label.text = "Shipping Address"
        label.font = .systemFont(ofSize: 18)
        label.textColor = UIColor(named: "black#333333")
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        headerView.addSubview(label)
        return headerView
    }
}



