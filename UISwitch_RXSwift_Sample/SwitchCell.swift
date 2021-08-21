//
//  SwitchCell.swift
//  UISwitch_RXSwift_Sample
//
//  Created by cano on 2021/08/21.
//

import UIKit
import RxSwift
import RxCocoa

class SwitchCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var `switch`: UISwitch!
    
    var disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.disposeBag = DisposeBag() // ここで毎回生成
    }
}
