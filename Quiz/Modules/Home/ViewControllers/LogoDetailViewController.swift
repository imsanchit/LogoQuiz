//
//  LogoDetailViewController.swift
//  Quiz
//
//  Created by Sanchit Mittal on 10/04/21.
//

import UIKit

class LogoDetailViewController: UIViewController {
    
    /** View Model Associated to the Controller */
    var viewModel: LogoDetailViewModel!
    
    @IBOutlet var hintButtons: [UIButton]!
    @IBOutlet weak var answerStackView: UIStackView!
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let score = sharedUserDefaults?.integer(forKey: UDScore) ?? 0
        let scoreButton = UIBarButtonItem( title: "\(score) points", style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItems = [scoreButton]

        imageView.fetchImage(fromURL: viewModel.imageUrl, animated: true)
    }


}

