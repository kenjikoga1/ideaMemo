//
//  AddMemoViewController.swift
//  ideaMemo
//
//  Created by 古賀賢司 on 2019/03/03.
//  Copyright © 2019 古賀賢司. All rights reserved.
//

import UIKit

class AddMemoViewController: UIViewController {
    
    var addMemo:String?

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIBarButtonItem, button == saveButton else {
            return
        }
        self.addMemo = self.textView.text ?? ""
    }
    
    
}
