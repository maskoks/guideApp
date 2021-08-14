//
//  TableViewCell.swift
//  guideApp
//
//  Created by Жеребцов Данил on 11.08.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var serialNumberLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
