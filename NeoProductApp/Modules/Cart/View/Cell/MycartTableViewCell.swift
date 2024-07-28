//
//  MycartTableViewCell.swift
//  NeoProductApp
//
//  Created by Neo on 18/07/24.
//

import UIKit

class MycartTableViewCell: UITableViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var productCostLabel: UILabel!
    @IBOutlet weak var quantityTextField: UITextField!
    
    let numberPicker = UIPickerView()
    let quantity = Array(1...10)
    var indexPath: Int?
    
    weak var delegate: MyCartTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
       setUpView()
        pickerSetUp()
    }
    
    func setUpView(){
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let rightIcon = UIImageView(frame: CGRect(x:0 , y: 8, width: 12, height: 12))
        rightIcon.image = UIImage(named: "dropdown")
        rightIcon.backgroundColor = UIColor(named: "grey#ededed" )
        rightView.addSubview(rightIcon)
        quantityTextField.rightViewMode = .always
        quantityTextField.rightView = rightView
    }
    
    func pickerSetUp(){
        numberPicker.delegate = self
        numberPicker.dataSource = self
        quantityTextField.inputView = numberPicker
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension MycartTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return quantity.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(quantity[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        quantityTextField.text = "\(quantity[row])"
        if let index = indexPath{
            let qty = Int(quantityTextField.text ?? "") ?? 0
            delegate?.didQuantityChange(quantity: qty, index: index)
        }
       
    }
    
    
}
