//
//  ViewController.swift
//  hello
//
//  Created by 陆建强 on 2017/2/25.
//  Copyright © 2017年 陆建强. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let reuseIdentifier = "cell"
    var names = ["1", "2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"]
    @IBOutlet var imageUp: UIImageView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        //let url = URL(string: "file:///Users/lujianqiang/Development/iOS/golmoji/1.png")
        //let data = try! Data(contentsOf: url!)
        //cell.image1.image = UIImage(data: data)
        
        cell.image1.image = UIImage(named: "Part/Beard/"+self.names[indexPath.row]+".png")
        cell.backgroundColor = UIColor.red
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        let imageDown = cell.image1 as! SpringImageView
        imageDown.animation = "slideDown"
        imageDown.animate()
        
        imageUp.image = cell.image1.image
        
        print("You selected cell #\(indexPath.item)!")
    }
}





