//
//  CustomTableViewCell.swift
//  binarycounter
//
//  Created by Omar Ihmoda on 1/17/18.
//  Copyright © 2018 Omar Ihmoda. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var delegate: CustomCellDelegate?
    
    @IBOutlet weak var rightLabel: UILabel!
    
    @IBAction func incrementValue(_ sender: UIButton) {
        delegate?.cellButtonTapped(cell: self, increment: true)
    }
    
    @IBAction func decrementValue(_ sender: UIButton) {
        delegate?.cellButtonTapped(cell: self, increment: false)
    }
    
}
 


