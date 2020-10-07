//
//  ItemViewController.swift
//  Assignment
//
//  Created by Akhil Chauhan on 07/10/20.
//  Copyright © 2020 Akhil Chauhan. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    
    @IBOutlet weak var itemImage_img: UIImageView!
    
    @IBOutlet weak var itemName_lbl: UILabel!
    @IBOutlet weak var itemDescription_lbl: UILabel!
    @IBOutlet weak var back_btn: UIButton!
    
    var selectedData = [String:Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        back_btn.layer.cornerRadius = 10
        back_btn.layer.shadowColor = UIColor.gray.cgColor
        back_btn.layer.shadowRadius = 5.0
        back_btn.layer.shadowOpacity = 2.0
        back_btn.layer.shadowOffset = CGSize.init(width:2.0, height:2.0)
        if let name = selectedData["name"], let image = selectedData["image"], let description = selectedData["description"]{
            self.itemName_lbl.text = "\(name)"
            self.itemDescription_lbl.text = "\(description)"
            self.itemImage_img.image  = UIImage.init(named: "\(image)")
        }
    }
    
    @IBAction func back_btnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
