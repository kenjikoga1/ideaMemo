//
//  SwipeViewController.swift
//  ideaMemo
//
//  Created by 古賀賢司 on 2019/03/03.
//  Copyright © 2019 古賀賢司. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController {
    
    var memos = [String]()

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(memos)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
