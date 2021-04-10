//
//  LogoLevelCollectionViewCell.swift
//  Quiz
//
//  Created by Sanchit Mittal on 10/04/21.
//

import UIKit

class LogoLevelCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "LogoLevelCollectionViewCell"
    
    @IBOutlet weak var levelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(labelText: String) {
        self.levelLabel.text = labelText
    }

}
