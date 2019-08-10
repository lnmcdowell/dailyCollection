//
//  Extensions.swift
//  dailyCollection
//
//  Created by Larry Mcdowell on 8/9/19.
//  Copyright © 2019 Larry Mcdowell. All rights reserved.
//

import UIKit

extension UIView {
    
    func doConstraints(top:NSLayoutYAxisAnchor?, left:NSLayoutXAxisAnchor?,bottom:NSLayoutYAxisAnchor?,
                       right:NSLayoutXAxisAnchor?,padTop:CGFloat,padLeft:CGFloat,padBottom:CGFloat,
                       padRight:CGFloat,width:CGFloat,height:CGFloat){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        if let top = top{
            self.topAnchor.constraint(equalTo: top, constant: padTop).isActive = true
        }
        if let left = left {
            self.leadingAnchor.constraint(equalTo: left, constant: padLeft).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: padBottom).isActive = true
        }
        if let right = right {
            self.trailingAnchor.constraint(equalTo: right, constant: padRight).isActive = true
        }
        if width != 0{
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
}
extension UIResponder {
    func next<T: UIResponder>(_ type: T.Type) -> T? {
        return next as? T ?? next?.next(type)
    }
    
}

extension UITableViewCell {
    var tableView: UITableView?{
        return next(UITableView.self)
    }
    
    var indexPath:IndexPath?{
        return tableView?.indexPath(for: self)
    }
}

extension UICollectionViewCell {
    var collectionView: UICollectionView?{
        return next(UICollectionView.self)
    }
}
