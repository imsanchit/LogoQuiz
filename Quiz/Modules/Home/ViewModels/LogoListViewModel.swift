//
//  LogoListViewModel.swift
//  Quiz
//
//  Created by Sanchit Mittal on 10/04/21.
//

import Foundation
import UIKit

class LogoListViewModel: NSObject {
    
    private let logos: [LogoEntity]
    
    weak var viewController: LogoListViewController?
    
    override init() {
        logos = HomeLogos.homeLogoEntities()
        super.init()
    }
    
}

//MARK:- UICollectionViewDataSource, Delegate and Flow Layout Related Methods
extension LogoListViewModel {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return logos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LogoLevelCollectionViewCell.reuseIdentifier, for: indexPath) as! LogoLevelCollectionViewCell
        cell.configureCell(labelText: "\(indexPath.row)")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let logo = logos[indexPath.row]
        let viewModel: LogoDetailViewModel = LogoDetailViewModel(logo: logo)
        let logoDetailViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "LogoDetailViewController") as! LogoDetailViewController
        logoDetailViewController.viewModel = viewModel
        self.viewController?.navigationController?.pushViewController(logoDetailViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 70) / 4, height: (UIScreen.main.bounds.width - 70) / 4)
    }
}
