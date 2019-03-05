//
//  SwipeViewController.swift
//  ideaMemo
//
//  Created by 古賀賢司 on 2019/03/03.
//  Copyright © 2019 古賀賢司. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController {
    
    @IBOutlet weak var backCard: UIView!
    
    @IBOutlet weak var memoTextLabel: UILabel!
    @IBOutlet weak var back: UIButton!
    
    var addMemos = [String]()
    var centerOfCard:CGPoint!
    
    var StratNumber = 0
    var indexNumber = 0
    
    var selectedNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        centerOfCard = backCard.center
        
    }
    
//    func replace() {
//        backCard.center = self.centerOfCard
//        backCard.transform = .identity
//    }
    
//    func randomText(){
//        let random = arc4random_uniform(UInt32(addMemos.count))
//        memoTextLabel.text = addMemos[Int(random)]
//    }

    @IBAction func swipeCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        
        card.center = CGPoint(x: card.center.x + point.x, y: card.center.y + point.y)

        
        let xPointCard = card.center.x - view.center.x
        card.transform = CGAffineTransform(rotationAngle: xPointCard / (view.frame.width / 2) * -0.785)


        if sender.state == UIGestureRecognizer.State.ended{
            UIView.animate(withDuration: 0.2, animations: {
                card.center = self.centerOfCard
                card.transform = .identity
            })
            let random = arc4random_uniform(UInt32(self.addMemos.count))
            self.memoTextLabel.text = self.addMemos[Int(random)]
            indexNumber = Int(random)
        }
        
        
    }
    
    @IBAction func forwardButton(_ sender: Any) {
        
        if indexNumber < addMemos.count{
            self.memoTextLabel.text = self.addMemos[indexNumber]
            indexNumber += 1
        }else if indexNumber >= addMemos.count{
            indexNumber = 0
            self.memoTextLabel.text = self.addMemos[indexNumber]
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        if indexNumber > 0{
            indexNumber -= 1
            self.memoTextLabel.text = self.addMemos[indexNumber]
            
        }else if indexNumber == 0{
            indexNumber = addMemos.count - 1
            self.memoTextLabel.text = self.addMemos[indexNumber]
        }
    }
    
    
}
