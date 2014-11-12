//
//  MyCustomCell.swift
//  SSKTableViewLearning
//
//  Created by Thanawat Soisakhoo on 11/13/2557 BE.
//  Copyright (c) 2557 Thanawat Soisakhoo. All rights reserved.
//

import UIKit

class MyCustomCell: UITableViewCell {

    @IBOutlet var scView: UIScrollView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
