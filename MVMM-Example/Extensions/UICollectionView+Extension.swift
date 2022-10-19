//
//  UICollectionView+Extension.swift
//  MVMM-Example
//
//  Created by Enes Sancar on 16.10.2022.
//

import UIKit

extension UICollectionView {
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
