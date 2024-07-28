//
//  AddressListViewController.swift
//  NeoProductApp
//
//  Created by Neo on 15/07/24.
//

import UIKit

class AddressListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel = AddressViewModel()
    var placeoderViewModel = PlaceOrderViewModel()
    var address = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetUp()
        setUpView()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableViewSetUp(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AddedAddressTableViewCell", bundle: nil), forCellReuseIdentifier: "AddedAddressTableViewCell")
        tableView.register(UINib(nibName: "ButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "ButtonTableViewCell")
    }
    
    func setUpView(){
        // UIBarButtonItem.navigationItem.backBarButtonItem = " "
        self.title = "Address List"
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
        return viewModel.getTableViewCellCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let arrayCount = viewModel.getTableViewCellCount()
        let array =  viewModel.getAddressList()
        if indexPath.row == arrayCount-1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell") as?
            ButtonTableViewCell
            cell?.button.setTitle("PLACE ORDER", for: .normal)
            cell?.button.backgroundColor = UIColor(named: "customred")
            cell?.button.tintColor = UIColor(named: "customWhite")
            let fontSize: CGFloat = 21
            let fontWeight: UIFont.Weight = .bold
            cell?.button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
            cell?.button.addTarget(self, action: #selector(placeOrderNowTapped), for: .touchUpInside)
            
            return cell ?? UITableViewCell()
        } else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddedAddressTableViewCell") as?  AddedAddressTableViewCell
            cell?.addressLabel.text = array[indexPath.row] as? String
            return cell ?? UITableViewCell()
        }
    }
    
    @objc func placeOrderNowTapped(){
        placeoderViewModel.placeOrder(address: address){ [weak self] error in
            guard let self = self else { return }
            if let error = error{
                print("failed to place order:\(error.localizedDescription)")
            } else{
                DispatchQueue.main.async {
                    ShowAlert.showAlert(on: self, title: "Congrats", message: "Order Placed Successfully")
                    let storyboard = UIStoryboard(name: "HomeScreenStoryboard", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "HomeScreenViewController") as? HomeScreenViewController
                    self.navigationController?.pushViewController(vc!, animated: true)
                }
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddedAddressTableViewCell") as?
        AddedAddressTableViewCell
        let array = viewModel.getAddressList()
        address = array[indexPath.row] as? String ?? ""
        
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



