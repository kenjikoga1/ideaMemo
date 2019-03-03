//
//  MemoViewController.swift
//  ideaMemo
//
//  Created by 古賀賢司 on 2019/03/03.
//  Copyright © 2019 古賀賢司. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController {
    
    var memo:String?

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let memo = self.memo{
            textView.text = memo
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        performSegue(withIdentifier: "editMemo", sender: nil) //saveボタンで遷移
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIBarButtonItem, button == saveButton else {
            return
        }
        self.memo = self.textView.text ?? ""
    }
    

}
