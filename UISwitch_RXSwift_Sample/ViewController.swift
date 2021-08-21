//
//  ViewController.swift
//  UISwitch_RXSwift_Sample
//
//  Created by cano on 2021/08/21.
//

import UIKit
import Rswift
import RxSwift
import RxCocoa
import NSObject_Rx

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 余計なセルを表示しない
        self.tableView.tableFooterView = UIView()
    }

}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource, UITableViewDelegate  {
    
    // セクション数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // セル数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // 高さ
    func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    // セル
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.switchCell, for: indexPath) else { return UITableViewCell() }
        
        cell.nameLabel.text = "設定 \(indexPath.row + 1)"
        
        // 初期値はここで設定
        cell.switch.setOn(false, animated: false)
        
        // スイッチ ON/OFF 処理
        cell.switch.rx.controlEvent(.valueChanged)
            .withLatestFrom(cell.switch.rx.value)
            .subscribe(onNext : { bool in
                print(bool)
            }).disposed(by: cell.disposeBag)
        
        return cell
    }
    
}
