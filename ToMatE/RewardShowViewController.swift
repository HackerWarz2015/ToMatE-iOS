//
//  RewardShowViewController.swift
//  ToMatE
//
//  Created by minami on 6/7/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import UIKit

class RewardShowViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let cellIdentifer = "rewardCollectionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    func setInfoToCell(cell:RewardCollectionViewCell, indexPath: NSIndexPath) {
        cell.bigCircle.hidden = true
        cell.detailLabel.hidden = true
        if indexPath.item == 0 {
            cell.bigCircle.hidden = false
            cell.detailLabel.hidden = false
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let nextVC = self.storyboard?.instantiateViewControllerWithIdentifier("rewardNewVC") as! RewardNewViewController
        nextVC.step = indexPath.row
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    //以下はいじらない
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifer, forIndexPath: indexPath) as! RewardCollectionViewCell
        
    
        if indexPath.item <= 20 {
            cell.smallCircle.backgroundColor = UIColor.TMEMainColor()
        } else {
            cell.smallCircle.backgroundColor = UIColor.lightGrayColor()
        }
        if indexPath.item == 20 {
            cell.stepImage.hidden = false
            cell.smallCircle.hidden = true
        } else {
            cell.stepImage.hidden = true
            cell.smallCircle.hidden = false
        }
        
        cell.leftLine.hidden = true
        cell.rightLine.hidden = true
        if indexPath.item % 5 != 0 {
            cell.leftLine.hidden = false
        }
        if indexPath.item % 5 != 4 {
            cell.rightLine.hidden = false
        }
        
        cell.bottomLine.hidden = true
        cell.topLine.hidden = true
        if indexPath.item % 10 == 4 || indexPath.item % 10 == 5 {
            cell.bottomLine.hidden = false
        } else if (indexPath.item % 10 == 0 || indexPath.item % 10 == 9) && indexPath.item != 0 {
            cell.topLine.hidden = false
        }
        
        cell.stepLabel.text = String(indexPath.item+1)
        if indexPath.item % 10 >= 5 && indexPath.item % 10 <= 9 {
            
        }
        
        switch indexPath.item % 10 {
        case 0,1,2,3,4,7:
            cell.stepLabel.text = String(indexPath.item)
        case 5:
            cell.stepLabel.text = String(indexPath.item+4)
        case 6:
            cell.stepLabel.text = String(indexPath.item+2)
        case 8:
            cell.stepLabel.text = String(indexPath.item-2)
        case 9:
            cell.stepLabel.text = String(indexPath.item-4)
        default:
            break
        }
        
        if indexPath.item == 0 {
            cell.detailLabel.text = "start"
            cell.bigCircle.backgroundColor = UIColor.rgb(r: 45, g: 154, b: 208, alpha: 1.0)
        }
        
        setInfoToCell(cell, indexPath: indexPath)
        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            let screenRect = UIScreen.mainScreen().bounds
            let width = screenRect.size.width / 5
            return CGSizeMake(width, width)
    }
}
