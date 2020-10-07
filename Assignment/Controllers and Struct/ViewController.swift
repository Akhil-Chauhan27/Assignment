//
//  ViewController.swift
//  Assignment
//
//  Created by Akhil Chauhan on 06/10/20.
//  Copyright © 2020 Akhil Chauhan. All rights reserved.
//

import UIKit



struct Data{
    
    var opened = Bool()
    var title = String()
    var sectionData = [[String:Any]]()
    
}


class ViewController: UIViewController {

    @IBOutlet weak var dataTable_view: UITableView!
    
    var tableData = [Data]()
    
    fileprivate var segueIdentifier = "showItemSegue"
    var selectedCell:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.dataTable_view.delegate = self
        self.dataTable_view.dataSource = self
        self.dataTable_view.tableFooterView = UIView()
        self.dataTable_view.estimatedRowHeight = 200
        
        tableData = [Data(opened: false, title: "", sectionData: [[:]]),
                     Data(opened: false, title: "Pizza", sectionData: [["image":"Farmhouse", "name":"Farmhouse", "description":"A pizza that goes ballistic on veggies! Check out this mouth watering overload of crunchy, crisp capsicum, succulent mushrooms and fresh tomatoes."],
                                                                       ["image":"Fresh_Veggie", "name":"Fresh veggie", "description":"Onion I Capsicum."],
                                                                       ["image":"Peppy_Paneer", "name":"Peppy paneer", "description":"Chunky paneer with crisp capsicum and spicy red pepper - quite a mouthful!"],
                                                                       ["image":"Margherit", "name":"Margherit", "description":"A hugely popular margherita, with a deliciously tangy single cheese topping."]]),
                     
        Data(opened: false, title: "Burger", sectionData: [["image":"Cheese Delux", "name":"Cheese delux", "description":" Cheese Deluxe is a fresh take on a Quarter Pounder® classic burger. Crisp leaf lettuce and three Roma tomato slices top a ¼ lb."],
                                                           ["image":"Big Mac", "name":"Big mac", "description":"Mouthwatering perfection starts with two 100% pure beef patties and Big Mac sauce sandwiched between a sesame seed bun."],
                                                           ["image":"Hamburger", "name":"Hamburger", "description":"One or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun."],
                                                           ["image":"McDouble", "name":"McDouble", "description":"100% pure beef patties seasoned with just a pinch of salt and pepper."]]),
        
        Data(opened: false, title: "Beverage", sectionData: [["image":"sprite", "name":"Sprite", "description":"Clean, crisp, lemon-lime taste, Sprite quenches your thirst and helps you keep your cool."],
                                                             ["image":"vanila", "name":"Vanila shake", "description":"Milk, Sugar, Cream, Corn Syrup, Natural Flavor, Mono and Diglycerides, Cellulose Gum, Guar Gum, Carrageenan, Vitamin A Palmitate."],
                                                             ["image":"choco", "name":"Choco shake", "description":"Blended milk, chocolate syrup and chocolate ice cream."],
                                                             ["image":"fanta", "name":"Fanta", "description":"Fruit-flavored carbonated soft drinks."]]),
        
        Data(opened: false, title: "Snacks", sectionData: [["image":"French_fries", "name":"French fries", "description":"Slices of fried potatos."],
                                                           ["image":"apple_slice", "name":"Apple Slice", "description":"Slices of fine apple."],
                                                           ["image":"chocoChips", "name":"Choco Chips", "description":"Chocolate chips with peanuts."]])]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.dataTable_view.reloadData()
    }
    
    // Mark: Shadow
    
    func shadowMaker(backView:UIView){
        backView.layer.cornerRadius = 10
        backView.layer.shadowColor = UIColor.gray.cgColor
        backView.layer.shadowRadius = 5.0
        backView.layer.shadowOpacity = 2.0
        backView.layer.shadowOffset = CGSize.init(width:2.0, height:2.0)
    }
    
    // Mark: Actions
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let _V = segue.destination as? ItemViewController
            if let _d = sender as? [String:Any]{
                _V?.selectedData = _d
            }
        }
    }
    
}

// Mark: Table view delegates

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableData[section].opened == true{
            return tableData[section].sectionData.count + 1
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "sectionZeroCell") else{ return UITableViewCell() }
            return cell
            
        }else{
            if indexPath.row == 0{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "dataSection") else{ return UITableViewCell() }
                let lbl_name:UILabel = cell.viewWithTag(100) as! UILabel
                let backView:UIView = cell.viewWithTag(99) as! UIView
                lbl_name.text = tableData[indexPath.section].title
                self.shadowMaker(backView: backView)
                backView.backgroundColor = UIColor.init(red: 255, green: 0, blue: 0, alpha: 1.0)
                return cell
            }else{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as? ItemTableViewCell else{ return UITableViewCell() }
                let _data = tableData[indexPath.section].sectionData[indexPath.row - 1]
                cell.imageView?.image = nil
                if let _name = _data["name"],let _image = _data["image"], let description = _data["description"]{
                    cell.lbl_name.text = "\(_name)"
                    cell.img_item.image = UIImage.init(named: "\(_image)")
                    cell.lbl_description.text = "\(description)"
                }
                self.shadowMaker(backView: cell.background_view)
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if tableData[indexPath.section].opened == true{
                tableData[indexPath.section].opened = false
                let section = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(section, with: .none)
            }else{
                tableData[indexPath.section].opened = true
                let section = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(section, with: .none)
            }
        }else{
            self.performSegue(withIdentifier: segueIdentifier, sender: tableData[indexPath.section].sectionData[indexPath.row - 1])
            
            //        self.selectedCell = !selectedCell
            //        let blur = UIBlurEffect(style: UIBlurEffect.Style.extraLight)
            //        let blurView = UIVisualEffectView(effect: blur)
            //        blurView.removeFromSuperview()
            //        blurView.alpha = 0.3
            //        blurView.frame = cell.contentView.bounds
            //        cell.contentView.addSubview(blurView)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height:CGFloat = 0.0
        if indexPath.section == 0{
            height = 110.0
        }else{
            if indexPath.row == 0{
                height = 60.0
            }else{
                height = UITableView.automaticDimension
            }
        }
        return height
    }
    
    
    }
    
