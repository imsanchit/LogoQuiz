//
//  LogoListViewController.swift
//  Quiz
//
//  Created by Sanchit Mittal on 10/04/21.
//

import UIKit

class LogoListViewController: UIViewController {
    
    private let viewModel: LogoListViewModel = LogoListViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.viewController = self
        collectionView.register(UINib(nibName: LogoLevelCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: LogoLevelCollectionViewCell.reuseIdentifier)
    }

}

//MARK:- This is an Extension of LogoListViewController that conforms to UICollectionViewDataSource, UICollectionViewDelegate and UICollectionViewDelegateFlowLayout Methods
extension LogoListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.viewModel.numberOfSections(in: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.collectionView(collectionView, numberOfItemsInSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.viewModel.collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.viewModel.collectionView(collectionView, didSelectItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.viewModel.collectionView(collectionView, layout: collectionViewLayout, sizeForItemAt: indexPath)
    }
}
