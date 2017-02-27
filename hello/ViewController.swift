//
//  ViewController.swift
//  hello
//
//  Created by 陆建强 on 2017/2/25.
//  Copyright © 2017年 陆建强. All rights reserved.
//

import UIKit
import Spring


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UIGestureRecognizerDelegate {
    
    
    let reuseIdentifier = "cell"
    var names = ["1", "2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"]

    @IBOutlet var imageUp: UIImageView!
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        
        cell.Image1.image = UIImage(named: "Part/Beard/"+self.names[indexPath.row]+".png")
        
        cell.backgroundColor = UIColor.red
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell

        cell.Image1.animation = "slideDown"
        cell.Image1.animate()
        
        imageUp.image = cell.Image1.image
        
        print("You selected cell #\(indexPath.item)!")
    }
    override func viewDidLoad() {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.wasDragged(_:)))
        
        self.imageUp.addGestureRecognizer(gesture)
        self.imageUp.isUserInteractionEnabled = true
        gesture.delegate = self
    }
    

    @IBAction func wasDragged(_ gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            
            let translation = gestureRecognizer.translation(in: self.view)
            // note: 'view' is optional and need to be unwrapped
            gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y)
            gestureRecognizer.setTranslation(CGPoint.zero, in: self.view)
        }
    }
}





