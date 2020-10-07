//
//  HorizonatalScrollerTableViewCell.swift
//  Assignment
//
//  Created by Akhil Chauhan on 06/10/20.
//  Copyright © 2020 Akhil Chauhan. All rights reserved.
//

import UIKit

class HorizonatalScrollerTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var data_collectionView: UICollectionView!
    let imageArr = ["Fresh_Veggie","Peppy_Paneer","Margherit","Farmhouse","Fresh_Veggie","Peppy_Paneer","Margherit","Farmhouse"]
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        data_collectionView.delegate = self
        data_collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    
}


extension HorizonatalScrollerTableViewCell:UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)
        let imageView:UIImageView = cell.viewWithTag(200) as! UIImageView
        imageView.image = UIImage.init(named: imageArr[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
