//
//  ViewController.swift
//  Assignment
//
//  Created by Akhil Chauhan on 06/10/20.
//  Copyright © 2020 Akhil Chauhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataTable_view: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
