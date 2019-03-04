//
//  ViewController.swift
//  ideaMemo
//
//  Created by 古賀賢司 on 2019/03/03.
//  Copyright © 2019 古賀賢司. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let userDefaults = UserDefaults.standard
    
    var memos = ["こんにちは", "goodbye", "さようなら"]
    
    @IBAction func unwindToMemo(sender:UIStoryboardSegue){
        guard let sourceMV = sender.source as? MemoViewController, let memo = sourceMV.memo else {
            return
        }
        if let selectedIndexPath = self.tableView.indexPathForSelectedRow{ //選択している行を代入
            memos[selectedIndexPath.row] = memo //選択している行にmemo(17行目でViewControllerから渡ってきたmemo)を代入
        }
        userDefaults.set(self.memos, forKey: "memos") //データを保存
        tableView.reloadData() //内容を更新して表示
        
    }
    
    @IBAction func unwindToAdd(sender:UIStoryboardSegue){
        guard let sourceAM = sender.source as? AddMemoViewController, let addMemo = sourceAM.addMemo else {
            return
        }
        memos.append(addMemo) //memosに代入
        
        userDefaults.set(self.memos, forKey: "memos") //データを保存
        tableView.reloadData() //内容を更新して表示
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userDefaults.object(forKey: "memos")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = memos[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editMemo"{
            let nav = segue.destination as! UINavigationController
            let mv = nav.topViewController as! MemoViewController
            mv.memo = memos[(tableView.indexPathForSelectedRow?.row)!]
        }else if segue.identifier == "swipeMemo"{
            let sm = segue.destination as! SwipeViewController
            sm.memos.append(contentsOf: self.memos)
        }
    }
    
    
    
  

    
}

